namespace Society_8777.Models
{
    public class AddGuestRequest
    {
        public Tbl_Guest Guest { get; set; }
        public Tbl_FCMToken FcmToken { get; set; }
    }
}
