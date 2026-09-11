namespace Society_8777.Models
{
    public class SendNotificationRequest
    {
        public string? FcmToken { get; set; }
        public string? GuestName { get; set; }
        public string? FlatNumber { get; set; }
        public string? Title { get; set; }
        public string? Body { get; set; }
        public string? GuestImageUrl { get; set; }
        public Dictionary<string, string>? CustomData { get; set; }
    }
}