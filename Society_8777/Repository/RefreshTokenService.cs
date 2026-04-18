using Society_8777.Interface;
using Society_8777.Models;
using System;
using System.Security.Cryptography;
using System.Text;
using Society_8777.DataBaseContext;
using Microsoft.EntityFrameworkCore;

namespace Society_8777.Repository
{
    public class RefreshTokenService : IRefreshTokenService
    {
        private readonly Society_8777.DataBaseContext.DataBaseContext _context;

        public RefreshTokenService(Society_8777.DataBaseContext.DataBaseContext context)
        {
            _context = context;
        }

        public async Task<Tbl_RefreshTokens?> GetActiveRefreshTokenAsync(long userId, string token)
        {
            var tokenHash = ComputeHash(token);

            return await _context.tbl_RefreshTokens!
                .Where(t => t.UserId == userId &&
                            t.TokenHash == tokenHash &&
                            !t.IsRevoked &&
                            t.ExpiresAt > DateTime.UtcNow)
                .FirstOrDefaultAsync();
        }

        public async Task<Tbl_RefreshTokens> GenerateRefreshTokenAsync(long userId, int daysValid = 30)
        {
            var token = GenerateRandomToken();
            var refreshToken = new Tbl_RefreshTokens
            {
                Id = Guid.NewGuid(),
                UserId = userId,
                TokenHash = ComputeHash(token),
                ExpiresAt = DateTime.UtcNow.AddDays(daysValid),
                IsRevoked = false,
                CreatedAt = DateTime.UtcNow
            };

            _context.tbl_RefreshTokens!.Add(refreshToken);
            await _context.SaveChangesAsync();

            refreshToken.TokenHash = token; // return plain token for client
            return refreshToken;
        }

        public async Task RevokeTokenAsync(Tbl_RefreshTokens token)
        {
            token.IsRevoked = true;
            token.RevokedAt = DateTime.UtcNow;
            _context.tbl_RefreshTokens!.Update(token);
            await _context.SaveChangesAsync();
        }

        // ---------------- Helpers ----------------
        private string GenerateRandomToken(int size = 64)
        {
            var randomNumber = new byte[size];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(randomNumber);
            }
            return Convert.ToBase64String(randomNumber);
        }

        private string ComputeHash(string token)
        {
            using var sha256 = SHA256.Create();
            var bytes = Encoding.UTF8.GetBytes(token);
            var hash = sha256.ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }
    }

}
