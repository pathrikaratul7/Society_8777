namespace Society_8777.Models
{
    public class SendTopicNotificationRequest
    {
        public string? Topic { get; set; }
        public string? Title { get; set; }
        public string? Body { get; set; }
        public string? ImageUrl { get; set; }
        public Dictionary<string, string>? Data { get; set; }
    }
}

