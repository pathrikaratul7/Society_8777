using Society_8777.Models;
using Society_8777.Repository;
using System.Threading.Tasks;

namespace Society_8777.Interface
{
    public interface IBotService
    {
        Task<IntentResult?> DetectIntentAsync(string message, CancellationToken cancellationToken);
        Task<string> ExecuteActionAsync(int intentId, int userId, CancellationToken cancellationToken);
        Task<string> BuildResponseAsync(int intentId, string value, CancellationToken cancellationToken);
        Task<BotResponse> GenerateResponseAsync(string message, string userId, CancellationToken cancellationToken);
        Task AutoLearnAsync(
    string message,
    int detectedIntentId,
    double confidence, CancellationToken cancellationToken,
    int? correctIntentId = null);
    }
}