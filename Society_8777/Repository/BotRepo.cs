using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.Interface;
using Society_8777.Models;
using System.Text.RegularExpressions;

namespace Society_8777.Repository
{
    public class BotRepo : IBotService
    {
        private readonly DataBaseContext.DataBaseContext _context;

        public BotRepo(DataBaseContext.DataBaseContext context)
        {
            _context = context;
        }

        // -------------------- LOAD DATA --------------------

        public async Task<IReadOnlyList<Tbl_BotIntentKeywords>> GetIntentKeywordsAsync()
        {
            return await _context.Tbl_BotIntentKeywords
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<Dictionary<int, List<string>>> GetIntentContextsAsync()
        {
            return await _context.Tbl_BotIntentContext
                .AsNoTracking()
                .GroupBy(x => x.IntentId)
                .ToDictionaryAsync(
                    g => g.Key,
                    g => g.Select(x => x.ContextWord.ToLowerInvariant()).ToList()
                );
        }

        // -------------------- TEXT HELPERS --------------------

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

        private static double KeywordMatchScore(HashSet<string> tokens, string keyword)
        {
            var keywordTokens = keyword.Split(' ');
            var matches = keywordTokens.Count(tokens.Contains);
            return (double)matches / keywordTokens.Length;
        }

        // -------------------- INTENT DETECTION --------------------

        public async Task<int?> DetectIntentAsync(string message)
        {
            if (string.IsNullOrWhiteSpace(message))
                return null;

            message = Normalize(message);
            var tokens = Tokenize(message);

            var keywords = await GetIntentKeywordsAsync();
            var contexts = await GetIntentContextsAsync();

            var intentScores = keywords
                .GroupBy(k => k.IntentId)
                .Select(intentGroup =>
                {
                    // ---------- KEYWORD SCORE ----------
                    double keywordScore = intentGroup
                        .Select(k => KeywordMatchScore(tokens, k.Keyword))
                        .Max(); // Best keyword match

                    // ---------- CONTEXT SCORE ----------
                    double contextScore = 0;
                    if (contexts.TryGetValue(intentGroup.Key, out var contextList))
                    {
                        contextScore = contextList
                            .Select(ctx =>
                            {
                                var ctxTokens = Tokenize(ctx);
                                var matchCount = ctxTokens.Count(tokens.Contains);
                                return (double)matchCount / ctxTokens.Count;
                            })
                            .DefaultIfEmpty(0)
                            .Max();
                    }

                    // ---------- FINAL SCORE ----------
                    var finalScore = (keywordScore * 0.7) + (contextScore * 0.3);

                    return new
                    {
                        IntentId = intentGroup.Key,
                        Score = finalScore
                    };
                })
                .OrderByDescending(x => x.Score)
                .ToList();

            var bestMatch = intentScores.FirstOrDefault();

            return bestMatch != null && bestMatch.Score >= 0.35
                ? bestMatch.IntentId
                : null;
        }

        // -------------------- ACTION EXECUTION --------------------

        public async Task<string> ExecuteActionAsync(int intentId, int userId)
        {
            var actions = await _context.Tbl_BotIntentAction
                .FromSqlRaw("EXEC Usp_ExecuteAction @IntentId",
                    new SqlParameter("@IntentId", intentId))
                .AsNoTracking()
                .ToListAsync();

            var action = actions.FirstOrDefault();
            if (action == null || string.IsNullOrWhiteSpace(action.SqlQuery))
                return "0";

            using var command = _context.Database.GetDbConnection().CreateCommand();
            command.CommandText = action.SqlQuery;
            command.Parameters.Add(new SqlParameter("@UserId", userId));

            await _context.Database.OpenConnectionAsync();
            var result = await command.ExecuteScalarAsync();
            await _context.Database.CloseConnectionAsync();

            return result?.ToString() ?? "0";
        }

        // -------------------- RESPONSE TEMPLATE --------------------

        public async Task<string> BuildResponseAsync(int intentId, string value)
        {
            var template = await _context.Tbl_BotResponseTemplate
                .Where(x => x.IntentId == intentId)
                .Select(x => x.Template)
                .FirstOrDefaultAsync();

            return string.IsNullOrWhiteSpace(template)
                ? value
                : template.Replace("{value}", value);
        }

        // -------------------- FINAL ORCHESTRATION --------------------

        public async Task<string> GenerateResponseAsync(string message, string userId)
        {
            if (!int.TryParse(userId, out int uid))
                return "⚠️ Invalid user session.";

            var intentId = await DetectIntentAsync(message);
            if (!intentId.HasValue)
                return "🤖 Sorry, I couldn’t understand your request.";

            var value = await ExecuteActionAsync(intentId.Value, uid);
            return await BuildResponseAsync(intentId.Value, value);
        }
    }
}