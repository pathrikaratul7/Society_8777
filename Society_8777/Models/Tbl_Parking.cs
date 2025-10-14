using System.ComponentModel.DataAnnotations.Schema;

namespace Society_8777.Models
{
    public class Tbl_Parking
    {
        public long? ParkingId { get; set; }
        public long? FID { get; set; }
        public string? VehicleNumber { get; set; }
        public string? VehicleType { get; set; }
        public string? SlotNumber { get; set; }
        public bool? IsOccupied { get; set; }
        //public DateTime? StartTime { get; set; }
        //public DateTime? EndTime { get; set; }
        public string? CreatedBy { get; set; }
        public DateTime? CreatedDateTime { get; set; }
        public string? UpdatedBy { get; set; }
        public DateTime? UpdatedDateTime { get; set; }
        [NotMapped]
        public long? LoginID { get; set; }
        public string ? VImagePath { get; set; }
        [NotMapped]
        public string? Flag { get; set; }
    }
}
