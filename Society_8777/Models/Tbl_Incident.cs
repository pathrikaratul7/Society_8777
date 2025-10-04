using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Society_8777.Models
{
    public class Tbl_Incident
    {
        public long? INCID { get; set; }
        public string? INCType { get; set; }
        public object? INCImage { get; set; }
        public string? INCImagePath { get; set; }
        public string? INCReportedBy { get; set; }
        public bool? IsDeleted { get; set; }
        public string? INCStatus { get; set; }
        public DateTime? INCReportedDateTime { get; set; }
        public string? INCAssignTo { get; set; }
        [NotMapped]
        public string? Flag { get; set; }
    }
}
