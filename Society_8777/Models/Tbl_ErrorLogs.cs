using System.ComponentModel.DataAnnotations.Schema;

namespace Society_8777.Models
{
    public class Tbl_ErrorLogs
    {
        // Unique error ID
        public long ERRID { get; set; }

        // The page or module where the error occurred
        public string? ErrorPage { get; set; }

        // Full stack trace of the error
        public string? ErrorStack { get; set; }

        // Error message
        public string? ErrorMessage { get; set; }

        // ID of the user who logged the error
        public string? ErrorLoggedByID { get; set; }

        // Name of the user who logged the error
        public string? ErrorLoggedByName { get; set; }

        // Date and time when the error was logged
        public DateTime ErrorCreatedDateTime { get; set; }

        // Whether the error has been resolved
        public bool IsResolve { get; set; }
        [NotMapped]
        public string? Flag { get; set; }
    }
}
