using Microsoft.AspNetCore.Mvc;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FcmController : ControllerBase
    {
        private readonly IFCMToken _fcmTokenRepo;

        public FcmController(IFCMToken fcmTokenRepo)
        {
            _fcmTokenRepo = fcmTokenRepo;
        }

        [HttpPost("SaveToken")]
        public async Task<IActionResult> SaveToken([FromBody] Tbl_FCMToken request, CancellationToken cancellationToken)
        {
            try
            {
                if (request == null || string.IsNullOrWhiteSpace(request.FcmToken))
                    return BadRequest(new { Message = "Invalid request. Token is required." });

                var result = await _fcmTokenRepo.SaveToken(request, cancellationToken);
                return result ?? StatusCode(500, new { Message = "Failed to save token." });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Message = "Internal server error", Details = ex.Message });
            }
        }
    }
}
