using Society_8777.Repository;
using System.Threading.Tasks;

namespace Society_8777.Interface
{
    public interface IBotService
    {
        Task<IntentResult?> DetectIntentAsync(string message);
        Task<string> ExecuteActionAsync(int intentId, int userId);
        Task<string> BuildResponseAsync(int intentId, string value);
        Task<BotResponse> GenerateResponseAsync(string message, string userId);
        Task AutoLearnAsync(
    string message,
    int detectedIntentId,
    double confidence,
    int? correctIntentId = null);
    }
}