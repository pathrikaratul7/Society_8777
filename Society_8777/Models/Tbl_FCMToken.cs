using System.ComponentModel.DataAnnotations;

namespace Society_8777.Models
{
    public class Tbl_FCMToken
    {
        [Key]
        public long FCID { get; set; }
        public Int32 FlatID { get; set; }
        public string? FcmToken { get; set; }
        public DateTime UpdatedOn { get; set; }
    }
}
