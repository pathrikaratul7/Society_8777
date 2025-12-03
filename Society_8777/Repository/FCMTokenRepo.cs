using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Repository
{
    public class FCMTokenRepo : IFCMToken
    {
        private readonly DataBaseContext.DataBaseContext _context = new();
        public FCMTokenRepo(DataBaseContext.DataBaseContext dataBaseContext) 
        { 
            _context = dataBaseContext;
        }
        public async Task<IActionResult> SaveToken([FromBody] Tbl_FCMToken request)
        {
            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@FCID", request.FCID),
                    new SqlParameter("@FcmToken", request.FcmToken),
                    new SqlParameter("@FlatID",request.FlatID), // Placeholder for FlatID if needed
                    new SqlParameter("@UpdatedOn", request.UpdatedOn)
                };




                var tbl_fcm =  _context.tbl_FCMToken.FromSqlRaw("EXEC dbo.USP_Tbl_FCMToken " +
                    "@FcmToken=@FcmToken,@FlatID=@FlatID,@UpdatedOn=@UpdatedOn", parameters).AsEnumerable().FirstOrDefault();
                if (tbl_fcm == null)
                {
                    return new ObjectResult(new { Message = "Failed to save token." }) { StatusCode = 500 };
                }
                else
                {

                    await _context.SaveChangesAsync();
                    return new OkObjectResult(tbl_fcm);
                }
            }
            catch (Exception ex)
            {
                return new ObjectResult(new { Message = "Error saving token.", Details = ex.Message }) { StatusCode = 500 };
            }
        }

    }
}
