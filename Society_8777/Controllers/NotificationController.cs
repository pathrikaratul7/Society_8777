using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;
using System;
using Society_8777.DataBaseContext;
using Microsoft.EntityFrameworkCore;
namespace Society_8777.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    
    public class NotificationController : ControllerBase
    {
        private readonly DataBaseContext.DataBaseContext _context;

        public NotificationController(DataBaseContext.DataBaseContext context)
        {
            _context = context;
        }

        //[HttpPost("SaveToken")]
        //public async Task<IActionResult> SaveToken([FromBody] SaveFcmTokenDto dto)
        //{
        //    if (string.IsNullOrWhiteSpace(dto.Token))
        //        return BadRequest("Token is required");

        //    // Check if token already exists
        //    var existing = await _context.UserFcmTokens
        //        .FirstOrDefaultAsync(x => x.Token == dto.Token);

        //    if (existing == null)
        //    {
        //        var token = new UserFcmToken
        //        {
        //            UserId = dto.UserId,
        //            Token = dto.Token,
        //            Platform = dto.Platform,
        //            CreatedOn = DateTime.UtcNow
        //        };

        //        _context.UserFcmTokens.Add(token);
        //        await _context.SaveChangesAsync();
        //    }

        //    return Ok(new { message = "FCM token saved successfully" });
        //}
    }
}
