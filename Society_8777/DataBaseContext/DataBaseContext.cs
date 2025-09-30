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
           
            OnModelCreatingPartial(modelBuilder);

        }
        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
