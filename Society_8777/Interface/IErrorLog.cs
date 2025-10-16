using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IErrorLog
    {
        Task<IActionResult> LogError(Tbl_ErrorLogs tbl_ErrorLogs);
        Task<IActionResult> GetAllError(Tbl_ErrorLogs objCust);
    }
}
