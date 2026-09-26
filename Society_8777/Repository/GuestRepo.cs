using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.Interface;
using Society_8777.Models;
using Society_8777.Services;
using System.Text.Json;

namespace Society_8777.Repository
{
    public class GuestRepo : IGuest, IPreGuest
    {
        readonly private DataBaseContext.DataBaseContext _context;
        private readonly IFireBaseNotification _firebaseNotification;
        private readonly FcmHttpV1Service _fcmHttpV1Service;
        private readonly IFCMToken _fcmTokenRepo;

        public GuestRepo(
            DataBaseContext.DataBaseContext context,
            IFireBaseNotification firebaseNotification,
            FcmHttpV1Service fcmHttpV1Service, IFCMToken fCMToken)
        {
            _context = context;
            _firebaseNotification = firebaseNotification;
            _fcmHttpV1Service = fcmHttpV1Service;
            _fcmTokenRepo = fCMToken;
        }

        public async Task<IActionResult> GetNotification(Tbl_Guest tbl_Guest, CancellationToken cancellationToken)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[2];
                sp[0] = new SqlParameter("@FID", tbl_Guest.FID ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@Flag", tbl_Guest.Flag ?? (object)DBNull.Value);

                var _tbl_Guest = await _context.Tbl_Guest!.FromSqlRaw
                    ("EXEC [dbo].[USP_Tbl_Guest] @FID=@FID,@Flag=@Flag", sp)
                    .AsNoTracking().ToListAsync(cancellationToken);

                return new OkObjectResult(_tbl_Guest);
            }
            catch (Exception)
            {
                return new ObjectResult(new { Message = "An error occurred while retrieving notifications." }) { StatusCode = 500 };
            }
        }

