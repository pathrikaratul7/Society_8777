using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Society_8777.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Society_8777.DataBaseContext;
using Microsoft.EntityFrameworkCore;

namespace Society_8777.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TokenController : ControllerBase
    {
        public IConfiguration _configuration;
        private readonly DataBaseContext.DataBaseContext _Context;
        private Token _ts;
        public TokenController(IConfiguration configuration, DataBaseContext.DataBaseContext context, Token ts)
        {
            _configuration = configuration;
            _Context = context;
            _ts = ts;


        }
        [HttpPost]
        [AllowAnonymous]
        public async Task<Token> Post(Tbl_User _userInfo)
        {
            
            try
            {




                if (_userInfo != null && !string.IsNullOrEmpty(_userInfo.UEmail) && !string.IsNullOrEmpty(_userInfo.UPass))
                {
                    var user = await GetUser(_userInfo.UEmail, _userInfo.UPass);
                    if (user != null)
                    {
                        var claims = new[]
 {
    new Claim(JwtRegisteredClaimNames.Sub, _configuration["Jwt:Subject"]),
    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
    new Claim(JwtRegisteredClaimNames.Iat,
              new DateTimeOffset(DateTime.UtcNow).ToUnixTimeSeconds().ToString(),
              ClaimValueTypes.Integer64),
    new Claim("UID", user.UID.ToString()),
    new Claim("UName", user.UName),
    new Claim("UEmail", user.UEmail)
};

                        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
                        var signIn = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

                        var token = new JwtSecurityToken(
                            issuer: _configuration["Jwt:Issuer"],
                            audience: _configuration["Jwt:Audience"],
                            claims: claims,
                            expires: DateTime.UtcNow.AddMinutes(10),
                            signingCredentials: signIn
                        );

                        var jwtToken = new JwtSecurityTokenHandler().WriteToken(token);



                        _ts.token = (new JwtSecurityTokenHandler().WriteToken(token));
                        _ts.Message = "Token genereted Succesfully...";
                        _ts.Status = "Success";
                        _ts.StatusCode = 1;
                        _ts.tokenexpiry = token.ValidTo;
                    }
                    else
                    {
                        _ts.token = null;
                        _ts.Message = "Invalid credentials Or User not found";
                        _ts.Status = "Un-success";
                        _ts.StatusCode = 2;
                        _ts.tokenexpiry = null;
                        return _ts;
                        // return BadRequest("Invalid credentials");
                    }
                }
                else
                {
                    _ts.token = null;
                    _ts.Message = "User Email & Password cannot be blank..?";
                    _ts.Status = "Un-success";
                    _ts.StatusCode = 3;
                    _ts.tokenexpiry = null;
                    return _ts;
                }
            }
            catch (Exception ex)
            {
                _ts.token = null;
                _ts.Message = ex.Message;
                _ts.Status = "Un-success";
                _ts.StatusCode = 0;
                _ts.tokenexpiry = null;

            }
            return _ts;
        }
        [AllowAnonymous]
        private async Task<Tbl_User> GetUser(string email, string password)
        {
            return await _Context.tbl_User.FirstOrDefaultAsync(u => u.UEmail == email && u.UPass == password);
        }
    }
}
