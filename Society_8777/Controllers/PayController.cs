using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class PayController : ControllerBase
    {
        private readonly IPaymentTransaction _paymentTransaction;
        public PayController(IPaymentTransaction paymentTransaction)
        {
            _paymentTransaction = paymentTransaction;
        }
        [Route("AddPaymentTransaction")]
        [HttpPost]
        public async Task<IActionResult> AddPaymentTransaction([FromBody] Tbl_PaymentTransaction objPaymentTransaction, CancellationToken cancellationToken)
        {
            try
            {
                var result = await _paymentTransaction.AddPaymentTransaction(objPaymentTransaction, cancellationToken);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [Route("UpdatePayment")]
        [HttpPost]
        public async Task<IActionResult> UpdatePayment([FromBody] Tbl_PaymentTransaction objPaymentTransaction, CancellationToken cancellationToken)
        {
            try
            {
                var result = await _paymentTransaction.UpdatePayment(objPaymentTransaction, cancellationToken);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [Route("GetAllPaymentTransaction")]
        [HttpGet]
        public async Task<IActionResult> GetAllPaymentTransaction(long FlatID, string Flag, long UID, CancellationToken cancellationToken)
        {
            try
            {
                var result = await _paymentTransaction.GetAllPaymentTransaction(FlatID, Flag, UID, cancellationToken);
                return result ?? NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
    }
}
