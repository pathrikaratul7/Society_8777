using System.ComponentModel.DataAnnotations.Schema;

namespace Society_8777.Models
{
    public class Tbl_Guest
    {
        public string? CreatorMobile { get; set; }
        public long? GID { get; set; }

        public string? GName { get; set; }

        public string? GMobile { get; set; }

        public string? GEmail { get; set; }

        public DateTime? InDateTime { get; set; }

        public DateTime? OutDateTime { get; set; }

        public long? FID { get; set; }

        public string? Status { get; set; }

        public bool? IsDeleted { get; set; }

        public string? CreatedBy { get; set; }

        public DateTime? CreatedDateTime { get; set; }

        public string? UpdatedBy { get; set; }

        public DateTime? UpdatedDateTime { get; set; }

        public string? FloorNumber { get; set; }

        public string? FlatNumber { get; set; }

        public string? FlatType { get; set; }

        public string? GImagePath { get; set; }

        [NotMapped]
        public long? LoginID { get; set; }
        [NotMapped]
        public string? Flag { get; set; }
    }
}

    

