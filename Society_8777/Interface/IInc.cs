using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IInc
    {
        Task<IActionResult> GetNotification(Tbl_Incident tbl_INC);
        Task<IActionResult> AddIncident(Tbl_Incident tbl_INC);
        Task<IActionResult> UpdateIncident(Tbl_Incident tbl_INC);
        Task<IActionResult> DeleteIncident(Tbl_Incident tbl_INC);
        Task<IActionResult> GetAllIncidentList(Tbl_Incident tbl_INC);
        byte[] ConvertImageToByteArray(string imagePath);
    }
}
