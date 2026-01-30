using Microsoft.AspNetCore.Mvc;
using Society_8777.Models;

namespace Society_8777.Interface
{
    public interface IPaymentTransaction
    {
        Task<IActionResult> AddPaymentTransaction(Tbl_PaymentTransaction objPaymentTransaction);
        Task<IActionResult> UpdatePayment(Tbl_PaymentTransaction tbl_PaymentTransaction);
        Task<IActionResult> GetAllPaymentTransaction(long FlatID, string Flag);
    }
}
