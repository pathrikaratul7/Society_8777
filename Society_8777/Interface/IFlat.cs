using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IFlat
    {
        Task<IActionResult> AddFlat(Tbl_Flat objFlat, CancellationToken cancellationToken);
        Task<IActionResult> GetAllFlat(Tbl_Flat objFlat, CancellationToken cancellationToken);
        Task<IActionResult> UpdateFlat(Tbl_Flat objFlat, CancellationToken cancellationToken);
        Task<IActionResult> DeleteFlat(Tbl_Flat objFlat, CancellationToken cancellationToken);
        
        
    }
}
