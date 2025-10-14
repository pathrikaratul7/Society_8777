using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ParkController : ControllerBase
    {
        readonly IPark _Ipark;
        public ParkController(IPark park)
        {
            _Ipark = park;
        }
       
        [HttpPost("AddParking")]
        
        public async Task<IActionResult> AddParking(Tbl_Parking tbl_Parking)
        {
            try
            {
                var addPark = await _Ipark.AddParking(tbl_Parking);
                return addPark ?? NotFound();

            }
            catch (Exception ex)
            {

                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
            
        }
        [HttpPost("UpdateParking")]
        public async Task<IActionResult> UpdateParking(Tbl_Parking tbl_Parking)
        {
            try
            {
                var updatePark = await _Ipark.UpdateParking(tbl_Parking);
                return updatePark ?? NotFound();
            }
            catch (Exception ex)
            {

                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("DeleteParking")]
        public async Task<IActionResult> DeleteParking(Tbl_Parking tbl_Parking)
        {
            try
            {
                var DeletePark = await _Ipark.DeleteParking(tbl_Parking);
                return DeletePark ?? NotFound();
            }
            catch (Exception ex)
            {

                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("GetAllParkingList")]
        
        public async Task<IActionResult> GetAllParkingList(Tbl_Parking tbl_Parking)
        {
            try
            {
                var GetAllPark = await _Ipark.GetAllParkingList(tbl_Parking);
                return GetAllPark ?? NotFound();
            }
            catch (Exception ex)
            {

                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("GetParkingDetailsById")]
        
        public async Task<IActionResult> GetParkingDetailsById(Tbl_Parking tbl_Parking)
        {
            
            try
            {
                var GetParkingDetails =  await _Ipark.GetParkingDetailsById(tbl_Parking);
                return GetParkingDetails ?? NotFound();
            }
            catch (Exception ex)
            {

                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("Parkimg")]
        public async Task<IActionResult> UploadGuestImage(IFormFile file)
        {
            if (file == null || file.Length == 0)
                return BadRequest("No file uploaded.");

            var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "Images", "ParkImg");

            if (!Directory.Exists(uploadsFolder))
                Directory.CreateDirectory(uploadsFolder);

            var filePath = Path.Combine(uploadsFolder, file.FileName);

            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            return Ok(new { filePath });
        }
    }
}
