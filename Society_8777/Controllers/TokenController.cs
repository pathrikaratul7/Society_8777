using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Society_8777.CommonLogic;
using Society_8777.DataBaseContext;
using Society_8777.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Net;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

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
        //        [HttpPost]
        //        [AllowAnonymous]
        //        public async Task<Token> Post(Tbl_User _userInfo)
        //        {

        //            try
        //            {




        //                if (_userInfo != null && !string.IsNullOrEmpty(_userInfo.UEmail) && !string.IsNullOrEmpty(_userInfo.UPass))
        //                {
        //                    var user = await GetUser(_userInfo.UEmail, _userInfo.UPass,_userInfo.Flag);
        //                    if (user != null)
        //                    {
        //                        var claims = new[]
        // {
        //    new Claim(JwtRegisteredClaimNames.Sub, _configuration["Jwt:Subject"]),
        //    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
        //    new Claim(JwtRegisteredClaimNames.Iat,
        //              new DateTimeOffset(DateTime.UtcNow).ToUnixTimeSeconds().ToString(),
        //              ClaimValueTypes.Integer64),
        //    new Claim("UID", user.UID.ToString()),
        //    new Claim("UName", user.UName),
        //    new Claim("UEmail", user.UEmail)
        //};

        //                        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
        //                        var signIn = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        //                        var token = new JwtSecurityToken(
        //                            issuer: _configuration["Jwt:Issuer"],
        //                            audience: _configuration["Jwt:Audience"],
        //                            claims: claims,
        //                            expires: DateTime.UtcNow.AddMinutes(10),
        //                            signingCredentials: signIn
        //                        );

        //                        var jwtToken = new JwtSecurityTokenHandler().WriteToken(token);



        //                        _ts.token = (new JwtSecurityTokenHandler().WriteToken(token));
        //                       // _ts.refreshToken = Convert.ToBase64String(RandomNumberGenerator.GetBytes(64));
        //                        _ts.Message = "Token genereted Succesfully...";
        //                        _ts.Status = "Success";
        //                        _ts.StatusCode = 1;
        //                        _ts.tokenexpiry = token.ValidTo;
        //                    }
        //                    else
        //                    {
        //                        _ts.token = null;
        //                        _ts.Message = "Invalid credentials Or User not found";
        //                        _ts.Status = "Un-success";
        //                        _ts.StatusCode = 2;
        //                        _ts.tokenexpiry = null;
        //                        return _ts;
        //                        // return BadRequest("Invalid credentials");
        //                    }
        //                }
        //                else
        //                {
        //                    _ts.token = null;
        //                    _ts.Message = "User Email & Password cannot be blank..?";
        //                    _ts.Status = "Un-success";
        //                    _ts.StatusCode = 3;
        //                    _ts.tokenexpiry = null;
        //                    return _ts;
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                _ts.token = null;
        //                _ts.Message = ex.Message;
        //                _ts.Status = "Un-success";
        //                _ts.StatusCode = 0;
        //                _ts.tokenexpiry = null;

        //            }
        //            return _ts;
        //        }

        [HttpPost]
        [AllowAnonymous]
        
        public async Task<Token> Post(Tbl_User _userInfo, [FromHeader] string clientType = "web")
        {
            var response = new Token();

            if (_userInfo == null || string.IsNullOrEmpty(_userInfo.UEmail) || string.IsNullOrEmpty(_userInfo.UPass))
            {
                response.Message = "User Email & Password cannot be blank";
                response.Status = "Un-success";
                response.StatusCode = 3;
                return response;
            }

            var user = await GetUser(_userInfo.UEmail, _userInfo.UPass, _userInfo.Flag);
            if (user == null)
            {
                response.Message = "Invalid credentials or user not found";
                response.Status = "Un-success";
                response.StatusCode = 2;
                return response;
            }

            // JWT
            var claims = new[]
            {
        new Claim(JwtRegisteredClaimNames.Sub, _configuration["Jwt:Subject"]),
        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
        new Claim("UID", user.UID.ToString()),
        new Claim("UEmail", user.UEmail)
    };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var jwtToken = new JwtSecurityToken(
                issuer: _configuration["Jwt:Issuer"],
                audience: _configuration["Jwt:Audience"],
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(10),
                signingCredentials: creds
            );

            var accessToken = new JwtSecurityTokenHandler().WriteToken(jwtToken);

            // Refresh token
            var refreshToken = Convert.ToBase64String(RandomNumberGenerator.GetBytes(64));
            var refreshTokenHash = Convert.ToBase64String(SHA256.HashData(Encoding.UTF8.GetBytes(refreshToken)));

            _Context.tbl_RefreshTokens.Add(new Tbl_RefreshTokens
            {
                Id = Guid.NewGuid(),
                UserId = user.UID,
                TokenHash = refreshTokenHash,
                ExpiresAt = DateTime.UtcNow.AddDays(7),
                IsRevoked = false,
                CreatedAt = DateTime.UtcNow
            });

            await _Context.SaveChangesAsync();

            // --------------------------
            // Send refresh token depending on client type
            // --------------------------
            if (clientType.ToLower() == "web")
            {
                // Web → HttpOnly cookie
                Response.Cookies.Append("refreshToken", refreshToken, new CookieOptions
                {
                    HttpOnly = true,
                    Secure = true,
                    SameSite = SameSiteMode.Strict,
                    Expires = DateTime.UtcNow.AddDays(7)
                });

                response.refreshToken = null; // not returned in JSON
            }
            else
            {
                // Mobile → return in JSON so client can store in SecureStorage
                response.refreshToken = refreshToken;
            }

            response.token = accessToken;
            response.tokenexpiry = jwtToken.ValidTo;
            response.Message = "Token generated successfully";
            response.Status = "Success";
            response.StatusCode = 1;

            return response;
        }


        [AllowAnonymous]
        private async Task<Tbl_User> GetUser(string email, string password, string Flag)
        {
            //return await _Context.tbl_User.FirstOrDefaultAsync(u => u.UEmail == email && u.UPass == password);
            try
            {
               

                SqlParameter[] sqlpara = new SqlParameter[3];
                sqlpara[0] = new SqlParameter("@UEmail", email ?? (object)DBNull.Value);
                sqlpara[1] = new SqlParameter("@UPass", CommomFunction.Encrypt_Dycrypt_Bank.EncryptString(password) ?? (object)DBNull.Value);
                sqlpara[2] = new SqlParameter("@Flag", Flag ?? (object)DBNull.Value);

                var _tbl_User = _Context.tbl_User
       .FromSqlRaw("EXEC USP_Tbl_User @UEmail=@UEmail, @UPass=@UPass, @Flag=@Flag", sqlpara)
       .AsNoTracking()
       .AsEnumerable()
       .FirstOrDefault();

                if (_tbl_User != null)
                {
                    return _tbl_User;
                }

            }
            catch (Exception ex)
            {
                //throw;
            }
            return null;
        }
        [HttpPost("refresh")]
        [AllowAnonymous]
        public async Task<Token> Refresh([FromBody] RefreshRequestDTO request)
        {
            var response = new Token();

            try
            {
                // 1️⃣ Find the refresh token in DB
                var decodedToken = WebUtility.UrlDecode(request.RefreshToken);

                // 2️⃣ Hash the decoded token
                var refreshTokenHash = Convert.ToBase64String(
                    SHA256.HashData(Encoding.UTF8.GetBytes(decodedToken))
                );

                var existingToken = await _Context.tbl_RefreshTokens
                    .FirstOrDefaultAsync(t => t.UserId == request.UserId
                                           && t.TokenHash == refreshTokenHash
                                           && !t.IsRevoked
                                           && t.ExpiresAt > DateTime.UtcNow);

                if (existingToken == null)
                {
                    response.Message = "Invalid or expired refresh token";
                    response.Status = "Un-success";
                    response.StatusCode = 2;
                    return response;
                }

                // 2️⃣ Revoke the old refresh token
                existingToken.IsRevoked = true;
                existingToken.RevokedAt = DateTime.UtcNow;
                _Context.tbl_RefreshTokens.Update(existingToken);

                // 3️⃣ Generate a new JWT
                var user = await _Context.tbl_User
      .Where(u => u.UID == request.UserId)
      .Select(u => new
      {
          u.UID,
          u.UEmail,
          u.UName,
          u.UPass,
          u.UMobile
      })
      .FirstOrDefaultAsync();
                if (user == null)
                {
                    response.Message = "User not found";
                    response.Status = "Un-success";
                    response.StatusCode = 3;
                    return response;
                }

                var claims = new[]
                {
            new Claim(JwtRegisteredClaimNames.Sub, _configuration["Jwt:Subject"]),
            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            new Claim("UID", user.UID.ToString()),
            new Claim("UEmail", user.UEmail)
        };

                var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
                var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

                var jwtToken = new JwtSecurityToken(
                    issuer: _configuration["Jwt:Issuer"],
                    audience: _configuration["Jwt:Audience"],
                    claims: claims,
                    expires: DateTime.UtcNow.AddMinutes(10),
                    signingCredentials: creds
                );

                var accessToken = new JwtSecurityTokenHandler().WriteToken(jwtToken);

                // 4️⃣ Generate a new refresh token
                var newRefreshToken = Convert.ToBase64String(RandomNumberGenerator.GetBytes(64));
                var newRefreshTokenHash = Convert.ToBase64String(
                    SHA256.HashData(Encoding.UTF8.GetBytes(newRefreshToken))
                );

                _Context.tbl_RefreshTokens.Add(new Tbl_RefreshTokens
                {
                    Id = Guid.NewGuid(),
                    UserId = user.UID,
                    TokenHash = newRefreshTokenHash,
                    ExpiresAt = DateTime.UtcNow.AddDays(7),
                    IsRevoked = false,
                    CreatedAt = DateTime.UtcNow
                });

                await _Context.SaveChangesAsync();

                // 5️⃣ Send new refresh token as HttpOnly cookie
                Response.Cookies.Append("refreshToken", newRefreshToken, new CookieOptions
                {
                    HttpOnly = true,
                    Secure = true,
                    SameSite = SameSiteMode.Strict,
                    Expires = DateTime.UtcNow.AddDays(7)
                });

                // 6️⃣ Return new JWT info
                response.token = accessToken;
                response.tokenexpiry = jwtToken.ValidTo;
                response.Message = "Token refreshed successfully";
                response.Status = "Success";
                response.StatusCode = 1;
            }
            catch (Exception ex)
            {
                response.Message = ex.Message;
                response.Status = "Un-success";
                response.StatusCode = 0;
            }

            return response;
        }

    }
}
