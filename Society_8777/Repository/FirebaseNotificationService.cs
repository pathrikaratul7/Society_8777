using FirebaseAdmin;
using FirebaseAdmin.Messaging;
using Google.Apis.Auth.OAuth2;
using Microsoft.EntityFrameworkCore;
using Society_8777.Interface;
using System;
using System.Threading.Tasks;

namespace Society_8777.Repository
{
    public class FirebaseNotificationService : IFireBaseNotification
    {
        private readonly FirebaseApp _firebaseApp;
        private readonly DataBaseContext.DataBaseContext _context;

        public FirebaseNotificationService(DataBaseContext.DataBaseContext context)
        {
            _context = context;
            // Initialize Firebase App with service account (only once)
            if (FirebaseApp.DefaultInstance == null)
            {
                _firebaseApp = FirebaseApp.Create(new AppOptions()
                {
                    Credential = GoogleCredential.FromFile("society8777-firebase-adminsdk8777.json")
                });
            }
            else
            {
                _firebaseApp = FirebaseApp.DefaultInstance;
            }
        }

        public async Task SendGuestNotificationAsync(string guestName, string flatNumber, CancellationToken cancellationToken)
        {
            if (string.IsNullOrEmpty(flatNumber) || string.IsNullOrEmpty(guestName))
                throw new ArgumentException("Guest name and flat number cannot be empty.");

            // Create message to send to specific flat topic
            var message = new Message()
            {
                Topic = $"flat_{flatNumber}",
                Notification = new Notification
                {
                    Title = "Guest Arrival",
                    Body = $"Guest {guestName} is visiting your flat."
                },
                Data = new System.Collections.Generic.Dictionary<string, string>
                {
                    { "GuestName", guestName },
                    { "FlatNumber", flatNumber }
                }
            };

            // Send the message via Firebase Messaging
            string response = await FirebaseMessaging.DefaultInstance.SendAsync(message, cancellationToken);

            Console.WriteLine($"Successfully sent message: {response}");
        }

        public async Task SendGuestArrivalNotificationByFlatAsync(long flatId, string guestName, CancellationToken cancellationToken)
        {
            try
            {
                if (string.IsNullOrEmpty(guestName))
                    throw new ArgumentException("Guest name cannot be empty.");

                // Get flat number only using raw SQL to avoid column mapping issues
                var flatNumber = await _context.tbl_Flat
                    .Where(f => f.FID == flatId && !(f.IsDeleted ?? false))
                    .Select(f => f.FlatNumber)
                    .FirstOrDefaultAsync(cancellationToken);

                if (flatNumber == null)
                {
                    Console.WriteLine($"Flat with ID {flatId} not found or is deleted");
                    return;
                }

                // Get FCM tokens for the flat owner
                var fcmTokens = await _context.tbl_FCMToken
                    .Where(f => f.FlatID == flatId)
                    .Select(f => f.FcmToken)
                    .ToListAsync(cancellationToken);

                if (!fcmTokens.Any())
                {
                    Console.WriteLine($"No FCM tokens found for flat ID {flatId}");
                    return;
                }

                // Create notification message
                var notification = new Notification
                {
                    Title = "Guest Arrival",
                    Body = $"Guest {guestName} has arrived at your flat."
                };

                var data = new System.Collections.Generic.Dictionary<string, string>
                {
                    { "GuestName", guestName },
                    { "FlatNumber", flatNumber ?? "" },
                    { "FlatID", flatId.ToString() }
                };

                // Send message to each FCM token
                foreach (var token in fcmTokens)
                {
                    try
                    {
                        var message = new Message()
                        {
                            Token = token,
                            Notification = notification,
                            Data = data
                        };

                        string response = await FirebaseMessaging.DefaultInstance.SendAsync(message, cancellationToken);
                        Console.WriteLine($"Successfully sent message to token: {response}");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Error sending message to token {token}: {ex.Message}");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in SendGuestArrivalNotificationByFlatAsync: {ex.Message}");
                throw;
            }
        }
    }
}
