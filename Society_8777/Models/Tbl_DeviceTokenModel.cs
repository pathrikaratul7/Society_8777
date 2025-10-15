namespace Society_8777.Models
{
    public class Tbl_DeviceTokenModel
    {
        public int Id { get; set; }

        public string? Token { get; set; }

        public DateTime SavedOn { get; set; } = DateTime.Now;
    }
}
