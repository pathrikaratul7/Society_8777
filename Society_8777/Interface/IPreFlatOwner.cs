using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ActionConstraints;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IPreFlatOwner : IFlat
    {
        Task<IActionResult>  PreGetAllFlat(Tbl_Flat objFlat, CancellationToken cancellationToken);
    }
}
