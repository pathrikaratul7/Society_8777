using Microsoft.AspNetCore.Mvc;
using Society_8777.Interface;
using Society_8777.Models;
using Society_8777.Services;

namespace Society_8777.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FcmController : ControllerBase
    {
        private readonly IFCMToken _fcmTokenRepo;
        private readonly FcmHttpV1Service _fcmService;
        private readonly ILogger<FcmController> _logger;

        public FcmController(IFCMToken fcmTokenRepo, FcmHttpV1Service fcmService, ILogger<FcmController> logger)
        {
            _fcmTokenRepo = fcmTokenRepo;
            _fcmService = fcmService;
            _logger = logger;
        }

        [HttpPost("SaveToken")]
        public async Task<IActionResult> SaveToken([FromBody] Tbl_FCMToken request, CancellationToken cancellationToken)
        {
            try
            {
                if (request == null || string.IsNullOrWhiteSpace(request.FcmToken))
                    return new BadRequestObjectResult(new { Message = "Invalid request. Token is required." });

                var result = await _fcmTokenRepo.SaveToken(request, cancellationToken);
                return result ?? StatusCode(500, new { Message = "Failed to save token." });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error saving FCM token");
                return StatusCode(500, new { Message = "Internal server error", Details = ex.Message });
            }
        }

        /// <summary>
        /// Get the latest FCM token for a specific flat by FlatID
        /// </summary>
        [HttpGet("GetLatestTokenByFlatId/{flatId}")]
        public async Task<IActionResult> GetLatestTokenByFlatId(int flatId, CancellationToken cancellationToken)
        {
            try
            {
                _logger.LogInformation($"Getting latest FCM token for FlatID: {flatId}");
                var result = await _fcmTokenRepo.GetLatestTokenByFlatIdAsync(flatId, cancellationToken);
                return result;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error getting latest token for FlatID: {flatId}");
                return StatusCode(500, new { Message = "Internal server error", Details = ex.Message });
            }
        }

        /// <summary>
        /// Get all FCM tokens for a specific flat by FlatID
        /// </summary>
        [HttpGet("GetTokensByFlatId/{flatId}")]
        public async Task<IActionResult> GetTokensByFlatId(int flatId, CancellationToken cancellationToken)
        {
            try
            {
                _logger.LogInformation($"Getting FCM tokens for FlatID: {flatId}");
                var result = await _fcmTokenRepo.GetTokensByFlatIdAsync(flatId, cancellationToken);
                return result;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error getting tokens for FlatID: {flatId}");
                return StatusCode(500, new { Message = "Internal server error", Details = ex.Message });
            }
        }

        /// <summary>
        /// Get all FCM tokens across all flats
        /// </summary>
        [HttpGet("GetAllTokens")]
        public async Task<IActionResult> GetAllTokens(CancellationToken cancellationToken)
        {
            try
            {
                _logger.LogInformation("Getting all FCM tokens");
                var result = await _fcmTokenRepo.GetAllTokensAsync(cancellationToken);
                return result;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error getting all tokens");
                return StatusCode(500, new { Message = "Internal server error", Details = ex.Message });
            }
        }

        [HttpPost("SendGuestNotification")]
        public async Task<IActionResult> SendGuestNotification(
            [FromBody] SendNotificationRequest request,
            CancellationToken cancellationToken)
        {
            try
            {
                _logger.LogInformation("SendGuestNotification called with token: {token}", 
                    request?.FcmToken?.Substring(0, Math.Min(20, request.FcmToken?.Length ?? 0)) + "...");

                if (request == null || string.IsNullOrWhiteSpace(request.FcmToken))
                    return new BadRequestObjectResult(new { Message = "Invalid request. FCM token is required." });

                var data = new Dictionary<string, string>();

                data["type"] = "GUEST_APPROVAL";
                data["guestId"] = request.GID.ToString();

                if (!string.IsNullOrEmpty(request.GuestName))
                    data["guestName"] = request.GuestName;

                if (!string.IsNullOrEmpty(request.GuestMobile))
                    data["guestMobile"] = request.GuestMobile;

                if (!string.IsNullOrEmpty(request.FlatNumber))
                    data["FlatNumber"] = request.FlatNumber;

                if (!string.IsNullOrEmpty(request.FlatId))
                    data["flatId"] = request.FlatId;

                if (!string.IsNullOrWhiteSpace(request.GuestImageUrl))
                    data["guestImageUrl"] = request.GuestImageUrl;

                if (request.CustomData != null)
                {
                    foreach (var item in request.CustomData)
                        data[item.Key] = item.Value;
                }

                var result = await _fcmService.SendNotificationToDeviceAsync(
                    request.FcmToken,
                    request.Title ?? "Guest Arrival",
                    request.Body ?? $"Guest {request.GuestName} has arrived",
                    data,
                    request.GuestImageUrl,
                    cancellationToken);

                if (result)
                    return Ok(new { Message = "Notification sent successfully" });
                else
                    return StatusCode(500, new { Message = "Failed to send notification" });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error sending guest notification");
                return StatusCode(500, new { Message = "Internal server error", Details = ex.Message });
            }
        }

        [HttpPost("SendTopicNotification")]
        public async Task<IActionResult> SendTopicNotification(
            [FromBody] SendTopicNotificationRequest request,
            CancellationToken cancellationToken)
        {
            try
            {
                _logger.LogInformation("SendTopicNotification called with topic: {topic}", request?.Topic);

                if (request == null || string.IsNullOrWhiteSpace(request.Topic))
                    return new BadRequestObjectResult(new { Message = "Invalid request. Topic is required." });

                var result = await _fcmService.SendNotificationToTopicAsync(
                    request.Topic,
                    request.Title ?? "Notification",
                    request.Body ?? "You have a new notification",
                    request.Data,
                    null,
                    cancellationToken);

                if (result)
                    return Ok(new { Message = "Notification sent to topic successfully" });
                else
                    return StatusCode(500, new { Message = "Failed to send notification to topic" });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error sending topic notification");
                return StatusCode(500, new { Message = "Internal server error", Details = ex.Message });
            }
        }
    }
}
