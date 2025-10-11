using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Society_8777.Interface;

namespace Society_8777.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class FlatController : ControllerBase
    {
        readonly private IFlat _repository;
        public FlatController(IFlat flat)
        {
            _repository = flat;

        }
        [HttpPost("AddFlat")]
        public async Task<IActionResult> AddFlat(Models.Tbl_Flat objFlat)
        {
            try
            {
                // Assuming you have a repository instance (e.g., _repository) that implements IFlat
                 // Replace with actual repository initialization

                var result = await _repository.AddFlat(objFlat);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                // Log the exception (ex) as needed
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("GetAllFlat")]
        public async Task<IActionResult> GetAllFlat(Models.Tbl_Flat objFlat)
        {
            try
            {
                // Assuming you have a repository instance (e.g., _repository) that implements IFlat
                 // Replace with actual repository initialization
                var result = await _repository.GetAllFlat(objFlat);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                // Log the exception (ex) as needed
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("UpdateFlat")]
        public async Task<IActionResult> UpdateFlat(Models.Tbl_Flat objFlat)
        {
            try
            {
                // Assuming you have a repository instance (e.g., _repository) that implements IFlat
                // Replace with actual repository initialization
         
        var result = await _repository.UpdateFlat(objFlat);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                // Log the exception (ex) as needed
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpDelete("DeleteFlat")]
        public async Task<IActionResult> DeleteFlat(Models.Tbl_Flat objFlat)
        {
            try
            {
                // Assuming you have a repository instance (e.g., _repository) that implements IFlat
                 // Replace with actual repository initialization
                var result = await _repository.DeleteFlat(objFlat);
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
