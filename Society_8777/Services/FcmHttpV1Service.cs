using System.Text.Json;
using System.Text.Json.Serialization;
using FirebaseAdmin.Messaging;
using Microsoft.Extensions.Logging;

namespace Society_8777.Services
{
    /// <summary>
    /// FCM service wrapper using Firebase Admin SDK for sending notifications via HTTP v1 API.
    /// Supports text, data, and image notifications across Android, iOS, and Web.
    /// </summary>
    public class FcmHttpV1Service
    {
        private readonly ILogger<FcmHttpV1Service> _logger;

        public FcmHttpV1Service(ILogger<FcmHttpV1Service> logger)
        {
            _logger = logger;
        }

        /// <summary>
        /// Sends a notification to a single device using FCM token with optional image.
        /// </summary>
        public async Task<bool> SendNotificationToDeviceAsync(
            string fcmToken,
            string title,
            string body,
            Dictionary<string, string>? data = null,
            string? imageUrl = null,
            CancellationToken cancellationToken = default)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(fcmToken))
                {
                    _logger.LogWarning("FCM token is empty or null");
                    return false;
                }

                if (string.IsNullOrWhiteSpace(title))
                {
                    title = "Notification";
                }

                if (string.IsNullOrWhiteSpace(body))
                {
                    body = "You have a new notification";
                }

                // Base notification for all platforms
                var notification = new Notification
                {
                    Title = title,
                    Body = body,
                    ImageUrl = string.IsNullOrEmpty(imageUrl) ? null : imageUrl
                };

                // Prepare data dictionary
                var messageData = data ?? new Dictionary<string, string>();

                var message = new Message
                {
                    Token = fcmToken,
                    Notification = notification,
                    Data = messageData
                };

                // Android-specific configuration with image support
                message.Android = new AndroidConfig
                {
                    Priority = Priority.High,
                    Notification = new AndroidNotification
                    {
                        Title = title,
                        Body = body,
                        ChannelId = "guest_arrival",
                        Icon = "icon",
                        Sound = "default",
                        Color = "#FF6B6B", // Red color for guest arrival
                        // Image will be loaded from the notification's ImageUrl
                        ImageUrl = string.IsNullOrEmpty(imageUrl) ? null : imageUrl,
                        ClickAction = "FLUTTER_NOTIFICATION_CLICK"
                    },
                    Data = messageData,
                    FcmOptions = new AndroidFcmOptions
                    {
                        AnalyticsLabel = "guest_arrival_notification"
                    }
                };

                // Webpush configuration for web browsers
                message.Webpush = new WebpushConfig
                {
                    Headers = new Dictionary<string, string>
                    {
                        { "TTL", "86400" } // 24 hours in seconds
                    },
                    Data = messageData,
                    Notification = new WebpushNotification
                    {
                        Title = title,
                        Body = body,
                        Icon = string.IsNullOrEmpty(imageUrl) ? null : imageUrl,
                        Image = string.IsNullOrEmpty(imageUrl) ? null : imageUrl,
                        Badge = string.IsNullOrEmpty(imageUrl) ? null : imageUrl
                    }
                };

                // APNs configuration for iOS
                if (!string.IsNullOrEmpty(imageUrl))
                {
                    message.Apns = new ApnsConfig
                    {
                        Headers = new Dictionary<string, string>
                        {
                            { "apns-priority", "10" }
                        }
                    };
                }

                var response = await FirebaseMessaging.DefaultInstance.SendAsync(message, cancellationToken);

