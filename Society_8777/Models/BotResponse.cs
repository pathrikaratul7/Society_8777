namespace Society_8777.Models
{
    public class BotResponse
    {
        public string Message { get; set; }
        public double Confidence { get; set; }

        public BotResponse(string message, double confidence)
        {
            Message = message;
            Confidence = confidence;
        }
    }
}
