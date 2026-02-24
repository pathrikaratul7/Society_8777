using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Society_8777.Interface;

namespace Society_8777.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class MySocChatBotController : ControllerBase
    {
        readonly private IBotService _botService;
        public MySocChatBotController(IBotService botService)
        {
                _botService = botService;
        }
        [HttpGet("MySocApp7GenerateResponse")]
        public Task<string> GenerateResponse(string message, string userId)
       
        {
           var response = _botService.GenerateResponseAsync(message, userId);
            return response;
        }

    }
}
