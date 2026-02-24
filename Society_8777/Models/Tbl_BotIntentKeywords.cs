namespace Society_8777.Models
{
    public class Tbl_BotIntentKeywords
    {
        public int KeywordID { get; set; }
        public int IntentId { get; set; }
        public string IntentCode { get; set; } = null!;
        public string Keyword { get; set; } = null!;
    }
}
