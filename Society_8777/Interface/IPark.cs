using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IPark
    {
        Task<IActionResult> AddParking(Tbl_Parking tbl_Parking, CancellationToken cancellationToken);
        Task<IActionResult> UpdateParking(Tbl_Parking tbl_Parking, CancellationToken cancellationToken);
        Task<IActionResult> DeleteParking(Tbl_Parking tbl_Parking, CancellationToken cancellationToken);
        Task<IActionResult> GetAllParkingList(Tbl_Parking tbl_Parking, CancellationToken cancellationToken);
        Task<IActionResult> GetParkingDetailsById(Tbl_Parking tbl_Parking, CancellationToken cancellationToken);
        Task<IActionResult> GetParking(Tbl_Parking tbl_Parking, CancellationToken cancellationToken);
    }
}
