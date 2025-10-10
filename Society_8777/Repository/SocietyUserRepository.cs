using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.DataBaseContext;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Repository
{
    public class SocietyUserRepository : ISocietyUser
    {
        readonly Society_8777.DataBaseContext.DataBaseContext _dbcontex = new();

        public SocietyUserRepository(Society_8777.DataBaseContext.DataBaseContext dataBaseContext)
        {
            _dbcontex = dataBaseContext;

        }
        public async Task<IActionResult> GetLogin(Tbl_User objCust)
        {
            try
            {
                if (_dbcontex.tbl_User == null)
                {
                    return new NotFoundResult();
                }

                SqlParameter[] sqlpara = new SqlParameter[3];
                sqlpara[0] = new SqlParameter("@UEmail", objCust.UEmail ?? (object)DBNull.Value);
                sqlpara[1] = new SqlParameter("@UPass", objCust.UPass ?? (object)DBNull.Value);
                sqlpara[2] = new SqlParameter("@Flag", objCust.Flag ?? (object)DBNull.Value);

                var _tbl_User = _dbcontex.tbl_User
       .FromSqlRaw("EXEC USP_Tbl_User @UEmail=@UEmail, @UPass=@UPass, @Flag=@Flag", sqlpara)
       .AsNoTracking()
       .AsEnumerable()
       .FirstOrDefault();

                if (_tbl_User != null)
                {
                    return new OkObjectResult(_tbl_User);
                }
                
            }
            catch (Exception ex)
            {
                //throw;
            }
            return null;
        }

        public async Task<IActionResult> AddUser(Tbl_User objCust)
        {
            try
            {
                if (_dbcontex.tbl_User == null)
                {
                    return new NotFoundResult();
                }
                SqlParameter[] sqlpara = new SqlParameter[8];
                sqlpara[0] = new SqlParameter("@UName", objCust.UName ?? (object)DBNull.Value);
                sqlpara[1] = new SqlParameter("@UEmail", objCust.UEmail ?? (object)DBNull.Value);
                sqlpara[2] = new SqlParameter("@UPass", objCust.UPass ?? (object)DBNull.Value);
                sqlpara[3] = new SqlParameter("@UMobile", objCust.UMobile ?? (object)DBNull.Value);
                sqlpara[4] = new SqlParameter("@IsDeleted", objCust.IsDeleted ?? (object)DBNull.Value);
                sqlpara[5] = new SqlParameter("@DeviceID", objCust.DeviceID ?? (object)DBNull.Value);
                sqlpara[6] = new SqlParameter("@PrivList", objCust.PrivList ?? (object)DBNull.Value);
                sqlpara[7] = new SqlParameter("@Flag", objCust.Flag ?? (object)DBNull.Value);
                var _tbl_User =  _dbcontex.tbl_User.FromSqlRaw(
                    "EXEC USP_Tbl_User @UName=@UName, @UEmail=@UEmail, @UPass=@UPass, @UMobile=@UMobile, @IsDeleted=@IsDeleted, @Flag=@Flag", sqlpara)
                     .AsEnumerable().FirstOrDefault();

                await _dbcontex.SaveChangesAsync();
                return new OkObjectResult(_tbl_User);
            }
            catch (Exception ex)
            {
                //throw;
            }
            return null;
        }
        public async Task<IActionResult> UpdateUser(Tbl_User objCust)
        {
            try
            {
                if (_dbcontex.tbl_User == null)
                {
                    return new NotFoundResult();
                }
                SqlParameter[] sqlpara = new SqlParameter[7];
                sqlpara[0] = new SqlParameter("@UID", objCust.UID);
                sqlpara[1] = new SqlParameter("@UName", objCust.UName ?? (object)DBNull.Value);
                sqlpara[2] = new SqlParameter("@UEmail", objCust.UEmail ?? (object)DBNull.Value);
                sqlpara[3] = new SqlParameter("@UPass", objCust.UPass ?? (object)DBNull.Value);
                sqlpara[4] = new SqlParameter("@UMobile", objCust.UMobile ?? (object)DBNull.Value);
                sqlpara[5] = new SqlParameter("@IsDeleted", objCust.IsDeleted ?? (object)DBNull.Value);
                sqlpara[6] = new SqlParameter("@Flag", objCust.Flag ?? (object)DBNull.Value);
                var _tbl_User = _dbcontex.tbl_User.FromSqlRaw(
                    "EXEC USP_Tbl_User @UID=@UID, @UName=@UName, @UEmail=@UEmail, @UPass=@UPass, @UMobile=@UMobile, @IsDeleted=@IsDeleted, @Flag=@Flag", sqlpara)
                     .AsEnumerable().FirstOrDefault();
                await _dbcontex.SaveChangesAsync();
                return new OkObjectResult(_tbl_User);
            }
            catch (Exception ex)
            {
                //throw;
            }
            return null;
        }
        public async Task<IActionResult> DeleteUser(Tbl_User objCust)
        {
            try
            {
                if (_dbcontex.tbl_User == null)
                {
                    return new NotFoundResult();
                }
                SqlParameter[] sqlpara = new SqlParameter[2];
                sqlpara[0] = new SqlParameter("@UID", objCust.UID);
                sqlpara[1] = new SqlParameter("@Flag", objCust.Flag ?? (object)DBNull.Value);
                var _tbl_User = _dbcontex.tbl_User.FromSqlRaw(
                    "EXEC USP_Tbl_User @UID=@UID, @Flag=@Flag", sqlpara)
                     .AsEnumerable().FirstOrDefault();
                await _dbcontex.SaveChangesAsync();
                return new OkObjectResult(_tbl_User);
            }
            catch (Exception ex)
            {
                //throw;
            }
            return null;
        }
    }
}