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
    public class SocietyUserController : ControllerBase
    {
       private readonly ISocietyUser _repository;
        public SocietyUserController(ISocietyUser repository)
        {
            _repository = repository;
        }
        [HttpPost("GetLogin")]
        public async Task<IActionResult> GetLogin(Tbl_User objCust)
        {
            try
            {
                // Assuming you have a repository instance (e.g., _repository) that implements ISocietyUser
                 // Replace with actual repository initialization
                var result = await _repository.GetLogin(objCust);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                // Log the exception (ex) as needed
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("AddUser")]
        public async Task<IActionResult> AddUser(Tbl_User objCust)
        {
            try
            {
                // Assuming you have a repository instance (e.g., _repository) that implements ISocietyUser
                 // Replace with actual repository initialization
                var result = await _repository.AddUser(objCust);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                // Log the exception (ex) as needed
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("UpdateUser")]
        public async Task<IActionResult> UpdateUser(Tbl_User objCust)
        {
            try
            {
                // Assuming you have a repository instance (e.g., _repository) that implements ISocietyUser
                 // Replace with actual repository initialization
                var result = await _repository.UpdateUser(objCust);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                // Log the exception (ex) as needed
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpDelete("DeleteUser")]
        public async Task<IActionResult> DeleteUser(Tbl_User objCust)
        {
            try
            {
                // Assuming you have a repository instance (e.g., _repository) that implements ISocietyUser
                 // Replace with actual repository initialization
                var result = await _repository.DeleteUser(objCust);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                // Log the exception (ex) as needed
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        
        [HttpPost("GetAllUsers")]
        public async Task<IActionResult> GetAllUsers(Tbl_User objcust)
        {
            try
            {
                var result = await _repository.GetAllUsers(objcust);
                return result ?? NotFound();


                
            }
            catch (Exception)
            {
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPost("userimg")]
        public async Task<IActionResult> UploadGuestImage(IFormFile file)
        {
            if (file == null || file.Length == 0)
                return BadRequest("No file uploaded.");

            var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "Images", "UserImg");

            if (!Directory.Exists(uploadsFolder))
                Directory.CreateDirectory(uploadsFolder);

            var filePath = Path.Combine(uploadsFolder, file.FileName);

            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            return Ok(new { filePath });
        }
        [HttpPost("UpdateDeviceID")]
        public async Task<IActionResult> UpdateDeviceID(Tbl_User objCust)
        {
            try
            {
                // Assuming you have a repository instance (e.g., _repository) that implements ISocietyUser
                 // Replace with actual repository initialization
                var result = await _repository.UpdateDeviceID(objCust);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                // Log the exception (ex) as needed
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
    }
}
