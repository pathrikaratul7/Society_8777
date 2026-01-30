using System.ComponentModel.DataAnnotations.Schema;

namespace Society_8777.Models
{
    public class Tbl_PaymentTransaction
    {
        public long? Id { get; set; }
        public decimal? Amount { get; set; }
        public string? Utr { get; set; }
        public string? PaidTo { get; set; }
        public DateTime? PaymentDate { get; set; }
        public string? SourceApp { get; set; }
        public string? RawText { get; set; }
        public DateTime? CreatedOn { get; set; }
        public long? FlatId { get; set; }
        [NotMapped]
        public string? Flag { get; set; }
    }
}
