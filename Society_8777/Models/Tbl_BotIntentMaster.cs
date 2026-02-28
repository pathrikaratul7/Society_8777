namespace Society_8777.Models
{
    public class Tbl_BotIntentMaster
    {
        public long IntentId { get; set; }  
        public string IntentCode { get; set; } = null!;
        public int   IntentPriority { get; set; }  
        public bool IsActive { get; set; }
    }
}
