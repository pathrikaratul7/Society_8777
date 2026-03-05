using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.Interface;
using Society_8777.Models;
using System.Data;
using System.Text.RegularExpressions;

namespace Society_8777.Repository
{
    public class BotRepo : IBotService
    {
        private readonly DataBaseContext.DataBaseContext _context;

        private const double MIN_THRESHOLD = 3.0;
        private const double PRIMARY_MULTIPLIER = 3.0;
        private const double SECONDARY_MULTIPLIER = 1.5;
        private const double CONTEXT_BOOST = 1.5;
        private const double PRIORITY_MULTIPLIER = 0.3;
        private const int LEARNING_RATE = 1;
        private const int HIGH_CONFIDENCE_THRESHOLD = 85;
        private const int LOW_CONFIDENCE_THRESHOLD = 45;

        public BotRepo(DataBaseContext.DataBaseContext context)
        {
            _context = context;
        }
        public async Task AutoLearnAsync(
     string message,
     int detectedIntentId,
     double confidence,
     int? correctIntentId = null)
        {
            // ===================== GET PRIMARY KEYWORDS =====================

            var primaryKeywords = await _context.Tbl_BotIntentKeywords
                .Where(x => x.IntentId == detectedIntentId && x.IsPrimary)
                .ToListAsync();

            if (!primaryKeywords.Any())
                return;

            // ===================== SUPERVISED LEARNING =====================

            if (correctIntentId.HasValue)
            {
                foreach (var keyword in primaryKeywords)
                {
                    if (correctIntentId.Value == detectedIntentId)
                    {
                        // User confirmed correct → reward
                        keyword.Weight += LEARNING_RATE;
                    }
                    else
                    {
                        // User corrected → penalize
                        keyword.Weight = Math.Max(1, keyword.Weight - LEARNING_RATE);
                    }
                }
            }
            else
            {
                // ===================== AUTOMATIC CONFIDENCE-BASED LEARNING =====================

                foreach (var keyword in primaryKeywords)
                {
                    if (confidence >= HIGH_CONFIDENCE_THRESHOLD)          // 85+
                    {
                        keyword.Weight += LEARNING_RATE;                  // strong reward
                    }
                    else if (confidence >= LOW_CONFIDENCE_THRESHOLD)      // 45–84
                    {
                        keyword.Weight += 1;                              // medium reward
                    }
                    else                                                  // below 45
                    {
                        keyword.Weight = Math.Max(1, keyword.Weight - LEARNING_RATE);
                    }
                }
            }

            // ===================== INSERT LEARNING LOG =====================

            _context.Tbl_BotLearningLog.Add(new Tbl_BotLearningLog
            {
                Message = message,
                DetectedIntentId = detectedIntentId,
                CorrectIntentId = correctIntentId, // null if no correction
                CreatedDate = DateTime.UtcNow
            });

            await _context.SaveChangesAsync();
        }
        #region ================= TEXT HELPERS =================

        private static string Normalize(string input)
        {
            input = input.ToLowerInvariant();
            input = Regex.Replace(input, @"[^\w\s]", "");
            return input.Trim();
        }

        private static HashSet<string> Tokenize(string input)
        {
            return input.Split(' ', StringSplitOptions.RemoveEmptyEntries)
                        .ToHashSet();
        }

        #endregion

        #region ================= LOAD DATA =================

        private async Task<List<Tbl_BotIntentKeywords>> GetKeywordsAsync()
        {
            return await _context.Tbl_BotIntentKeywords
                                 .AsNoTracking()
                                 .ToListAsync();
        }

        private async Task<Dictionary<int, List<string>>> GetContextsAsync()
        {
            return await _context.Tbl_BotIntentContext
                .AsNoTracking()
                .GroupBy(x => x.IntentId)
                .ToDictionaryAsync(
                    g => g.Key,
                    g => g.Select(x => x.ContextWord.ToLower()).ToList()
                );
        }

        private async Task<Dictionary<long, int>> GetIntentPrioritiesAsync()
        {
            return await _context.Tbl_BotIntentMaster
                                 .AsNoTracking()
                                 .ToDictionaryAsync(x => x.IntentId, x => x.IntentPriority);
        }

        #endregion

        #region ================= INTENT DETECTION =================

