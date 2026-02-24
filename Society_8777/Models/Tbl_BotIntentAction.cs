namespace Society_8777.Models
{
    public class Tbl_BotIntentAction
    {
        public int ActionId { get; set; }
        public int IntentId { get; set; }
        public string SqlQuery { get; set; } = null!;
        public string ActionType { get; set; } = null!;
    }

}
