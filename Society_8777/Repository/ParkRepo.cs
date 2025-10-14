using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Repository
{

    public class ParkRepo : IPark
    {
        private readonly DataBaseContext.DataBaseContext _context;
        public ParkRepo(DataBaseContext.DataBaseContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> AddParking(Tbl_Parking tbl_Parking)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[10];
               // sp[0] = new SqlParameter("@ParkingID", tbl_Parking.ParkingId ?? (object)DBNull.Value);
                sp[0] = new SqlParameter("@FID", tbl_Parking.FID ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@VehicleNumber", tbl_Parking.VehicleNumber ?? (object)DBNull.Value);
                sp[2] = new SqlParameter("@VehicleType", tbl_Parking.VehicleType ?? (object)DBNull.Value);
                sp[3] = new SqlParameter("@SlotNumber", tbl_Parking.SlotNumber ?? (object)DBNull.Value);
                sp[4] = new SqlParameter("@IsOccupied", tbl_Parking.IsOccupied ?? (object)DBNull.Value);
               // sp[6] = new SqlParameter("@StartTime", tbl_Parking.StartTime ?? (object)DBNull.Value);
               // sp[7] = new SqlParameter("@EndTime", tbl_Parking.EndTime ?? (object)DBNull.Value);
                sp[5] = new SqlParameter("@CreatedBy", tbl_Parking.CreatedBy ?? (object)DBNull.Value);
                sp[6] = new SqlParameter("@CreatedDateTime", tbl_Parking.CreatedDateTime ?? (object)DBNull.Value);
                sp[7] = new SqlParameter("@LoginID", tbl_Parking.LoginID ?? (object)DBNull.Value);
                sp[8] = new SqlParameter("@VImagePath", tbl_Parking.VImagePath ?? (object)DBNull.Value);
                sp[9] = new SqlParameter("@Flag", tbl_Parking.Flag ?? (object)DBNull.Value);
                var _tbl_Parking = _context.Tbl_Parking
                    .FromSqlRaw("EXEC [dbo].[USP_Tbl_Parking] @FID=@FID," +
                     "@VehicleNumber=@VehicleNumber,@VehicleType=@VehicleType,@SlotNumber=@SlotNumber," +
                     "@IsOccupied=@IsOccupied," +
                     "@CreatedBy=@CreatedBy,@CreatedDateTime=@CreatedDateTime," +
                     "@LoginID=@LoginID,@VImagePath=@VImagePath,@Flag=@Flag"
                    , sp).AsEnumerable().FirstOrDefault();
                await _context.SaveChangesAsync();
                return new OkObjectResult(_tbl_Parking);
            }
            catch (Exception)
            {



            }
            return null;
        }
        public async Task<IActionResult> GetAllParking(Tbl_Parking tbl_Parking)
        {
            try
            {
                if (_context.Tbl_Parking == null)
                {
                    return new NotFoundResult();
                }
                SqlParameter[] sp = new SqlParameter[1];
                sp[0] = new SqlParameter("@Flag", tbl_Parking.Flag ?? (object)DBNull.Value);
                var _tbl_Parking = await _context.Tbl_Parking
                   .FromSqlRaw("EXEC [dbo].[USP_Tbl_Parking]  @Flag=@Flag", sp)
                   .AsNoTracking()
                   .ToListAsync();
                return new OkObjectResult(_tbl_Parking);
            }
            catch (Exception)
            {
            }
            return null;
        }
        public async Task<IActionResult> GetParking(Tbl_Parking tbl_Parking)
        {
            try
            {
                if (_context.Tbl_Parking == null)
                {
                    return new NotFoundResult();
                }
                SqlParameter[] sp = new SqlParameter[2];
                sp[0] = new SqlParameter("@UID", tbl_Parking.UID ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@Flag", tbl_Parking.Flag ?? (object)DBNull.Value);
                var _tbl_Parking = await _context.Tbl_Parking.FromSqlRaw
                    ("EXEC [dbo].[USP_Tbl_Parking] @UID=@UID,@Flag=@Flag", sp)
                    .AsNoTracking().ToListAsync();
                if (_tbl_Parking != null)
                {
                    return new OkObjectResult(_tbl_Parking);
                }
            }
            catch (Exception ex)
            {
                //throw;
            }
            return null;
        }

        public async Task<IActionResult> DeleteParking(Tbl_Parking tbl_Parking)
        {
            try
            {
                if (_context.Tbl_Parking == null)
                {
                    return new NotFoundResult();
                }
                SqlParameter[] sp = new SqlParameter[2];
                sp[0] = new SqlParameter("@ParkingID", tbl_Parking.ParkingId ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@Flag", tbl_Parking.Flag ?? (object)DBNull.Value);
                var _tbl_Parking = _context.Tbl_Parking.FromSqlRaw
                    ("EXEC [dbo].[USP_Tbl_Parking] @ParkingID=@ParkingID,@Flag=@Flag", sp).AsNoTracking().AsEnumerable().FirstOrDefault();
                if (_tbl_Parking != null)
                {
                    return new OkObjectResult(_tbl_Parking);
                }
            }
            catch (Exception ex)
            {
                //throw;
            }
            return null;
        }

        public async Task<IActionResult> UpdateParking(Tbl_Parking tbl_Parking)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[11];
                sp[0] = new SqlParameter("@ParkingID", tbl_Parking.ParkingId ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@FID", tbl_Parking.FID ?? (object)DBNull.Value);
                sp[2] = new SqlParameter("@VehicleNumber", tbl_Parking.VehicleNumber ?? (object)DBNull.Value);
                sp[3] = new SqlParameter("@VehicleType", tbl_Parking.VehicleType ?? (object)DBNull.Value);
                sp[4] = new SqlParameter("@SlotNumber", tbl_Parking.SlotNumber ?? (object)DBNull.Value);
                sp[5] = new SqlParameter("@IsOccupied", tbl_Parking.IsOccupied ?? (object)DBNull.Value);
               // sp[6] = new SqlParameter("@StartTime", tbl_Parking.StartTime ?? (object)DBNull.Value);
               // sp[7] = new SqlParameter("@EndTime", tbl_Parking.EndTime ?? (object)DBNull.Value);
               // sp[8] = new SqlParameter("@CreatedBy", tbl_Parking.CreatedBy ?? (object)DBNull.Value);
               // sp[9] = new SqlParameter("@CreatedDateTime", tbl_Parking.CreatedDateTime ?? (object)DBNull.Value);
                sp[6] = new SqlParameter("@UpdatedBy", tbl_Parking.UpdatedBy ?? (object)DBNull.Value);
                sp[7] = new SqlParameter("@UpdatedDateTime", tbl_Parking.UpdatedDateTime ?? (object)DBNull.Value);
                sp[8] = new SqlParameter("@LoginID", tbl_Parking.LoginID ?? (object)DBNull.Value);
                sp[9] = new SqlParameter("@VImagePath", tbl_Parking.VImagePath ?? (object)DBNull.Value);
                sp[10] = new SqlParameter("@Flag", tbl_Parking.Flag ?? (object)DBNull.Value);
                var _tbl_Parking = _context.Tbl_Parking
                    .FromSqlRaw("EXEC [dbo].[USP_Tbl_Parking] @ParkingID=@ParkingID, @FID=@FID," +
                     "@VehicleNumber=@VehicleNumber,@VehicleType=@VehicleType,@SlotNumber=@SlotNumber," +
                     "@IsOccupied=@IsOccupied," +
                     "@UpdatedBy=@UpdatedBy,@UpdatedDateTime=@UpdatedDateTime,@LoginID=@LoginID,@VImagePath=@VImagePath," +
                     "@Flag=@Flag", sp).AsEnumerable().
                        FirstOrDefault();
                await _context.SaveChangesAsync();
                return new OkObjectResult(_tbl_Parking);

            }
            catch (Exception)
            {


            }
            return null;
        }
        public async Task<IActionResult> GetParkingSlot(Tbl_Parking tbl_Parking)
        {
            try
            {
                if (_context.Tbl_Parking == null)
                {
                    return new NotFoundResult();
                }
                SqlParameter[] sp = new SqlParameter[2];
                sp[0] = new SqlParameter("@FID", tbl_Parking.FID ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@Flag", tbl_Parking.Flag ?? (object)DBNull.Value);
                var _tbl_Parking = await _context.Tbl_Parking
                   .FromSqlRaw("EXEC [dbo].[USP_Tbl_Parking]  @FID=@FID, @Flag=@Flag", sp)
                   .AsNoTracking()
                   .ToListAsync();
                return new OkObjectResult(_tbl_Parking);
            }
            catch (Exception)
            {
            }
            return null;
        }
        public async Task<IActionResult> GetAllParkingList(Tbl_Parking tbl_Parking)
        {
            try
            {
                if (_context.Tbl_Parking == null)
                {
                    return new NotFoundResult();
                }
                SqlParameter[] sp = new SqlParameter[1];
                sp[0] = new SqlParameter("@Flag", tbl_Parking.Flag ?? (object)DBNull.Value);
                var _tbl_Parking = await _context.Tbl_Parking
                   .FromSqlRaw("EXEC [dbo].[USP_Tbl_Parking]  @Flag=@Flag", sp)
                   .AsNoTracking()
                   .ToListAsync();
                return new OkObjectResult(_tbl_Parking);
            }
            catch (Exception)
            {
            }
            return null;
        }
        public async Task<IActionResult> GetParkingDetailsById(Tbl_Parking tbl_Parking)
            {
            try
            {
                if (_context.Tbl_Parking == null)
                {
                    return new NotFoundResult();
                }
                SqlParameter[] sp = new SqlParameter[2];
                sp[0] = new SqlParameter("@FID", tbl_Parking.FID ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@Flag", tbl_Parking.Flag ?? (object)DBNull.Value);
                var _tbl_Parking = _context.Tbl_Parking.FromSqlRaw
                    ("EXEC [dbo].[USP_Tbl_Parking] @FID=@FID,@Flag=@Flag", sp).AsNoTracking().AsEnumerable().FirstOrDefault();
                if (_tbl_Parking != null)
                {
                    return new OkObjectResult(_tbl_Parking);
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