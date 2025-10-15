using FirebaseAdmin;
using FirebaseAdmin.Messaging;
using Google.Apis.Auth.OAuth2;
using Society_8777.Interface;
using System;
using System.Threading.Tasks;

namespace Society_8777.Repository
{
    public class FirebaseNotificationService : IFireBaseNotification
    {
        private readonly FirebaseApp _firebaseApp;

        public FirebaseNotificationService()
        {
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

        public async Task SendGuestNotificationAsync(string guestName, string flatNumber)
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
            string response = await FirebaseMessaging.DefaultInstance.SendAsync(message);

            Console.WriteLine($"Successfully sent message: {response}");
        }
    }
}
