using System.ComponentModel.DataAnnotations.Schema;

namespace Society_8777.Models
{
    public class Tbl_Flat
    {
        //public long FID { get; set; }                   // bigint or int depending on DB
        //public string? OwnerName { get; set; }           // nvarchar
        //public int FloorNumber { get; set; }            // int
        //public string? FlatNumber { get; set; }          // nvarchar
        //public string? FlatType { get; set; }            // nvarchar
        //public bool IsDeleted { get; set; }             // bit
        //public string? CreatedBy { get; set; }           // nvarchar
        //public DateTime CreatedDateTime { get; set; }   // datetime
        //public string? UpdatedBy { get; set; }           // nvarchar
        //public DateTime? UpdatedDateTime { get; set; }  // datetime nullable
        //public long LoginID { get; set; }               // bigint, foreign key to User
        ////public ICollection<Tbl_User> Users { get; set; }

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
        public long? UID { get; set; }
        [NotMapped]
        public string? Flag { get;set; }
    }

}