                _logger.LogInformation($"Notification sent successfully. MessageId: {response}, Token: {fcmToken.Substring(0, Math.Min(20, fcmToken.Length))}..., ImageUrl: {imageUrl}");
                return true;
            }
            catch (NullReferenceException nrex)
            {
                _logger.LogError($"NullReferenceException sending notification: {nrex.Message}. FirebaseMessaging.DefaultInstance is null. Ensure Firebase is initialized.");
                return false;
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error sending notification to device: {ex.GetType().Name} - {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Sends notifications to a topic with optional image.
        /// </summary>
        public async Task<bool> SendNotificationToTopicAsync(
            string topic,
            string title,
            string body,
            Dictionary<string, string>? data = null,
            string? imageUrl = null,
            CancellationToken cancellationToken = default)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(topic))
                {
                    _logger.LogWarning("Topic is empty or null");
                    return false;
                }

                if (string.IsNullOrWhiteSpace(title))
                {
                    title = "Notification";
                }

                if (string.IsNullOrWhiteSpace(body))
                {
                    body = "You have a new notification";
                }

                var notification = new Notification
                {
                    Title = title,
                    Body = body,
                    ImageUrl = string.IsNullOrEmpty(imageUrl) ? null : imageUrl
                };

                var messageData = data ?? new Dictionary<string, string>();

                var message = new Message
                {
                    Topic = topic,
                    Notification = notification,
                    Data = messageData
                };

                // Android-specific configuration with image support
                message.Android = new AndroidConfig
                {
                    Priority = Priority.High,
                    Notification = new AndroidNotification
                    {
                        Title = title,
                        Body = body,
                        ChannelId = "guest_arrival",
                        Icon = "icon",
                        Sound = "default",
                        ImageUrl = string.IsNullOrEmpty(imageUrl) ? null : imageUrl,
                        ClickAction = "FLUTTER_NOTIFICATION_CLICK"
                    },
                    Data = messageData,
                    FcmOptions = new AndroidFcmOptions
                    {
                        AnalyticsLabel = "guest_arrival_notification"
                    }
                };

                // Webpush configuration for web browsers
                message.Webpush = new WebpushConfig
                {
                    Notification = new WebpushNotification
                    {
                        Title = title,
                        Body = body,
                        Icon = string.IsNullOrEmpty(imageUrl) ? null : imageUrl,
                        Image = string.IsNullOrEmpty(imageUrl) ? null : imageUrl
                    }
                };

                var response = await FirebaseMessaging.DefaultInstance.SendAsync(message, cancellationToken);

                _logger.LogInformation($"Notification sent to topic '{topic}'. MessageId: {response}");
                return true;
            }
            catch (NullReferenceException nrex)
            {
                _logger.LogError($"NullReferenceException sending to topic: {nrex.Message}. FirebaseMessaging.DefaultInstance is null. Ensure Firebase is initialized.");
                return false;
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error sending notification to topic: {ex.GetType().Name} - {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Sends notifications to multiple devices with optional image.
        /// </summary>
        public async Task<SendMulticastResult> SendNotificationToMultipleDevicesAsync(
            List<string> fcmTokens,
            string title,
            string body,
            Dictionary<string, string>? data = null,
            string? imageUrl = null,
            CancellationToken cancellationToken = default)
        {
            var result = new SendMulticastResult();

            if (fcmTokens == null || fcmTokens.Count == 0)
            {
                _logger.LogWarning("No FCM tokens provided");
                return result;
            }

            foreach (var token in fcmTokens)
            {
                if (string.IsNullOrWhiteSpace(token))
                    continue;

                try
                {
                    var success = await SendNotificationToDeviceAsync(token, title, body, data, imageUrl, cancellationToken);
                    if (success)
                        result.SuccessCount++;
                    else
                        result.FailureCount++;
                }
                catch (Exception ex)
                {
                    _logger.LogError($"Error sending to token {token.Substring(0, Math.Min(20, token.Length))}...: {ex.Message}");
                    result.FailureCount++;
                }
            }

            _logger.LogInformation($"Multicast send complete. Success: {result.SuccessCount}, Failed: {result.FailureCount}");
            return result;
        }
    }

    /// <summary>
    /// Result object for multicast notification sends.
    /// </summary>
    public class SendMulticastResult
    {
        public int SuccessCount { get; set; }
        public int FailureCount { get; set; }
    }
}