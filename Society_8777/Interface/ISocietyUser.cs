using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface ISocietyUser
    {
        Task<IActionResult> GetLogin(Tbl_User objCust, CancellationToken cancellationToken);
        Task<IActionResult> AddUser(Tbl_User objCust, CancellationToken cancellationToken);

        Task<IActionResult> UpdateUser(Tbl_User objCust, CancellationToken cancellationToken);
        Task<IActionResult> DeleteUser(Tbl_User objCust, CancellationToken cancellationToken);
        Task<IActionResult> GetAllUsers(Tbl_User objcust, CancellationToken cancellationToken);
        Task<IActionResult> UpdateDeviceID(Tbl_User objCust, CancellationToken cancellationToken);
    }
}
