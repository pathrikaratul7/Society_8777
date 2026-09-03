using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IRefreshTokenService
    {
        /// <summary>
        /// Get active refresh token for a user
        /// </summary>
        Task<Tbl_RefreshTokens?> GetActiveRefreshTokenAsync(long userId, string token, CancellationToken cancellationToken);

        /// <summary>
        /// Generate a new refresh token for a user
        /// </summary>
        Task<Tbl_RefreshTokens> GenerateRefreshTokenAsync(long userId, CancellationToken cancellationToken, int daysValid = 30);

        /// <summary>
        /// Revoke a refresh token
        /// </summary>
        Task RevokeTokenAsync(Tbl_RefreshTokens token, CancellationToken cancellationToken);
    }
}
