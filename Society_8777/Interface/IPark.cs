using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IPark
    {
        Task<IActionResult> AddParking(Tbl_Parking tbl_Parking);
        Task<IActionResult> UpdateParking(Tbl_Parking tbl_Parking);
        Task<IActionResult> DeleteParking(Tbl_Parking tbl_Parking);
        Task<IActionResult> GetAllParkingList(Tbl_Parking tbl_Parking);
        Task<IActionResult> GetParkingDetailsById(Tbl_Parking tbl_Parking);
    }
}
