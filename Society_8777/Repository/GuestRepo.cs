using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Repository
{
    public class GuestRepo : IGuest
    {
        readonly private DataBaseContext.DataBaseContext _context;
        public GuestRepo(DataBaseContext.DataBaseContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> GetNotification(Tbl_Guest tbl_Guest)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[2];
                sp[0] = new SqlParameter("@FID", tbl_Guest.FID ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@Flag", tbl_Guest.Flag ?? (object)DBNull.Value);

                var _tbl_Guest =  _context.Tbl_Guest.FromSqlRaw
                    ("EXEC [dbo].[USP_Tbl_Guest] @FID=@FID,@Flag=@Flag", sp).AsNoTracking().AsEnumerable().FirstOrDefault();
                
                return new OkObjectResult(_tbl_Guest);
            }
            catch (Exception)
            {


            }
            return null;

        }
        public async Task<IActionResult> AddGuest(Tbl_Guest tbl_Guest)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[9];
                sp[0] = new SqlParameter("@GName", tbl_Guest.GName ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@GMobile", tbl_Guest.GMobile ?? (object)DBNull.Value);
                sp[2] = new SqlParameter("@GEmail", tbl_Guest.GEmail ?? (object)DBNull.Value);
                sp[3] = new SqlParameter("@InDateTime", tbl_Guest.InDateTime ?? (object)DBNull.Value);
                sp[4] = new SqlParameter("@FID", tbl_Guest.FID ?? (object)DBNull.Value);
                sp[5] = new SqlParameter("@CreatedBy", tbl_Guest.CreatedBy ?? (object)DBNull.Value);
                sp[6] = new SqlParameter("@LoginID", tbl_Guest.LoginID ?? (object)DBNull.Value);
                sp[7] = new SqlParameter("@GImagePath", tbl_Guest.GImagePath ?? (object)DBNull.Value);
                
                sp[8] = new SqlParameter("@Flag", tbl_Guest.Flag ?? (object)DBNull.Value);
                var _tbl_Guest =  _context.Tbl_Guest
                    .FromSqlRaw("EXEC [dbo].[USP_Tbl_Guest] @GName=@GName,@GMobile=@GMobile,@GEmail=@GEmail," +
                    "@InDateTime=@InDateTime,@FID=@FID,@CreatedBy=@CreatedBy,@LoginID=@LoginID,@GImagePath=@GImagePath,@Flag=@Flag"
                    , sp).AsEnumerable().FirstOrDefault();
                await _context.SaveChangesAsync();
                return new OkObjectResult(_tbl_Guest);
            }
            catch (Exception)
            {


            }
            return null;
        }
        public async Task<IActionResult> UpdateGuest(Tbl_Guest tbl_Guest)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[10];
                sp[0] = new SqlParameter("@GID", tbl_Guest.GID ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@GName", tbl_Guest.GName ?? (object)DBNull.Value);
                sp[2] = new SqlParameter("@GMobile", tbl_Guest.GMobile ?? (object)DBNull.Value);
                sp[3] = new SqlParameter("@GEmail", tbl_Guest.GEmail ?? (object)DBNull.Value);
                sp[4] = new SqlParameter("@OutDateTime", tbl_Guest.OutDateTime ?? (object)DBNull.Value);
                sp[5] = new SqlParameter("@FID", tbl_Guest.FID ?? (object)DBNull.Value);
                sp[6] = new SqlParameter("@UpdatedBy", tbl_Guest.UpdatedBy ?? (object)DBNull.Value);
                sp[7] = new SqlParameter("@LoginID", tbl_Guest.LoginID ?? (object)DBNull.Value);
                
                sp[9] = new SqlParameter("@Flag", tbl_Guest.Flag ?? (object)DBNull.Value);
                var _tbl_Guest = _context.Tbl_Guest
                    .FromSqlRaw("EXEC [dbo].[USP_Tbl_Guest] @GID=@GID,@GName=@GName,@GMobile=@GMobile," +
                    "@GEmail=@GEmail,@OutDateTime=@OutDateTime,@FID=@FID,@UpdatedBy=@UpdatedBy,@LoginID=@LoginID,@GImage=@GImage,@Flag=@Flag", sp)
                    .AsEnumerable().FirstOrDefault();
                await _context.SaveChangesAsync();  
                return new OkObjectResult(_tbl_Guest);
            }
            catch (Exception ex)
            {
            }
            return null;
        }
        public async Task<IActionResult> DeleteGuest(Tbl_Guest tbl_Guest)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[4];
                sp[0] = new SqlParameter("@GID", tbl_Guest.GID ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@IsDeleted", tbl_Guest.IsDeleted ?? (object)DBNull.Value);
                sp[2] = new SqlParameter("@UpdatedBy", tbl_Guest.UpdatedBy ?? (object)DBNull.Value);
                sp[3] = new SqlParameter("@Flag", tbl_Guest.Flag ?? (object)DBNull.Value);
                var _tbl_Guest = await _context.Tbl_Guest.FromSqlRaw("EXEC [dbo].[USP_Tbl_Guest] @GID=@GID,@IsDeleted=@IsDeleted,@UpdatedBy=@UpdatedBy,@Flag=@Flag", sp).ToListAsync();
                return new OkObjectResult(_tbl_Guest);
            }
            catch (Exception)
            {
            }
            return null;
        }
        public async Task<IActionResult> GetAllGuestList(Tbl_Guest tbl_Guest)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[2];
                sp[0] = new SqlParameter("@LoginID", tbl_Guest.LoginID ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@Flag", tbl_Guest.Flag ?? (object)DBNull.Value);
                var _tbl_Guest = await _context.Tbl_Guest.FromSqlRaw("EXEC [dbo].[USP_Tbl_Guest]" +
                    " @LoginID=@LoginID,@Flag=@Flag", sp).ToListAsync();
                return new OkObjectResult(_tbl_Guest);
            }
            catch (Exception)
            {
            }
            return null;
        }
        public byte[] ConvertImageToByteArray(string imagePath)
        {
            return File.ReadAllBytes(imagePath);
        }
}
}
