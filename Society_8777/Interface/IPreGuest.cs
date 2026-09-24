using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IPreGuest : IGuest
    {
        Task<IActionResult> PreGuestAdd(Tbl_Guest guest, CancellationToken cancellationToken);
    }
}
