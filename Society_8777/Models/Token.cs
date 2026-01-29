namespace Society_8777.Models
{
    public class Token
    {
        public string? token { get; set; }
        public string? refreshToken { get; set; }
        public DateTime? tokenexpiry { get; set; }
        public string? Message { get; set; }
        public int? StatusCode { get; set; }
        public string? Status { get; set; }
    }
}
