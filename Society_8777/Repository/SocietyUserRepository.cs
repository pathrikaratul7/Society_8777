using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.DataBaseContext;
using Society_8777.Interface;
using Society_8777.Models;

namespace SqlBankApi7.Repository
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
    }
}
