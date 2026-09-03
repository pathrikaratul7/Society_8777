using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IPaymentTransaction
    {
        Task<IActionResult> AddPaymentTransaction(Tbl_PaymentTransaction objPaymentTransaction, CancellationToken cancellationToken);
        Task<IActionResult> UpdatePayment(Tbl_PaymentTransaction tbl_PaymentTransaction, CancellationToken cancellationToken);
        Task<IActionResult> GetAllPaymentTransaction(long FlatID, string Flag, long UID, CancellationToken cancellationToken);
    }
}
