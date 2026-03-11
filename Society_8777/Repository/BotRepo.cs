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

        private const double MIN_THRESHOLD = 12;
        private const double PRIMARY_MULTIPLIER = 3;
        private const double SECONDARY_MULTIPLIER = 1.5;
        private const double CONTEXT_BOOST = 2;
        private const double PRIORITY_MULTIPLIER = 0.4;

        private static readonly HashSet<string> StopWords = new()
        {
            "is","am","are","the","a","an","please","can","you",
            "me","my","tell","show","what","which","do","does",
            "i","want","to","know","give","provide"
        };

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
            var tokens = Tokenize(Normalize(message));

            var keywords = await _context.Tbl_BotIntentKeywords
                .Where(x => x.IntentId == detectedIntentId)
                .ToListAsync();

            if (!keywords.Any())
                return;

            foreach (var keyword in keywords)
            {
                var keyTokens = keyword.Keyword
                    .ToLower()
                    .Split(' ', StringSplitOptions.RemoveEmptyEntries);

                bool matched = keyTokens.Any(k => tokens.Contains(k));

                if (!matched)
                    continue;

                if (correctIntentId.HasValue)
                {
                    if (correctIntentId.Value == detectedIntentId)
                        keyword.Weight += 1;
                    else
                        keyword.Weight = Math.Max(1, keyword.Weight - 1);
                }
                else
                {
                    if (confidence >= 85)
                        keyword.Weight += 1;
                    else if (confidence < 40)
                        keyword.Weight = Math.Max(1, keyword.Weight - 1);
                }
            }

            _context.Tbl_BotLearningLog.Add(new Tbl_BotLearningLog
            {
                Message = message,
                DetectedIntentId = detectedIntentId,
                CorrectIntentId = correctIntentId,
                CreatedDate = DateTime.UtcNow
            });

            await _context.SaveChangesAsync();
        }
        #region TEXT HELPERS

        private static string Normalize(string input)
        {
            input = input.ToLowerInvariant();
            input = Regex.Replace(input, @"[^\w\s]", "");
            return input.Trim();
        }

        private static HashSet<string> Tokenize(string input)
        {
            return input.Split(' ', StringSplitOptions.RemoveEmptyEntries)
                .Where(x => !StopWords.Contains(x))
                .ToHashSet();
        }

        #endregion

        #region LOAD DATA

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

        #region INTENT DETECTION

        public async Task<IntentResult?> DetectIntentAsync(string message)
        {
            if (string.IsNullOrWhiteSpace(message))
                return null;

            message = Normalize(message);
            var tokens = Tokenize(message);

            var keywords = await GetKeywordsAsync();
            var contexts = await GetContextsAsync();
            var priorities = await GetIntentPrioritiesAsync();

            var scores = new List<IntentScore>();

            foreach (var group in keywords.GroupBy(x => x.IntentId))
            {
                int intentId = group.Key;

                double score = 0;
                int primaryMatch = 0;
                int totalMatch = 0;

                foreach (var keyword in group)
                {
                    var keyTokens = keyword.Keyword
                        .ToLower()
                        .Split(' ', StringSplitOptions.RemoveEmptyEntries);

                    bool matched = keyTokens.Any(k => tokens.Contains(k));

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

                if (primaryMatch == 0)
                    continue;

                if (contexts.TryGetValue(intentId, out var ctxList))
                {
                    foreach (var ctx in ctxList)
                    {
                        var ctxTokens = Tokenize(ctx);

                        int matchCount = ctxTokens.Count(t => tokens.Contains(t));

                        if (matchCount >= ctxTokens.Count / 2)
                            score += CONTEXT_BOOST * matchCount;
                    }
                }

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

        private double CalculateConfidence(double bestScore, List<IntentScore> scores)
        {
            double secondBest = scores
                .Where(x => x.Score != bestScore)
                .OrderByDescending(x => x.Score)
                .Select(x => x.Score)
                .FirstOrDefault();

            if (secondBest == 0)
                return 100;

            double confidence = ((bestScore - secondBest) / bestScore) * 100;

            return Math.Round(confidence, 2);
        }

        #endregion

        #region EXECUTE ACTION

        public async Task<string> ExecuteActionAsync(int intentId, int userId)
        {
            var action = await (
                from ia in _context.Tbl_BotIntentAction
                join a in _context.Tbl_BotAction
                on ia.ActionId equals a.ActionId
                where ia.IntentId == intentId
                select a
            ).AsNoTracking().FirstOrDefaultAsync();

            if (action == null)
                return "⚠️ Action not configured.";

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

        #region RESPONSE TEMPLATE

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

        #region FINAL

        public async Task<BotResponse> GenerateResponseAsync(string message, string userId)
        {
            if (!int.TryParse(userId, out int uid))
                return new BotResponse("⚠️ Invalid user session.", 0);

            var intent = await DetectIntentAsync(message);

            if (intent == null)
                return new BotResponse("🤖 Sorry, I couldn’t understand your request.", 0);

            var value = await ExecuteActionAsync(intent.IntentId, uid);

            var response = await BuildResponseAsync(intent.IntentId, value);

            // Auto learning
            await AutoLearnAsync(
                message,
                intent.IntentId,
                intent.Confidence,
                null
            );

            return new BotResponse(response, intent.Confidence);
        }

        #endregion
    }
}