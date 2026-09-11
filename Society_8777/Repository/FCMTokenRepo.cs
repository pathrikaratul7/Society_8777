using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Repository
{
    public class FCMTokenRepo : IFCMToken
    {
        private readonly DataBaseContext.DataBaseContext _context;

        public FCMTokenRepo(DataBaseContext.DataBaseContext dataBaseContext)
        {
            _context = dataBaseContext;
        }

        /// <summary>
        /// Saves or updates an FCM token for a flat.
        /// </summary>
        public async Task<IActionResult> SaveToken([FromBody] Tbl_FCMToken request, CancellationToken cancellationToken)
        {
            try
            {
                if (request == null || string.IsNullOrWhiteSpace(request.FcmToken))
                    return new BadRequestObjectResult(new { Message = "FCM token is required." });

                if (request.FlatID <= 0)
                    return new BadRequestObjectResult(new { Message = "Valid FlatID is required." });

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@FCID", request.FCID),
                    new SqlParameter("@FcmToken", request.FcmToken),
                    new SqlParameter("@FlatID", request.FlatID),
                    new SqlParameter("@UpdatedOn", request.UpdatedOn)
                };

                var tbl_fcm = _context.tbl_FCMToken!
                    .FromSqlRaw("EXEC dbo.USP_Tbl_FCMToken @FCID=@FCID,@FcmToken=@FcmToken,@FlatID=@FlatID,@UpdatedOn=@UpdatedOn", parameters)
                    .AsNoTracking()
                    .FirstOrDefault();

                if (tbl_fcm == null)
                {
                    return new ObjectResult(new { Message = "Failed to save token." }) { StatusCode = 500 };
                }

                await _context.SaveChangesAsync(cancellationToken);
                return new OkObjectResult(new { Message = "Token saved successfully", Data = tbl_fcm });
            }
            catch (Exception ex)
            {
                return new ObjectResult(new { Message = "Error saving token.", Details = ex.Message }) { StatusCode = 500 };
            }
        }

        /// <summary>
        /// Gets all FCM tokens for a specific flat by FlatID, ordered by descending FCID.
        /// </summary>
        public async Task<IActionResult> GetTokensByFlatIdAsync(int flatId, CancellationToken cancellationToken)
        {
            try
            {
                if (flatId <= 0)
                    return new BadRequestObjectResult(new { Message = "Valid FlatID is required." });

                var tokens = await _context.tbl_FCMToken!
                    .Where(t => t.FlatID == flatId)
                    .OrderByDescending(t => t.FCID)
                    .AsNoTracking()
                    .ToListAsync(cancellationToken);

                if (tokens == null || tokens.Count == 0)
                {
                    return new NotFoundObjectResult(new { Message = $"No FCM tokens found for FlatID: {flatId}" });
                }

                return new OkObjectResult(new
                {
                    Message = "FCM tokens retrieved successfully",
                    FlatID = flatId,
                    TokenCount = tokens.Count,
                    Data = tokens
                });
            }
            catch (Exception ex)
            {
                return new ObjectResult(new { Message = "Error retrieving tokens.", Details = ex.Message }) { StatusCode = 500 };
            }
        }

        /// <summary>
        /// Gets the latest FCM token for a specific flat by FlatID (only the most recent one ordered by descending FCID).
        /// </summary>
        public async Task<IActionResult> GetLatestTokenByFlatIdAsync(int flatId, CancellationToken cancellationToken)
        {
            try
            {
                if (flatId <= 0)
                    return new BadRequestObjectResult(new { Message = "Valid FlatID is required." });

                var latestToken = await _context.tbl_FCMToken!
                    .Where(t => t.FlatID == flatId)
                    .OrderByDescending(t => t.FCID)
                    .FirstOrDefaultAsync(cancellationToken);

                if (latestToken == null)
                {
                    return new NotFoundObjectResult(new { Message = $"No FCM token found for FlatID: {flatId}" });
                }

                return new OkObjectResult(new
                {
                    Message = "Latest FCM token retrieved successfully",
                    FlatID = flatId,
                    Data = latestToken
                });
            }
            catch (Exception ex)
            {
                return new ObjectResult(new { Message = "Error retrieving token.", Details = ex.Message }) { StatusCode = 500 };
            }
        }

        /// <summary>
        /// Gets all FCM tokens across all flats, ordered by descending FCID.
        /// </summary>
        public async Task<IActionResult> GetAllTokensAsync(CancellationToken cancellationToken)
        {
            try
            {
                var tokens = await _context.tbl_FCMToken!
                    .OrderByDescending(t => t.FCID)
                    .AsNoTracking()
                    .ToListAsync(cancellationToken);

                if (tokens == null || tokens.Count == 0)
                {
                    return new NotFoundObjectResult(new { Message = "No FCM tokens found." });
                }

                return new OkObjectResult(new
                {
                    Message = "All FCM tokens retrieved successfully",
                    TokenCount = tokens.Count,
                    Data = tokens
                });
            }
            catch (Exception ex)
            {
                return new ObjectResult(new { Message = "Error retrieving tokens.", Details = ex.Message }) { StatusCode = 500 };
            }
        }
    }
}
