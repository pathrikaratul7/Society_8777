using System.ComponentModel.DataAnnotations.Schema;

namespace Society_8777.Models
{
    public class Tbl_Flat
    {
        public long FID { get; set; }  // Primary Key

        public string? OwnerName { get; set; }

        public string? FloorNumber { get; set; }

        public string? FlatNumber { get; set; }

        public string? FlatType { get; set; }

        public bool? IsDeleted { get; set; }

        public string? CreatedBy { get; set; }

        public DateTime? CreatedDateTime { get; set; }

        public string? UpdatedBy { get; set; }

        public DateTime? UpdatedDateTime { get; set; }

        public long? LoginID { get; set; } // Foreign Key

        [NotMapped]
        public long? UID { get; set; }

        [NotMapped]
        public string? Flag { get; set; }
    }

}
