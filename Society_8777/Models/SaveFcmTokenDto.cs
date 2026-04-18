namespace Society_8777.Models
{
    public class SaveFcmTokenDto
    {
        public int UserId { get; set; }
        public string? Token { get; set; }
        public string? Platform { get; set; }
    }
}
