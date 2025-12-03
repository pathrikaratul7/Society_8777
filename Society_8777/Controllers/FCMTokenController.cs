using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AllowAnonymous]
    public class FCMTokenController : ControllerBase
    {
        readonly IFCMToken _FCM;
        public FCMTokenController(IFCMToken fCMToken)
        {
                _FCM = fCMToken;
        }
        [HttpPost("SaveToken")]
        [AllowAnonymous]
        public async Task<IActionResult> SaveToken([FromBody] Tbl_FCMToken request)
        {
            return await  _FCM.SaveToken(request);
        }

    }
}
