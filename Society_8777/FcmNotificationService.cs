using FirebaseAdmin.Messaging;
namespace Society_8777
{
    

    public class FcmNotificationService
    {
        public async Task SendAsync(
            List<string> tokens,
            string title,
            string body,
            Dictionary<string, string>? data = null)
        {
            if (tokens == null || tokens.Count == 0)
                return;

            var message = new MulticastMessage
            {
                Tokens = tokens,
                Notification = new Notification
                {
                    Title = title,
                    Body = body
                },
                Data = data ?? new Dictionary<string, string>()
            };

            await FirebaseMessaging.DefaultInstance.SendMulticastAsync(message);
        }
    }
}
