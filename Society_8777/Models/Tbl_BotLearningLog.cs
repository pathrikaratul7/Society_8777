using FirebaseAdmin.Messaging;

namespace Society_8777.Models
{
    public class Tbl_BotLearningLog
    {
       public long LogId { get; set; }
       public string Message { get; set; } = null!; 
       public int DetectedIntentId { get; set; }
       public int? CorrectIntentId {get; set; }  
       public DateTime CreatedDate { get; set; }
    }
}
