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
    
    public class PreGuestController : ControllerBase
    {
        private readonly IPreGuest _guest;
        public PreGuestController(IPreGuest preGuest)
        {
                _guest = preGuest;
        }

        [HttpPost("PreGuestAdd")]
        public async Task<IActionResult> PreGuestAdd(Tbl_Guest guest, CancellationToken cancellationToken)
        {
            var data = await _guest.PreGuestAdd(guest, cancellationToken);
            return data ?? NotFound();
        
        }
    }
}
