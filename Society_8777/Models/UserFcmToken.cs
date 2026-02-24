namespace Society_8777.Models
{
    public class UserFcmToken
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Token { get; set; }
        public string Platform { get; set; }
        public DateTime CreatedOn { get; set; }
    }
}
