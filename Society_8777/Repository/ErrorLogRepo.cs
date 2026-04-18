using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Repository
{
    public class ErrorLogRepo: IErrorLog
    {
        readonly private DataBaseContext.DataBaseContext _context;
        public ErrorLogRepo(DataBaseContext.DataBaseContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> LogError(Tbl_ErrorLogs tbl_ErrorLogs)
        {
            try
            {
                SqlParameter[] p = new SqlParameter[6];
                p[0] = new SqlParameter("@ErrorPage", tbl_ErrorLogs.ErrorPage ?? (object)DBNull.Value);
                p[1] = new SqlParameter("@ErrorStack", tbl_ErrorLogs.ErrorStack ?? (object)DBNull.Value);
                p[2] = new SqlParameter("@ErrorMessage", tbl_ErrorLogs.ErrorMessage ?? (object)DBNull.Value);
                p[3] = new SqlParameter("@ErrorLoggedByID", tbl_ErrorLogs.ErrorLoggedByID ?? (object)DBNull.Value);
                p[4]= new SqlParameter("@ErrorLoggedByName", tbl_ErrorLogs.ErrorLoggedByName ?? (object)DBNull.Value);
                p[5] = new SqlParameter("@Flag", tbl_ErrorLogs.Flag ?? (object)DBNull.Value);

                var _tbl_ErrorLogs =  _context.Tbl_ErrorLogs!
                    .FromSqlRaw("EXEC [dbo].[USP_Tbl_ErrorLogs] @ErrorPage=@ErrorPage,@ErrorStack=@ErrorStack,@ErrorMessage=@ErrorMessage," +
                    "@ErrorLoggedByID=@ErrorLoggedByID,@ErrorLoggedByName=@ErrorLoggedByName , @Flag=@Flag"
                    , p).AsNoTracking()
       .AsEnumerable()
       .FirstOrDefault();
                await _context.SaveChangesAsync();
                return new OkObjectResult(_tbl_ErrorLogs);

            }
            catch (Exception)
            {

                throw;
            }
            
        }
        

public async Task<IActionResult> GetAllError(Tbl_ErrorLogs tbl_ErrorLogs)
    {
        try
        {
            var p = new[]
            {
            new SqlParameter("@Flag", tbl_ErrorLogs.Flag ?? (object)DBNull.Value)
        };

            var result = await _context.Tbl_ErrorLogs!
                .FromSqlRaw("EXEC USP_Tbl_ErrorLogs @Flag=@Flag", p)
                .AsNoTracking()
                .ToListAsync();

            return new OkObjectResult(result);
        }
        catch (Exception ex)
        {
                return new StatusCodeResult(500);
        }
    }
}
}
