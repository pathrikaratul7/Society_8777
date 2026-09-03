using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IInc
    {
        Task<IActionResult> GetNotification(Tbl_Incident tbl_INC, CancellationToken cancellationToken);
        Task<IActionResult> AddIncident(Tbl_Incident tbl_INC, CancellationToken cancellationToken);
        Task<IActionResult> UpdateIncident(Tbl_Incident tbl_INC, CancellationToken cancellationToken);
        Task<IActionResult> DeleteIncident(Tbl_Incident tbl_INC, CancellationToken cancellationToken);
        Task<IActionResult> GetAllIncidentList(Tbl_Incident tbl_INC, CancellationToken cancellationToken);
        byte[] ConvertImageToByteArray(string imagePath, CancellationToken cancellationToken);
    }
}
