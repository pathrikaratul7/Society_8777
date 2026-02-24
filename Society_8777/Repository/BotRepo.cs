using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Repository
{
    public class BotRepo : IBotService
    {
        private readonly DataBaseContext.DataBaseContext _context;

        public BotRepo(DataBaseContext.DataBaseContext context)
        {
            _context = context;
        }

        // 1️⃣ Load intent keywords dynamically from DB
        public async Task<IReadOnlyList<Tbl_BotIntentKeywords>> GetIntentKeywordsAsync()
        {
            return await _context.Tbl_BotIntentKeywords
                .FromSqlRaw("EXEC Usp_DynamicChatBot")
                .AsNoTracking()
                .ToListAsync();
        }

        // 2️⃣ Detect intent dynamically (NO hardcoded keywords)
        public async Task<int?> DetectIntentAsync(string message)
        {
            if (string.IsNullOrWhiteSpace(message))
                return null;

            message = message.Trim().ToLowerInvariant();
            var keywords = await GetIntentKeywordsAsync();

            return keywords
                .FirstOrDefault(k =>
                    !string.IsNullOrEmpty(k.Keyword) &&
                    message.Contains(k.Keyword.ToLowerInvariant()))
                ?.IntentId;
        }

        // 3️⃣ Execute DB-defined action dynamically
        public async Task<string> ExecuteActionAsync(int intentId, int userId)
        {
            // Step 1: Get the SQL query from SP
            //var action = await _context.Tbl_BotIntentAction
            //    .FromSqlRaw("EXEC Usp_ExecuteAction @IntentId", new SqlParameter("@IntentId", intentId))
            //    .AsNoTracking()
            //    .FirstOrDefaultAsync();

            var actions = await _context.Tbl_BotIntentAction
    .FromSqlRaw("EXEC Usp_ExecuteAction @IntentId", new SqlParameter("@IntentId", intentId))
    .AsNoTracking()
    .ToListAsync(); // Materialize SP results

            var action = actions.FirstOrDefault(); // Now safe

            if (action == null || string.IsNullOrWhiteSpace(action.SqlQuery))
                return "0";

            var sqlQuery = action.SqlQuery;

            // Step 2: Execute the SQL query dynamically
            // ⚡ Assumes the SQL returns a single scalar value
            var userParam = new SqlParameter("@UserId", userId);
            string result = null;

            // Use a raw ADO.NET command for scalar execution
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = sqlQuery;
                command.Parameters.Add(userParam);
                command.CommandType = System.Data.CommandType.Text;

                await _context.Database.OpenConnectionAsync();
                var dbResult = await command.ExecuteScalarAsync();
                result = dbResult?.ToString();
                await _context.Database.CloseConnectionAsync();
            }

            return string.IsNullOrWhiteSpace(result) ? "0" : result;
        }

        // 4️⃣ Build response dynamically using template
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

        // 5️⃣ Final chatbot response (PURE orchestration)
        public async Task<string> GenerateResponseAsync(string message, string userId)
        {
            if (!int.TryParse(userId, out int uid))
                return "⚠️ Invalid user session.";

            var intentId = await DetectIntentAsync(message);
            if (!intentId.HasValue)
                return "🤖 Sorry, I couldn't understand your question.";

            var value = await ExecuteActionAsync(intentId.Value, uid);
            return await BuildResponseAsync(intentId.Value, value);
        }
    }
}