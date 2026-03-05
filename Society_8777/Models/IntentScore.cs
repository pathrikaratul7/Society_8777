namespace Society_8777.Models
{
    public class IntentScore
    {
        public int IntentId { get; set; }
        public double Score { get; set; }
        public int PrimaryMatchCount { get; set; }
        public int TotalMatchCount { get; set; }
    }
}
