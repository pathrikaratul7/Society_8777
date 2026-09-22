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
        /// <param name="dataOnlyAndroid">
        /// When true (default), Android receives a DATA-ONLY message — no top-level
        /// Notification and no AndroidConfig.Notification block. This is required for
        /// custom-handled notifications (e.g. guest approval) so that
        /// FirebaseMessagingService.OnMessageReceived fires reliably in EVERY app state
        /// (foreground, background, killed). If a notification block is present, Android
        /// auto-displays it from the system tray whenever the app isn't in the foreground
        /// and OnMessageReceived is never called, so custom tap-routing extras are lost.
        /// Set to false only for plain notifications you want the OS to handle by default
        /// (no custom click routing needed).
        /// </param>
        public async Task<bool> SendNotificationToDeviceAsync(
            string fcmToken,
            string title,
            string body,
            Dictionary<string, string>? data = null,
            string? imageUrl = null,
            bool dataOnlyAndroid = true,
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

                // Prepare data dictionary
                var messageData = data ?? new Dictionary<string, string>();

                // For data-only Android delivery, the client reads title/body out of the
                // data payload itself (see MyFirebaseMessagingService fallback logic), so
                // make sure they're always present there.
                if (dataOnlyAndroid)
                {
                    messageData["title"] = title;
                    messageData["body"] = body;
                }

                // Base notification — only attached when NOT doing data-only Android delivery.
                // Webpush/APNs below still get their own notification blocks regardless,
                // since this data-only behavior is specifically an Android tray-handling issue.
                var notification = dataOnlyAndroid
                    ? null
                    : new Notification
                    {
                        Title = title,
                        Body = body,
                        ImageUrl = string.IsNullOrEmpty(imageUrl) ? null : imageUrl
                    };

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
                    // Omitting this is what actually stops Android auto-displaying the
                    // notification and skipping OnMessageReceived when backgrounded/killed.
                    Notification = dataOnlyAndroid
                        ? null
                        : new AndroidNotification
                        {
                            Title = title,
                            Body = body,
                            ChannelId = "guest_arrival",
                            Icon = "icon",
                            Sound = "default",
                            Color = "#FF6B6B", // Red color for guest arrival
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

                _logger.LogInformation($"Notification sent successfully. MessageId: {response}, Token: {fcmToken.Substring(0, Math.Min(20, fcmToken.Length))}..., ImageUrl: {imageUrl}, DataOnlyAndroid: {dataOnlyAndroid}");
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
            bool dataOnlyAndroid = false,
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

                var messageData = data ?? new Dictionary<string, string>();

                if (dataOnlyAndroid)
                {
                    messageData["title"] = title;
                    messageData["body"] = body;
                }

                var notification = dataOnlyAndroid
                    ? null
                    : new Notification
                    {
                        Title = title,
                        Body = body,
                        ImageUrl = string.IsNullOrEmpty(imageUrl) ? null : imageUrl
                    };

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
                    Notification = dataOnlyAndroid
                        ? null
                        : new AndroidNotification
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
            bool dataOnlyAndroid = true,
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
                    var success = await SendNotificationToDeviceAsync(token, title, body, data, imageUrl, dataOnlyAndroid, cancellationToken);
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