using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Society_8777.Models
{
    public class Tbl_RefreshTokens
    {
        
       
            [Key]
            public Guid Id { get; set; }  // matches uniqueidentifier

            [Required]
            public long UserId { get; set; } // bigint

            [Required]
            [MaxLength(256)]
            public string? TokenHash { get; set; } // nvarchar(256)

            [Required]
            public DateTime ExpiresAt { get; set; } // datetime2(7)

            [Required]
            public bool IsRevoked { get; set; } // bit

            [Required]
            public DateTime CreatedAt { get; set; } // datetime2(7)

            public DateTime? RevokedAt { get; set; } // datetime2(7), nullable

            [NotMapped]
            public bool IsActive => !IsRevoked && !IsExpired; // convenience property

            [NotMapped]
            public bool IsExpired => DateTime.UtcNow >= ExpiresAt; // convenience property

        }
    }
