using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Repository
{
    public class PaymentRepo : IPaymentTransaction
    {
        private readonly DataBaseContext.DataBaseContext _context = new();
        public PaymentRepo(DataBaseContext.DataBaseContext context) {
        _context = context;

        }

        public async Task<IActionResult> AddPaymentTransaction(Tbl_PaymentTransaction objPaymentTransaction)
        {
            try
            {
                SqlParameter[] p = new SqlParameter[8];
                p[0] = new SqlParameter("@Amount", objPaymentTransaction.Amount ?? (object)DBNull.Value);
                p[1] = new SqlParameter("@Utr", objPaymentTransaction.Utr ?? (object)DBNull.Value);
                p[2] = new SqlParameter("@PaidTo", objPaymentTransaction.PaidTo ?? (object)DBNull.Value);
                p[3] = new SqlParameter("@PaymentDate", objPaymentTransaction.PaymentDate ?? (object)DBNull.Value);
                p[4] = new SqlParameter("@SourceApp", objPaymentTransaction.SourceApp ?? (object)DBNull.Value);
                p[5] = new SqlParameter("@RawText", objPaymentTransaction.RawText ?? (object)DBNull.Value);
                p[6] = new SqlParameter("@FlatId", objPaymentTransaction.FlatId ?? (object)DBNull.Value);
                p[7] = new SqlParameter("@Flag", objPaymentTransaction.Flag ?? (object)DBNull.Value);

                var result = _context.Tbl_PaymentTransactions.FromSqlRaw("EXEC usp_Tbl_PaymentTransactions @Amount=@Amount, @Utr=@Utr," +
                    " @PaidTo=@PaidTo, @PaymentDate=@PaymentDate, @SourceApp=@SourceApp, @RawText=@RawText, @FlatId=@FlatId, @Flag=@Flag", p).AsEnumerable().FirstOrDefault();
                await _context.SaveChangesAsync();
                return new OkObjectResult(result);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public Task<IActionResult> GetAllPaymentTransaction(long FlatID, string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IActionResult> UpdatePayment(Tbl_PaymentTransaction objPaymentTransaction)
        {
            try
            {
                SqlParameter[] p = new SqlParameter[9];
                p[0] = new SqlParameter("@Amount", objPaymentTransaction.Amount ?? (object)DBNull.Value);
                p[1] = new SqlParameter("@Utr", objPaymentTransaction.Utr ?? (object)DBNull.Value);
                p[2] = new SqlParameter("@PaidTo", objPaymentTransaction.PaidTo ?? (object)DBNull.Value);
                p[3] = new SqlParameter("@PaymentDate", objPaymentTransaction.PaymentDate ?? (object)DBNull.Value);
                p[4] = new SqlParameter("@SourceApp", objPaymentTransaction.SourceApp ?? (object)DBNull.Value);
                p[5] = new SqlParameter("@RawText", objPaymentTransaction.RawText ?? (object)DBNull.Value);
                p[6] = new SqlParameter("@FlatId", objPaymentTransaction.FlatId ?? (object)DBNull.Value);
                p[7] = new SqlParameter("@Flag", objPaymentTransaction.Flag ?? (object)DBNull.Value);
                p[8] = new SqlParameter("@Id", objPaymentTransaction.Id ?? (object)DBNull.Value);

                var result = _context.Tbl_PaymentTransactions.FromSqlRaw("EXEC usp_Tbl_PaymentTransactions @Amount=@Amount, @Utr=@Utr," +
                    " @PaidTo=@PaidTo, @PaymentDate=@PaymentDate, @SourceApp=@SourceApp, @RawText=@RawText, @FlatId=@FlatId, @Flag=@Flag,@Id=@Id", p).AsEnumerable().FirstOrDefault();
                await _context.SaveChangesAsync();
                return new OkObjectResult(result);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
