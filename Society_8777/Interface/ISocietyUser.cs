using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface ISocietyUser
    {
        Task<IActionResult> GetLogin(Tbl_User objCust);
    }
}