        public async Task<IntentResult?> DetectIntentAsync(string message)
        {
            if (string.IsNullOrWhiteSpace(message))
                return null;

            message = Normalize(message);
            var tokens = Tokenize(message);

            var keywords = await GetKeywordsAsync();
            var contexts = await GetContextsAsync();
            var priorities = await GetIntentPrioritiesAsync();

            if (!keywords.Any())
                return null;

            var scores = new List<IntentScore>();

            foreach (var group in keywords.GroupBy(k => k.IntentId))
            {
                int intentId = group.Key;

                double score = 0;
                int primaryMatch = 0;
                int totalMatch = 0;

                foreach (var keyword in group)
                {
                    string key = keyword.Keyword.ToLower();

                    bool matched =
                        message.Contains(key) ||
                        key.Split(' ').All(p => tokens.Contains(p));

                    if (!matched)
                        continue;

                    totalMatch++;

                    if (keyword.IsPrimary)
                    {
                        primaryMatch++;
                        score += keyword.Weight * PRIMARY_MULTIPLIER;
                    }
                    else
                    {
                        score += keyword.Weight * SECONDARY_MULTIPLIER;
                    }
                }

                // 🚨 Enforce at least one primary match
                if (primaryMatch == 0)
                    continue;

                // Context boost (fully DB driven)
                if (contexts.TryGetValue(intentId, out var ctxList))
                {
                    foreach (var ctx in ctxList)
                    {
                        if (message.Contains(ctx))
                            score += CONTEXT_BOOST;
                    }
                }

                // Intent priority boost (DB driven)
                if (priorities.TryGetValue(intentId, out int priority))
                    score += priority * PRIORITY_MULTIPLIER;

                scores.Add(new IntentScore
                {
                    IntentId = intentId,
                    Score = score,
                    PrimaryMatchCount = primaryMatch,
                    TotalMatchCount = totalMatch
                });
            }

            var best = scores
                .OrderByDescending(x => x.PrimaryMatchCount)
                .ThenByDescending(x => x.Score)
                .ThenByDescending(x => x.TotalMatchCount)
                .FirstOrDefault();

            if (best == null || best.Score < MIN_THRESHOLD)
                return null;

            double confidence = CalculateConfidence(best.Score, scores);

            return new IntentResult
            {
                IntentId = best.IntentId,
                Confidence = confidence
            };
        }

        private double CalculateConfidence(double bestScore, List<IntentScore> allScores)
        {
            double totalScore = allScores.Sum(x => x.Score);
            if (totalScore == 0) return 0;

            return Math.Round((bestScore / totalScore) * 100, 2);
        }

        #endregion

        #region ================= EXECUTE STORED PROCEDURE =================

        public async Task<string> ExecuteActionAsync(int intentId, int userId)
        {
            var action = await (
                from ia in _context.Tbl_BotIntentAction
                join a in _context.Tbl_BotAction
                    on ia.ActionId equals a.ActionId
                where ia.IntentId == intentId
                select a
            ).AsNoTracking().FirstOrDefaultAsync();

            if (action == null ||
                !string.Equals(action.ActionType, "SP", StringComparison.OrdinalIgnoreCase))
                return "⚠️ No valid stored procedure configured.";

            var connectionString = _context.Database.GetConnectionString();

            await using var connection = new SqlConnection(connectionString);
            await using var command = new SqlCommand(action.SqlQuery, connection);

            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@UserId", userId);

            await connection.OpenAsync();

            var result = await command.ExecuteScalarAsync();

            return result?.ToString() ?? "0";
        }

        #endregion

        #region ================= RESPONSE TEMPLATE =================

        public async Task<string> BuildResponseAsync(int intentId, string value)
        {
            var template = await _context.Tbl_BotResponseTemplate
                                         .Where(x => x.IntentId == intentId)
                                         .Select(x => x.Template)
                                         .FirstOrDefaultAsync();

            if (string.IsNullOrWhiteSpace(template))
                return value;

            return template.Replace("{value}", value);
        }

        #endregion

        #region ================= FINAL =================

        public async Task<BotResponse> GenerateResponseAsync(string message, string userId)
        {
            if (!int.TryParse(userId, out int uid))
                return new BotResponse("⚠️ Invalid user session.", 0);

            var intentResult = await DetectIntentAsync(message);

            if (intentResult == null)
                return new BotResponse("🤖 Sorry, I couldn’t understand your request.", 0);

            var value = await ExecuteActionAsync(intentResult.IntentId, uid);
            var response = await BuildResponseAsync(intentResult.IntentId, value);

            // ✅ 🔥 CALL LEARNING HERE (AFTER SUCCESSFUL DETECTION)
            await AutoLearnAsync(
    message,
    intentResult.IntentId,
    intentResult.Confidence,
    null
);

            return new BotResponse(response, intentResult.Confidence);
        }

        #endregion
    }

    #region ================= SUPPORT MODELS =================

    public class IntentResult
    {
        public int IntentId { get; set; }
        public double Confidence { get; set; }
    }

    public class IntentScore
    {
        public int IntentId { get; set; }
        public double Score { get; set; }
        public int PrimaryMatchCount { get; set; }
        public int TotalMatchCount { get; set; }
    }

    public class BotResponse
    {
        public string Message { get; set; }
        public double Confidence { get; set; }

        public BotResponse(string message, double confidence)
        {
            Message = message;
            Confidence = confidence;
        }
    }

    #endregion
}