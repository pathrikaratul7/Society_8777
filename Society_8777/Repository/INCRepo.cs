using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Repository
{
    public class INCRepo : IInc
    {
        readonly DataBaseContext.DataBaseContext _context = new();
        public INCRepo(DataBaseContext.DataBaseContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> AddIncident(Tbl_Incident tbl_INC)
        {
            try
            {
                SqlParameter[] p = new SqlParameter[9];
                p[0] = new SqlParameter("@INCID", tbl_INC.INCID ?? (object)DBNull.Value);
                p[1] = new SqlParameter("@INCType", tbl_INC.INCType ?? (object)DBNull.Value);
                p[2] = new SqlParameter("@INCImagePath", tbl_INC.INCImagePath ?? (object)DBNull.Value);
                p[3] = new SqlParameter("@INCReportedBy", tbl_INC.INCReportedBy ?? (object)DBNull.Value);
                p[4] = new SqlParameter("@IsDeleted", tbl_INC.IsDeleted ?? (object)DBNull.Value);
                p[5] = new SqlParameter("@INCStatus", tbl_INC.INCStatus ?? (object)DBNull.Value);
                p[6] = new SqlParameter("@INCReportedDateTime", tbl_INC.INCReportedDateTime ?? (object)DBNull.Value);
                p[7] = new SqlParameter("@INCAssignTo", tbl_INC.INCAssignTo ?? (object)DBNull.Value);
                p[8] = new SqlParameter("@Flag", tbl_INC.Flag ?? (object)DBNull.Value);


                var data = _context.Tbl_Incidents.FromSqlRaw("EXEC USP_Tbl_Incident @INCID=@INCID, @INCType=@INCType," +
                    "  @INCImagePath=@INCImagePath, @INCReportedBy=@INCReportedBy," +
                    " @IsDeleted=@IsDeleted, @INCStatus=@INCStatus," +
                    " @INCReportedDateTime=@INCReportedDateTime, @INCAssignTo=@INCAssignTo, @Flag=@Flag", p).AsEnumerable().FirstOrDefault();
                await _context.SaveChangesAsync();
                return new OkObjectResult(data);
            }
            catch (Exception ex)
            {

                throw;
            }
            return null;
        }
       
        public async Task<IActionResult> GetNotification(Tbl_Incident tbl_INC)
        {
            try
            {
                SqlParameter[] p = new SqlParameter[1];

                p[0] = new SqlParameter("@Flag", tbl_INC.Flag ?? (object)DBNull.Value);

                var data = await _context.Tbl_Incidents.FromSqlRaw("EXEC USP_Tbl_Incident  @Flag=@Flag", p).FirstOrDefaultAsync();
                return new OkObjectResult(data);

            }
            catch (Exception ex)
            {
                throw;
            }
            return null;

        }


        public async Task<IActionResult> UpdateIncident(Tbl_Incident tbl_INC)
        {


            try
            {
                SqlParameter[] p = new SqlParameter[9];
                p[0] = new SqlParameter("@INCID", tbl_INC.INCID ?? (object)DBNull.Value);
                p[1] = new SqlParameter("@INCType", tbl_INC.INCType ?? (object)DBNull.Value);
                p[2] = new SqlParameter("@INCImagePath", tbl_INC.INCImagePath ?? (object)DBNull.Value);
                p[3] = new SqlParameter("@INCReportedBy", tbl_INC.INCReportedBy ?? (object)DBNull.Value);
                p[4] = new SqlParameter("@IsDeleted", tbl_INC.IsDeleted ?? (object)DBNull.Value);
                p[5] = new SqlParameter("@INCStatus", tbl_INC.INCStatus ?? (object)DBNull.Value);
                p[6] = new SqlParameter("@INCReportedDateTime", tbl_INC.INCReportedDateTime ?? (object)DBNull.Value);
                p[7] = new SqlParameter("@INCAssignTo", tbl_INC.INCAssignTo ?? (object)DBNull.Value);
                p[8] = new SqlParameter("@Flag", tbl_INC.Flag ?? (object)DBNull.Value);

                var data = _context.Tbl_Incidents.FromSqlRaw("EXEC USP_Tbl_Incident @INCID=@INCID, @INCType=@INCType," +
                   " @INCImagePath=@INCImagePath, @INCReportedBy=@INCReportedBy," +
                   " @IsDeleted=@IsDeleted, @INCStatus=@INCStatus," +
                   " @INCReportedDateTime=@INCReportedDateTime, @INCAssignTo=@INCAssignTo, @Flag=@Flag", p)
                    .AsEnumerable().FirstOrDefault();
                await _context.SaveChangesAsync();
                return new OkObjectResult(data);

            }
            catch (Exception ex)
            {
                throw;
            }
            return null;

        }

        public async Task<IActionResult> DeleteIncident(Tbl_Incident tbl_INC)
        {
            try
            {
                SqlParameter[] p = new SqlParameter[2];
                p[0] = new SqlParameter("@INCID", tbl_INC.INCID ?? (object)DBNull.Value);
                p[1] = new SqlParameter("@Flag", tbl_INC.Flag ?? (object)DBNull.Value);
                var data = _context.Tbl_Incidents
                    .FromSqlRaw("EXEC USP_Tbl_Incident @INCID=@INCID, @Flag=@Flag", p).AsEnumerable().FirstOrDefault();
                await _context.SaveChangesAsync();
                return new OkObjectResult(data);
            }
            catch (Exception ex)
            {
                throw;
            }
            return null;
        }

        public async Task<IActionResult> GetAllIncidentList(Tbl_Incident tbl_INC)
        {
            try
            {
                SqlParameter[] p = new SqlParameter[2];
                p[0] = new SqlParameter("@UID", tbl_INC.UID);
                p[1] = new SqlParameter("@Flag", tbl_INC.Flag ?? (object)DBNull.Value);
                var data = await _context.Tbl_Incidents.FromSqlRaw("EXEC USP_Tbl_Incident @UID=@UID,  @Flag=@Flag", p).ToListAsync();
                return new OkObjectResult(data);
            }
            catch (Exception ex)
            {
                throw;
            }
            return null;
        }

        public byte[] ConvertImageToByteArray(string imagePath)
        {
            try
            {
                if (File.Exists(imagePath))
                {
                    byte[] imageBytes = File.ReadAllBytes(imagePath);
                    return imageBytes;
                }
                else
                {
                    return Array.Empty<byte>();
                }
            }
            catch (Exception ex)
            {
                return Array.Empty<byte>();
            }
            return null;
        }
    }

}