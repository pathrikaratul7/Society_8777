using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IFCMToken
    {
        Task<IActionResult> SaveToken(Tbl_FCMToken request);
    }
}
