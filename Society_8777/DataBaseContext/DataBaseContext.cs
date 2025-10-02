using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders; // <-- Add this using directive
using Society_8777.Models;
namespace Society_8777.DataBaseContext
{
    public partial class DataBaseContext : DbContext
    {

        public DataBaseContext()
        {

        }
        public DataBaseContext(DbContextOptions<DataBaseContext> options)
            : base(options)
        {


        }
        public virtual DbSet<Tbl_User>? tbl_User { get; set; }
        public virtual DbSet<Tbl_Flat>? tbl_Flat { get; set; }

        public virtual DbSet<Tbl_Guest>? Tbl_Guests { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Tbl_User>(user =>
            {
                user.HasKey(u => u.UID);
                user.Property(u => u.UName);
                user.Property(u => u.UEmail);
                user.Property(u => u.UPass);
                user.Property(u => u.UMobile);
                user.Property(u => u.CreatedBy);
                user.Property(u => u.CreatedDateTime).IsUnicode(false);
                user.Property(u => u.UpdatedBy);
                user.Property(u => u.UpdatedDateTime).IsUnicode(false);


            });
            modelBuilder.Entity<Tbl_Flat>(flat =>
            {
                flat.HasKey(f => f.FID);
                flat.Property(f => f.OwnerName);
                flat.Property(f => f.FloorNumber);
                flat.Property(f => f.FlatNumber);
                flat.Property(f => f.FlatType);
                flat.Property(f => f.CreatedBy);
                flat.Property(f => f.CreatedDateTime).IsUnicode(false);
                flat.Property(f => f.UpdatedBy);
                flat.Property(f => f.UpdatedDateTime).IsUnicode(false);
                // Define foreign key relationship
                flat.HasOne<Tbl_User>() // Specify the related entity type
                    .WithMany() // Assuming a user can have multiple flats; adjust if necessary
                    .HasForeignKey(f => f.LoginID) // Foreign key in Tbl_Flat
                    .OnDelete(DeleteBehavior.ClientSetNull) // Adjust delete behavior as needed
                    .HasConstraintName("FK_Tbl_Flat_Tbl_User"); // Optional: name of the foreign key constraint
            });
            modelBuilder.Entity<Tbl_Guest>(guest =>
            {
                guest.HasKey(g => g.GID);
                guest.Property(g => g.GName);
                guest.Property(g => g.GMobile);
                guest.Property(g => g.GEmail);
                guest.Property(g => g.InDateTime  );
                guest.Property(g => g.OutDateTime  );
                guest.Property(g => g.FID  );
                guest.Property(g => g.Status  );
                guest.Property(g => g.IsDeleted  );
                guest.Property(g => g.CreatedBy  );
                guest.Property(g => g.CreatedDateTime  );
                guest.Property(g => g.UpdatedBy  );
                guest.Property(g => g.UpdatedDateTime  );
                
                guest.Property(g => g.GImagePath  );
                
                
                
                
            });



            OnModelCreatingPartial(modelBuilder);

        }
        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
