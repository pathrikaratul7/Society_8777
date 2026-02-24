using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IBotService
    {
        Task<IReadOnlyList<Tbl_BotIntentKeywords>> GetIntentKeywordsAsync();
        Task<int?> DetectIntentAsync(string message);
        Task<string> ExecuteActionAsync(int intentId, int userId);
        Task<string> BuildResponseAsync(int intentId, string value);
        Task<string> GenerateResponseAsync(string message, string userId);
    }
}