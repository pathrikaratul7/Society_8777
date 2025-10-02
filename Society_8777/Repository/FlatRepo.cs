using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Repository
{
    public class FlatRepo : IFlat
    {
        readonly DataBaseContext.DataBaseContext _dbcontex = new();
        public FlatRepo(DataBaseContext.DataBaseContext dataBaseContext)
        {
            _dbcontex = dataBaseContext;
        }
        public async Task<IActionResult> AddFlat(Tbl_Flat objFlat)
        {
            try
            {
                SqlParameter[] p = new SqlParameter[11];
                p[0] = new SqlParameter("@OwnerName", objFlat.OwnerName ?? (object)DBNull.Value);
                p[1] = new SqlParameter("@FloorNumber", objFlat.FloorNumber ?? (object)DBNull.Value);
                p[2] = new SqlParameter("@FlatNumber", objFlat.FlatNumber ?? (object)DBNull.Value);
                p[3] = new SqlParameter("@FlatType", objFlat.FlatType ?? (object)DBNull.Value);
                p[4] = new SqlParameter("@IsDeleted", objFlat.IsDeleted ?? (object)DBNull.Value);
                p[5] = new SqlParameter("@CreatedBy", objFlat.CreatedBy ?? (object)DBNull.Value);
                p[6] = new SqlParameter("@CreatedDateTime", objFlat.CreatedDateTime ?? (object)DBNull.Value);
                p[7] = new SqlParameter("@UpdatedBy", objFlat.UpdatedBy ?? (object)DBNull.Value);
                p[8] = new SqlParameter("@UpdatedDateTime", objFlat.UpdatedDateTime ?? (object)DBNull.Value);
                p[9] = new SqlParameter("@LoginID", objFlat.LoginID ?? (object)DBNull.Value);
                p[10] = new SqlParameter("@Flag", objFlat.Flag ?? (object)DBNull.Value);



                var _tbl_Flat = _dbcontex.tbl_Flat
                    .FromSqlRaw("EXEC USP_Tbl_Flat @OwnerName=@OwnerName, @FloorNumber=@FloorNumber, @FlatNumber=@FlatNumber, @FlatType=@FlatType, @IsDeleted=@IsDeleted, @CreatedBy=@CreatedBy, @CreatedDateTime=@CreatedDateTime, @UpdatedBy=@UpdatedBy, @UpdatedDateTime=@UpdatedDateTime, @LoginID=@LoginID, @Flag=@Flag", p)
                    .AsEnumerable().FirstOrDefault();
                await _dbcontex.SaveChangesAsync();
                return new OkObjectResult(_tbl_Flat);
            }
            catch (Exception)
            {


            }
            return null;
        }
        public async Task<IActionResult> GetAllFlat(Tbl_Flat objFlat)
        {
            try
            {
                if (_dbcontex.tbl_Flat == null)
                {
                    return new NotFoundResult();
                }
                SqlParameter[] p = new SqlParameter[1];
                p[0] = new SqlParameter("@Flag", objFlat.Flag ?? (object)DBNull.Value);
                var _tbl_Flat = await _dbcontex.tbl_Flat
                   .FromSqlRaw("EXEC USP_Tbl_Flat  @Flag=@Flag", p)
                   .AsNoTracking()
                   .ToListAsync();
                if (_tbl_Flat != null && _tbl_Flat.Count > 0)
                {
                    return new OkObjectResult(_tbl_Flat);
                }
                else
                {
                    return new NotFoundResult();
                }
            }
            catch (Exception ex)
            {
                // Log the exception (ex) as needed

            }
            return null;


        }
        public async Task<IActionResult> UpdateFlat(Tbl_Flat objFlat)
        {
            try
            {
                SqlParameter[] p = new SqlParameter[11];
                p[0] = new SqlParameter("@FID", objFlat.FID);
                p[1] = new SqlParameter("@OwnerName", objFlat.OwnerName ?? (object)DBNull.Value);
                p[2] = new SqlParameter("@FloorNumber", objFlat.FloorNumber ?? (object)DBNull.Value);
                p[3] = new SqlParameter("@FlatNumber", objFlat.FlatNumber ?? (object)DBNull.Value);
                p[4] = new SqlParameter("@FlatType", objFlat.FlatType ?? (object)DBNull.Value);
                p[5] = new SqlParameter("@IsDeleted", objFlat.IsDeleted ?? (object)DBNull.Value);
                p[6] = new SqlParameter("@CreatedBy", objFlat.CreatedBy ?? (object)DBNull.Value);
                p[7] = new SqlParameter("@CreatedDateTime", objFlat.CreatedDateTime ?? (object)DBNull.Value);
                p[8] = new SqlParameter("@UpdatedBy", objFlat.UpdatedBy ?? (object)DBNull.Value);
                p[9] = new SqlParameter("@UpdatedDateTime", objFlat.UpdatedDateTime ?? (object)DBNull.Value);
                p[10] = new SqlParameter("@Flag", objFlat.Flag ?? (object)DBNull.Value);

                var _tbl_Flat = _dbcontex.tbl_Flat
                    .FromSqlRaw("EXEC USP_Tbl_Flat @FID=@FID, @OwnerName=@OwnerName, @FloorNumber=@FloorNumber, @FlatNumber=@FlatNumber, @FlatType=@FlatType, @IsDeleted=@IsDeleted, @CreatedBy=@CreatedBy, @CreatedDateTime=@CreatedDateTime, @UpdatedBy=@UpdatedBy, @UpdatedDateTime=@UpdatedDateTime, @Flag=@Flag", p)
                    .AsEnumerable().FirstOrDefault();
                await _dbcontex.SaveChangesAsync();
                return new OkObjectResult(_tbl_Flat);
            }
            catch (Exception)
            {
            }
            return null;
        }
        public async Task<IActionResult> DeleteFlat(Tbl_Flat objFlat)
        {
            try
            {
                SqlParameter[] p = new SqlParameter[2];
                p[0] = new SqlParameter("@FID", objFlat.FID);
                p[1] = new SqlParameter("@Flag", objFlat.Flag ?? (object)DBNull.Value);
                var _tbl_Flat = _dbcontex.tbl_Flat
                    .FromSqlRaw("EXEC USP_Tbl_Flat @FID=@FID, @Flag=@Flag", p)
                    .AsEnumerable().FirstOrDefault();
                await _dbcontex.SaveChangesAsync();
                return new OkObjectResult(_tbl_Flat);
            }
            catch (Exception)
            {
            }
            return null;
        }
    }
}