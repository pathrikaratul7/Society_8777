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
    public class PreFlatController : ControllerBase
    {
        private readonly IPreFlatOwner _owner;
        public PreFlatController(IPreFlatOwner preFlatOwner)
        {
                _owner= preFlatOwner;
        }
        [HttpPost("PreGetAllFlat")]
        public async Task<IActionResult> PreGetAllFlat(Tbl_Flat flat, CancellationToken cancellationToken)
        {
            var Data = await _owner.GetAllFlat(flat, cancellationToken);
            return Data ?? NotFound();
            //if (Data != null)
            //{
            //    return new OkObjectResult(Data);
            //}
            //else {
              
            //    return new NotFoundObjectResult(new
            //    { 
            //        StatusCode = 404,
            //        Message="No flat found, Please reach out to Application support"
            //    });
            
            //}
            
        }
    }
}
