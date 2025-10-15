using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Society_8777.Interface;

namespace Society_8777.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FirebaseController : ControllerBase
    {
       private readonly IFireBaseNotification _firebaseNotification;
        public FirebaseController(IFireBaseNotification fireBaseNotification)
        {
                _firebaseNotification = fireBaseNotification;
        }
      [HttpPost("SendGuestNotification")]
        public async Task<IActionResult> SendGuestNotification(string guestName, string flatNumber)
        {
            if (string.IsNullOrEmpty(guestName) || string.IsNullOrEmpty(flatNumber))
            {
                return BadRequest("Guest name and flat number are required.");
            }
            try
            {
                await _firebaseNotification.SendGuestNotificationAsync(guestName, flatNumber);
                return Ok("Notification sent successfully.");
            }
            catch (Exception ex)
            {
                // Log the exception (not implemented here)
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}
