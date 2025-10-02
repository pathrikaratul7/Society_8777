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

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Tbl_User>(user =>
            {
                user.HasKey(u => u.UID);
                user.Property(u => u.UName).HasMaxLength(50).IsUnicode(false);
                user.Property(u => u.UEmail).HasMaxLength(50).IsUnicode(false);
                user.Property(u => u.UPass).HasMaxLength(50).IsUnicode(false);
                user.Property(u => u.UMobile).HasMaxLength(50).IsUnicode(false);
                user.Property(u => u.CreatedBy).HasMaxLength(50).IsUnicode(false);
                user.Property(u => u.CreatedDateTime).IsUnicode(false);
                user.Property(u => u.UpdatedBy).HasMaxLength(50).IsUnicode(false);
                user.Property(u => u.UpdatedDateTime).IsUnicode(false);


            });
            modelBuilder.Entity<Tbl_Flat>(flat =>
            {
                flat.HasKey(f => f.FID);
                flat.Property(f => f.OwnerName).HasMaxLength(50).IsUnicode(false);
                flat.Property(f => f.FloorNumber).HasMaxLength(50).IsUnicode(false);
                flat.Property(f => f.FlatNumber).HasMaxLength(50).IsUnicode(false);
                flat.Property(f => f.FlatType).HasMaxLength(50).IsUnicode(false);
                flat.Property(f => f.CreatedBy).HasMaxLength(50).IsUnicode(false);
                flat.Property(f => f.CreatedDateTime).IsUnicode(false);
                flat.Property(f => f.UpdatedBy).HasMaxLength(50).IsUnicode(false);
                flat.Property(f => f.UpdatedDateTime).IsUnicode(false);
                // Define foreign key relationship
                flat.HasOne<Tbl_User>() // Specify the related entity type
                    .WithMany() // Assuming a user can have multiple flats; adjust if necessary
                    .HasForeignKey(f => f.LoginID) // Foreign key in Tbl_Flat
                    .OnDelete(DeleteBehavior.ClientSetNull) // Adjust delete behavior as needed
                    .HasConstraintName("FK_Tbl_Flat_Tbl_User"); // Optional: name of the foreign key constraint
            });



            OnModelCreatingPartial(modelBuilder);

        }
        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
