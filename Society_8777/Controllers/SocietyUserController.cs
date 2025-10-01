using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Society_8777.Interface;
using Society_8777.Models;
using SqlBankApi7.Repository;

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
                return StatusCode(500, "Internal server error");
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
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPut("UpdateUser")]
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
                return StatusCode(500, "Internal server error");
            }
        }
    }
}
