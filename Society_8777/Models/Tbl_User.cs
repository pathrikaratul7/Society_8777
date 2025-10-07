using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Society_8777.Models
{
    public class Tbl_User
    {
        [Key]
        public long UID { get; set; }              // bigint -> long? (nullable)
        public string? UName { get; set; }           // nvarchar(max) -> string
        public string? UEmail { get; set; }          // nvarchar(max) -> string
        public string? UPass { get; set; }           // nvarchar(max) -> string
        public string? UMobile { get; set; }         // nvarchar -> string
        public bool? IsDeleted { get; set; } = false;      // bit -> bool?
        public string? CreatedBy { get; set; }       // nvarchar(max) -> string
        public DateTime? CreatedDateTime { get; set; }  // datetime -> DateTime?
        public string? UpdatedBy { get; set; }       // nvarchar(max) -> string
        public DateTime? UpdatedDateTime { get; set; }  // datetime -> DateTime?

        
        public long? FID { get; set; }
        
       public string? FlatNumber { get; set; }
        
        public string? FlatType { get; set; }
        [NotMapped]
        
        public string? Flag { get; set; }
    }
}