        public async Task<IActionResult> AddGuest(Tbl_Guest tbl_Guest, CancellationToken cancellationToken)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[11];
                sp[0] = new SqlParameter("@GName", tbl_Guest.GName ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@GMobile", tbl_Guest.GMobile ?? (object)DBNull.Value);
                sp[2] = new SqlParameter("@GEmail", tbl_Guest.GEmail ?? (object)DBNull.Value);
                sp[3] = new SqlParameter("@InDateTime", tbl_Guest.InDateTime ?? (object)DBNull.Value);
                sp[4] = new SqlParameter("@FID", tbl_Guest.FID ?? (object)DBNull.Value);
                sp[5] = new SqlParameter("@CreatedBy", tbl_Guest.CreatedBy ?? (object)DBNull.Value);
                sp[6] = new SqlParameter("@LoginID", tbl_Guest.LoginID ?? (object)DBNull.Value);
                sp[7] = new SqlParameter("@GImagePath", tbl_Guest.GImagePath ?? (object)DBNull.Value);
                sp[8] = new SqlParameter("@Status", tbl_Guest.Status ?? (object)DBNull.Value);
                sp[9] = new SqlParameter("@CreatorMobile", tbl_Guest.CreatorMobile ?? (object)DBNull.Value);
                sp[10] = new SqlParameter("@Flag", tbl_Guest.Flag ?? (object)DBNull.Value);

                var _tbl_Guest = (await _context.Tbl_Guest!
                    .FromSqlRaw("EXEC [dbo].[USP_Tbl_Guest] @GName=@GName,@GMobile=@GMobile,@GEmail=@GEmail," +
                    "@InDateTime=@InDateTime,@FID=@FID,@CreatedBy=@CreatedBy,@LoginID=@LoginID," +
                    "@GImagePath=@GImagePath,@Status=@Status,@CreatorMobile=@CreatorMobile,@Flag=@Flag"
                    , sp)
                    .AsNoTracking()
                    .ToListAsync(cancellationToken))
                    .FirstOrDefault();

                // Send Firebase notification to flat owner if guest was added successfully
                if (_tbl_Guest != null && tbl_Guest.FID.HasValue && !string.IsNullOrEmpty(tbl_Guest.GName))
                {
                    try
                    {
                        await _firebaseNotification.SendGuestArrivalNotificationByFlatAsync(
                            tbl_Guest.FID.Value,
                            tbl_Guest.GName,
                            cancellationToken);
                    }
                    catch (Exception)
                    {
                        // Log error or handle notification failure gracefully
                    }
                }

                return new OkObjectResult(_tbl_Guest);
            }
            catch (Exception ex)
            {
                return new ObjectResult(new { Message = "An error occurred while retrieving notifications." }) { StatusCode = 500 };
            }
        }

        public async Task<IActionResult> UpdateGuest(Tbl_Guest tbl_Guest, CancellationToken cancellationToken)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[11];
                sp[0] = new SqlParameter("@GID", tbl_Guest.GID ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@GName", tbl_Guest.GName ?? (object)DBNull.Value);
                sp[2] = new SqlParameter("@GMobile", tbl_Guest.GMobile ?? (object)DBNull.Value);
                sp[3] = new SqlParameter("@GEmail", tbl_Guest.GEmail ?? (object)DBNull.Value);
                sp[4] = new SqlParameter("@OutDateTime", tbl_Guest.OutDateTime ?? (object)DBNull.Value);
                sp[5] = new SqlParameter("@FID", tbl_Guest.FID ?? (object)DBNull.Value);
                sp[6] = new SqlParameter("@UpdatedBy", tbl_Guest.UpdatedBy ?? (object)DBNull.Value);
                sp[7] = new SqlParameter("@LoginID", tbl_Guest.LoginID ?? (object)DBNull.Value);
                sp[8] = new SqlParameter("@Status", tbl_Guest.Status ?? (object)DBNull.Value);
                sp[9] = new SqlParameter("@GImagePath", tbl_Guest.GImagePath ?? (object)DBNull.Value);
                sp[10] = new SqlParameter("@Flag", tbl_Guest.Flag ?? (object)DBNull.Value);

                var _tbl_Guest = (await _context.Tbl_Guest!
                    .FromSqlRaw("EXEC [dbo].[USP_Tbl_Guest] @GID=@GID,@GName=@GName,@GMobile=@GMobile," +
                    "@GEmail=@GEmail,@OutDateTime=@OutDateTime,@FID=@FID,@UpdatedBy=@UpdatedBy,@LoginID=@LoginID," +
                    "@GImagePath=@GImagePath,@Status=@Status,@Flag=@Flag", sp)
                    .AsNoTracking()
                    .ToListAsync(cancellationToken))
                    .FirstOrDefault();

                return new OkObjectResult(_tbl_Guest);
            }
            catch (Exception)
            {
                return new ObjectResult(new { Message = "An error occurred while updating the guest." }) { StatusCode = 500 };
            }
        }

        public async Task<IActionResult> DeleteGuest(Tbl_Guest tbl_Guest, CancellationToken cancellationToken)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[4];
                sp[0] = new SqlParameter("@GID", tbl_Guest.GID ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@IsDeleted", tbl_Guest.IsDeleted ?? (object)DBNull.Value);
                sp[2] = new SqlParameter("@UpdatedBy", tbl_Guest.UpdatedBy ?? (object)DBNull.Value);
                sp[3] = new SqlParameter("@Flag", tbl_Guest.Flag ?? (object)DBNull.Value);

                var _tbl_Guest = await _context.Tbl_Guest!.FromSqlRaw(
                    "EXEC [dbo].[USP_Tbl_Guest] @GID=@GID,@IsDeleted=@IsDeleted,@UpdatedBy=@UpdatedBy,@Flag=@Flag",
                    sp).ToListAsync(cancellationToken);

                return new OkObjectResult(_tbl_Guest);
            }
            catch (Exception)
            {
                return new ObjectResult(new { Message = "An error occurred while deleting the guest." }) { StatusCode = 500 };
            }
        }

        public async Task<IActionResult> GetAllGuestList(Tbl_Guest tbl_Guest, CancellationToken cancellationToken)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[2];
                sp[0] = new SqlParameter("@LoginID", tbl_Guest.LoginID ?? (object)DBNull.Value);
                sp[1] = new SqlParameter("@Flag", tbl_Guest.Flag ?? (object)DBNull.Value);

                var _tbl_Guest = await _context.Tbl_Guest!.FromSqlRaw(
                    "EXEC [dbo].[USP_Tbl_Guest] @LoginID=@LoginID,@Flag=@Flag",
                    sp).ToListAsync(cancellationToken);

                return new OkObjectResult(_tbl_Guest);
            }
            catch (Exception)
            {
                return new ObjectResult(new { Message = "Error While getting all guest", StatusCode = 500 });
            }
        }

        public byte[] ConvertImageToByteArray(string imagePath, CancellationToken cancellationToken)
        {
            return File.ReadAllBytes(imagePath);
        }

        public async Task<IActionResult> PartialApproveReject(long GID, string Status, string UpdatedBy,
           CancellationToken cancellationToken)
        {
            try
            {
                var para = new SqlParameter[]
                    {
                       new SqlParameter("@GID", GID),
                new SqlParameter("@UpdatedBy", UpdatedBy ?? (object)DBNull.Value),
                new SqlParameter("@Status", Status ?? (object)DBNull.Value),
                new SqlParameter("@Flag", "PATCH" ?? (object)DBNull.Value)
                       };
                var _tbl_Guest = (await _context.Tbl_Guest!
                    .FromSqlRaw("EXEC [dbo].[USP_Tbl_Guest] @GID=@GID, " +
                    "@UpdatedBy=@UpdatedBy," +
                    "@Status=@Status,@Flag=@Flag", para)
                    .AsNoTracking()
                    .ToListAsync(cancellationToken))
                    .FirstOrDefault();

                return new OkObjectResult(_tbl_Guest);
            }
            catch (Exception)
            {
                return new ObjectResult(new { Message = "An error occurred while updating the guest." }) { StatusCode = 500 };
            }
        }

        //public async Task<IActionResult> PreGuestAdd(Tbl_Guest tbl_Guest, CancellationToken cancellationToken)
        //{
        //    try
        //    {
        //        SqlParameter[] sp = new SqlParameter[11];
        //        sp[0] = new SqlParameter("@GName", tbl_Guest.GName ?? (object)DBNull.Value);
        //        sp[1] = new SqlParameter("@GMobile", tbl_Guest.GMobile ?? (object)DBNull.Value);
        //        sp[2] = new SqlParameter("@GEmail", tbl_Guest.GEmail ?? (object)DBNull.Value);
        //        sp[3] = new SqlParameter("@InDateTime", tbl_Guest.InDateTime ?? (object)DBNull.Value);
        //        sp[4] = new SqlParameter("@FID", tbl_Guest.FID ?? (object)DBNull.Value);
        //        sp[5] = new SqlParameter("@CreatedBy", tbl_Guest.CreatedBy ?? (object)DBNull.Value);
        //        sp[6] = new SqlParameter("@LoginID", tbl_Guest.LoginID ?? (object)DBNull.Value);
        //        sp[7] = new SqlParameter("@GImagePath", tbl_Guest.GImagePath ?? (object)DBNull.Value);
        //        sp[8] = new SqlParameter("@Status", tbl_Guest.Status ?? (object)DBNull.Value);
        //        sp[9] = new SqlParameter("@CreatorMobile", tbl_Guest.CreatorMobile ?? (object)DBNull.Value);
        //        sp[10] = new SqlParameter("@Flag", tbl_Guest.Flag ?? (object)DBNull.Value);

        //        var _tbl_Guest = (await _context.Tbl_Guest!
        //            .FromSqlRaw("EXEC [dbo].[USP_Tbl_Guest] @GName=@GName,@GMobile=@GMobile,@GEmail=@GEmail," +
        //            "@InDateTime=@InDateTime,@FID=@FID,@CreatedBy=@CreatedBy,@LoginID=@LoginID," +
        //            "@GImagePath=@GImagePath,@Status=@Status,@CreatorMobile=@CreatorMobile,@Flag=@Flag"
        //            , sp)
        //            .AsNoTracking()
        //            .ToListAsync(cancellationToken))
        //            .FirstOrDefault();

        //        // Send Firebase notification to flat owner if guest was added successfully
        //        if (_tbl_Guest != null && tbl_Guest.FID.HasValue && !string.IsNullOrEmpty(tbl_Guest.GName))
        //        {
        //            try
        //            {
        //                await _firebaseNotification.SendGuestArrivalNotificationByFlatAsync(
        //                    tbl_Guest.FID.Value,
        //                    tbl_Guest.GName,
        //                    cancellationToken);
        //            }
        //            catch (Exception)
        //            {
        //                // Log error or handle notification failure gracefully
        //            }
        //        }

        //        return new OkObjectResult(_tbl_Guest);
        //    }
        //    catch (Exception ex)
        //    {
        //        return new ObjectResult(new { Message = "An error occurred while retrieving notifications." }) { StatusCode = 500 };
        //    }
        //}

        

