using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IGuest
    {
        Task<IActionResult> GetNotification(Tbl_Guest tbl_Guest);
        Task<IActionResult> AddGuest(Tbl_Guest tbl_Guest);
        Task<IActionResult> UpdateGuest(Tbl_Guest tbl_Guest);
        Task<IActionResult> DeleteGuest(Tbl_Guest tbl_Guest);
        Task<IActionResult> GetAllGuestList(Tbl_Guest tbl_Guest);
        byte[] ConvertImageToByteArray(string imagePath);
    }
}
