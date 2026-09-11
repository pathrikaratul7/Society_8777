using System.Text.Json;
using System.Text.Json.Serialization;
using FirebaseAdmin.Messaging;
using Microsoft.Extensions.Logging;

namespace Society_8777.Services
{
    /// <summary>
    /// FCM service wrapper using Firebase Admin SDK for sending notifications via HTTP v1 API.
    /// Supports text, data, and image notifications.
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

                var notification = new Notification
                {
                    Title = title,
                    Body = body,
                    ImageUrl = string.IsNullOrEmpty(imageUrl) ? null : imageUrl
                };

                var message = new Message
                {
                    Token = fcmToken,
                    Notification = notification,
                    Data = data ?? new Dictionary<string, string>()
                };

                // Add platform-specific configurations if image is provided
                if (!string.IsNullOrEmpty(imageUrl))
                {
                    // Webpush configuration for web browsers
                    message.Webpush = new WebpushConfig
                    {
                        Data = data,
                        Notification = new WebpushNotification
                        {
                            Title = title,
                            Body = body,
                            Icon = imageUrl,
                            Image = imageUrl,
                            Badge = imageUrl
                        }
                    };

                    // Android configuration
                    message.Android = new AndroidConfig
                    {
                        Notification = new AndroidNotification
                        {
                            Title = title,
                            Body = body,
                            Icon = "ic_launcher",
                            ChannelId = "guest_arrival"
                        },
                        Data = data
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

                var message = new Message
                {
                    Topic = topic,
                    Notification = notification,
                    Data = data ?? new Dictionary<string, string>()
                };

                // Add platform-specific configurations if image is provided
                if (!string.IsNullOrEmpty(imageUrl))
                {
                    message.Webpush = new WebpushConfig
                    {
                        Notification = new WebpushNotification
                        {
                            Title = title,
                            Body = body,
                            Icon = imageUrl,
                            Image = imageUrl
                        }
                    };

                    message.Android = new AndroidConfig
                    {
                        Notification = new AndroidNotification
                        {
                            Title = title,
                            Body = body,
                            Icon = "ic_launcher",
                            ChannelId = "guest_arrival"
                        },
                        Data = data
                    };
                }

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