public async Task<IActionResult> PreGuestAdd(
    Tbl_Guest tbl_Guest,
    CancellationToken cancellationToken)
        {
            try
            {
                // =========================================================
                // 1. Save Pre-Guest
                // =========================================================

                SqlParameter[] sp = new SqlParameter[11];

                sp[0] = new SqlParameter(
                    "@GName",
                    tbl_Guest.GName ?? (object)DBNull.Value);

                sp[1] = new SqlParameter(
                    "@GMobile",
                    tbl_Guest.GMobile ?? (object)DBNull.Value);

                sp[2] = new SqlParameter(
                    "@GEmail",
                    tbl_Guest.GEmail ?? (object)DBNull.Value);

                sp[3] = new SqlParameter(
                    "@InDateTime",
                    tbl_Guest.InDateTime ?? (object)DBNull.Value);

                sp[4] = new SqlParameter(
                    "@FID",
                    tbl_Guest.FID ?? (object)DBNull.Value);

                sp[5] = new SqlParameter(
                    "@CreatedBy",
                    tbl_Guest.CreatedBy ?? (object)DBNull.Value);

                sp[6] = new SqlParameter(
                    "@LoginID",
                    tbl_Guest.LoginID ?? (object)DBNull.Value);

                sp[7] = new SqlParameter(
                    "@GImagePath",
                    tbl_Guest.GImagePath ?? (object)DBNull.Value);

                sp[8] = new SqlParameter(
                    "@Status",
                    tbl_Guest.Status ?? (object)DBNull.Value);

                sp[9] = new SqlParameter(
                    "@CreatorMobile",
                    tbl_Guest.CreatorMobile ?? (object)DBNull.Value);

                sp[10] = new SqlParameter(
                    "@Flag",
                    tbl_Guest.Flag ?? (object)DBNull.Value);


                var savedGuest = (await _context.Tbl_Guest!
                    .FromSqlRaw(
                        "EXEC [dbo].[USP_Tbl_Guest] " +
                        "@GName=@GName," +
                        "@GMobile=@GMobile," +
                        "@GEmail=@GEmail," +
                        "@InDateTime=@InDateTime," +
                        "@FID=@FID," +
                        "@CreatedBy=@CreatedBy," +
                        "@LoginID=@LoginID," +
                        "@GImagePath=@GImagePath," +
                        "@Status=@Status," +
                        "@CreatorMobile=@CreatorMobile," +
                        "@Flag=@Flag",
                        sp)
                    .AsNoTracking()
                    .ToListAsync(cancellationToken))
                    .FirstOrDefault();


                // =========================================================
                // 2. Verify Guest was saved
                // =========================================================

                if (savedGuest == null)
                {
                    return new ObjectResult(new
                    {
                        Message = "Guest could not be saved."
                    })
                    {
                        StatusCode = 500
                    };
                }


                // =========================================================
                // 3. Send FCM Notification to Flat Owner
                // =========================================================

                if (savedGuest.FID.HasValue)
                {
                    try
                    {
                        int flatId = Convert.ToInt32(savedGuest.FID.Value);

                        //_logger.LogInformation(
                        //    "PreGuest saved successfully. GuestID: {GuestId}, FlatID: {FlatId}",
                        //    savedGuest.GID,
                        //    flatId);


                        // -----------------------------------------------------
                        // Get latest FCM token of flat owner
                        // -----------------------------------------------------

                        var tokenResult =
                            await _fcmTokenRepo.GetLatestTokenByFlatIdAsync(
                                flatId,
                                cancellationToken);


                        string? fcmToken = null;


                        // -----------------------------------------------------
                        // Repository currently returns IActionResult:
                        //
                        // {
                        //     Message = "...",
                        //     FlatID = 53,
                        //     Data = Tbl_FCMToken
                        // }
                        // -----------------------------------------------------

                        if (tokenResult is OkObjectResult okResult &&
                            okResult.Value != null)
                        {
                            var json =
                                System.Text.Json.JsonSerializer.Serialize(
                                    okResult.Value);

                            var response =
                                System.Text.Json.JsonSerializer.Deserialize<JsonElement>(
                                    json);

                            if (response.TryGetProperty(
                                "Data",
                                out JsonElement dataElement))
                            {
                                var tokenData =
                                    System.Text.Json.JsonSerializer.Deserialize<Tbl_FCMToken>(
                                        dataElement.GetRawText());

                                fcmToken = tokenData?.FcmToken;
                            }
                        }


                        // -----------------------------------------------------
                        // No token found
                        // -----------------------------------------------------

                        if (string.IsNullOrWhiteSpace(fcmToken))
                        {
                            //_logger.LogWarning(
                            //    "Guest saved but FCM token was not found. " +
                            //    "GuestID: {GuestId}, FlatID: {FlatId}",
                            //    savedGuest.GID,
                            //    flatId);

                            return new OkObjectResult(savedGuest);
                        }


                        // =====================================================
                        // 4. Prepare FCM Data
                        // =====================================================

                        // IMPORTANT:
                        // These keys MUST match your MAUI Firebase receiver.
                        //
                        // Your working FcmController uses:
                        //
                        // type
                        // guestId
                        // guestName
                        // guestMobile
                        // FlatNumber
                        // flatId
                        // guestImageUrl
                        // =====================================================

                        var notificationData =
                            new Dictionary<string, string>
                            {
                                ["type"] = "GUEST_APPROVAL",

                                // IMPORTANT:
                                // Use savedGuest.GID instead of tbl_Guest.GID
                                // because database generated the Guest ID.
                                ["guestId"] =
                                    savedGuest.GID?.ToString() ?? "",

                                ["guestName"] =
                                    savedGuest.GName ?? tbl_Guest.GName ?? "",

                                // IMPORTANT:
                                // Guest mobile, NOT FlatOwnerMobile
                                ["guestMobile"] =
                                    savedGuest.GMobile ?? tbl_Guest.GMobile ?? "",

                                // Keep same casing as your working
                                // FcmController.
                                ["FlatNumber"] =
                                    savedGuest.FlatNumber?.ToString()
                                    ?? tbl_Guest.FlatNumber?.ToString()
                                    ?? "",

                                ["flatId"] =
                                    flatId.ToString(),

                                ["time"] =
                                    $"🕐 {DateTime.Now:hh:mm tt}"
                            };


                        // -----------------------------------------------------
                        // Guest Image
                        // -----------------------------------------------------

                        if (!string.IsNullOrWhiteSpace(
                            savedGuest.GImagePath ??
                            tbl_Guest.GImagePath))
                        {
                            notificationData["guestImageUrl"] =
                                savedGuest.GImagePath ??
                                tbl_Guest.GImagePath ??
                                "";
                        }


                        // =====================================================
                        // 5. Send FCM
                        // =====================================================

                        //_logger.LogInformation(
                        //    "Sending GUEST_APPROVAL FCM notification. " +
                        //    "GuestID: {GuestId}, FlatID: {FlatId}, GuestName: {GuestName}",
                        //    savedGuest.GID,
                        //    flatId,
                        //    savedGuest.GName);


                        var notificationSent =
                            await _fcmHttpV1Service.SendNotificationToDeviceAsync(
                                fcmToken,

                                "🔔 Guest Arrived",

                                $"👤 {savedGuest.GName} has arrived at your flat 🏠.\n" +
                                $"📱 Mobile: {savedGuest.GMobile}",

                                notificationData,

                                savedGuest.GImagePath,

                                // IMPORTANT:
                                // Data-only allows MAUI FirebaseMessagingService
                                // to receive GUEST_APPROVAL and perform custom
                                // GuestApprovalPopup routing.
                                dataOnlyAndroid: true,

                                cancellationToken: cancellationToken);


                        // =====================================================
                        // 6. FCM Result
                        // =====================================================

                        if (notificationSent)
                        {
                            //_logger.LogInformation(
                            //    "GUEST_APPROVAL FCM notification sent successfully. " +
                            //    "GuestID: {GuestId}, FlatID: {FlatId}",
                            //    savedGuest.GID,
                            //    flatId);
                        }
                        else
                        {
                            //_logger.LogWarning(
                            //    "Guest saved successfully but FCM notification failed. " +
                            //    "GuestID: {GuestId}, FlatID: {FlatId}",
                            //    savedGuest.GID,
                            //    flatId);
                        }
                    }
                    catch (Exception notificationEx)
                    {
                        // =====================================================
                        // IMPORTANT:
                        // Guest is already saved.
                        // FCM failure should NOT make PreGuestAdd return 500.
                        // =====================================================

                        //_logger.LogError(
                        //    notificationEx,
                        //    "Guest saved but FCM notification failed. " +
                        //    "GuestID: {GuestId}, FlatID: {FlatId}",
                        //    savedGuest.GID,
                        //    savedGuest.FID);
                    }
                }
                else
                {
                    //_logger.LogWarning(
                    //    "Guest saved but FID is null. " +
                    //    "FCM notification cannot be sent. GuestID: {GuestId}",
                    //    savedGuest.GID);
                }


                // =========================================================
                // 7. Return Saved Guest
                // =========================================================

                return new OkObjectResult(savedGuest);
            }
            catch (OperationCanceledException)
            {
                return new ObjectResult(new
                {
                    Message = "Request was cancelled."
                })
                {
                    StatusCode = 499
                };
            }
            catch (Exception ex)
            {
                //_logger.LogError(
                //    ex,
                //    "Error occurred while adding pre-guest.");

                return new ObjectResult(new
                {
                    Message = "An error occurred while adding pre-guest.",
                    Details = ex.Message
                })
                {
                    StatusCode = 500
                };
            }
        }


    }
}