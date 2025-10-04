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
    public class GuestController : ControllerBase
    {
        private readonly IGuest _guest;
        public GuestController(IGuest guest)
        {
                _guest = guest;
        }
        [HttpPost]
     [Route("GetNotification")]
        public async Task<IActionResult> GetNotification(Tbl_Guest tbl_Guest)
        {
            try
            {
                var result = await _guest.GetNotification(tbl_Guest);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                // Log the exception (ex) as needed
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }

        }
        [HttpPost]
        [Route("AddGuest")]
        public async Task<IActionResult> AddGuest(Tbl_Guest tbl_Guest)
        {
            try
            {
                tbl_Guest.GImage = _guest.ConvertImageToByteArray(tbl_Guest.GImagePath);
                var result = await _guest.AddGuest(tbl_Guest);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                // Log the exception (ex) as needed
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPut]
        [Route("UpdateGuest")]
        public async Task<IActionResult> UpdateGuest(Tbl_Guest tbl_Guest)
        {
            
            try
            {
                tbl_Guest.GImage = _guest.ConvertImageToByteArray(tbl_Guest.GImagePath);
                var result = await _guest.UpdateGuest(tbl_Guest);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                // Log the exception (ex) as needed
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpDelete]
        [Route("DeleteGuest")]
        public async Task<IActionResult> DeleteGuest(Tbl_Guest tbl_Guest)
        {
            
            try
            {
                var result = await _guest.DeleteGuest(tbl_Guest);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                // Log the exception (ex) as needed
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost]
        [Route("GetAllGuestList")]
        public async Task<IActionResult> GetAllGuestList(Tbl_Guest tbl_Guest)
        {
            
            try
            {
                var result = await _guest.GetAllGuestList(tbl_Guest);
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
