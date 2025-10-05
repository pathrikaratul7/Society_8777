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
    public class IncidentController : ControllerBase
    {
        readonly private IInc _IInc;
        public IncidentController(IInc inc)
        {
                _IInc = inc;
        }
        [HttpPost("GetNotification")]
        public async Task<IActionResult> GetNotification(Models.Tbl_Incident tbl_INC)
        {
            try
            {
                var getNoti = await _IInc.GetNotification(tbl_INC);
                return getNoti ?? NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("AddIncident")]
        public async Task<IActionResult> AddIncident(Models.Tbl_Incident tbl_INC)
        {
            try
            {
                tbl_INC.INCImage = _IInc.ConvertImageToByteArray(tbl_INC.INCImagePath);
                var addInc = await _IInc.AddIncident(tbl_INC);
                return addInc ?? NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("UpdateIncident")]
        public async Task<IActionResult> UpdateIncident(Models.Tbl_Incident tbl_INC)
        {
            try
            {
                var updateInc = await _IInc.UpdateIncident(tbl_INC);
                return updateInc ?? NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("DeleteIncident")]
        public async Task<IActionResult> DeleteIncident(Models.Tbl_Incident tbl_INC)
        {
            try
            {
                var deleteInc = await _IInc.DeleteIncident(tbl_INC);
                return deleteInc ?? NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("GetAllIncidentList")]
        public async Task<IActionResult> GetAllIncidentList(Models.Tbl_Incident tbl_INC)
        {
            try
            {
                var getAllInc = await _IInc.GetAllIncidentList(tbl_INC);
                return getAllInc ?? NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }

    }
}
