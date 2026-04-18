using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ErrorLogController : ControllerBase
    {
        readonly private IErrorLog _errorLog;
        public ErrorLogController(IErrorLog errorLog)
        {
                _errorLog = errorLog;
        }
        [HttpPost("LogError")]
        public async Task<IActionResult> LogError(Tbl_ErrorLogs tbl_ErrorLogs)
        {
            try
            {
                var res = await _errorLog.LogError(tbl_ErrorLogs);
                return res ?? NotFound();
            }
            catch (Exception)
            {

                throw;
            }
            

        }
        [HttpPost("GetAllError")]
        public async Task<IActionResult> GetAllError(Tbl_ErrorLogs tbl_Error)
        {
            try
            {
                var list = await _errorLog.GetAllError(tbl_Error);
                return list ?? NotFound();
            }
            catch (Exception)
            {

                throw;
            }

           
        
        }
    }
}
