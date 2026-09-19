using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IGuest
    {
        Task<IActionResult> GetNotification(Tbl_Guest tbl_Guest, CancellationToken cancellationToken);
        Task<IActionResult> AddGuest(Tbl_Guest tbl_Guest, CancellationToken cancellationToken);
        Task<IActionResult> UpdateGuest(Tbl_Guest tbl_Guest, CancellationToken cancellationToken);
        Task<IActionResult> DeleteGuest(Tbl_Guest tbl_Guest, CancellationToken cancellationToken);
        Task<IActionResult> GetAllGuestList(Tbl_Guest tbl_Guest, CancellationToken cancellationToken);
        byte[] ConvertImageToByteArray(string imagePath, CancellationToken cancellationToken);

        Task<IActionResult> PartialApproveReject(long GID, string Status,string UpdatedBy,
            CancellationToken cancellationToken);
    }
}
