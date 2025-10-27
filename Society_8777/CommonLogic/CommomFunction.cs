using Microsoft.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Security.Cryptography;
using System.Text;

namespace Society_8777.CommonLogic
{
    public static class CommomFunction
    {
        // private static string _sortDirection;

        public static double GenerateRandomAccountNo()
        {
            Random r = new Random();
            return r.Next(17, 507777777);

        }
        public static bool ISNUMBER(string str)
        {
            bool isnumber; int nout = 0;

            isnumber = int.TryParse(str, out nout);
            return isnumber;
        }
        public static string OPMsg(string str)
        {
            return str;
        }
        public static DataTable GetData(DataTable dt)
        {

            return dt;
        }
        //public void ClearAndAbandonAllSession()
        //{
        //    Session.Clear();
        //    Session.Abandon();
        //}
        public static class Encrypt_Dycrypt_Bank
        {
            public const string EncDyckeyMain = "pemgail9uzpgzl88";
            public const string EncryDycryKey = "ASTAUIL8777";
            private const string initVector = EncDyckeyMain;
            // This constant is used to determine the keysize of the encryption algorithm
            private const int keysize = 256;
            static string passPhrase = ""; static byte[] cipherTextBytes = null; static byte[] initVectorBytes = null;
            static byte[] plainTextBytes = null; static byte[] keyBytes = null;
            static int decryptedByteCount;
            static MemoryStream memoryStream = null; static CryptoStream cryptoStream = null;
            static ICryptoTransform encryptor = null, decryptor = null; static RijndaelManaged symmetricKey = null;
            static PasswordDeriveBytes password = null;
            public static string EncryptString(string plainText)
            {
                try
                {
                    passPhrase = EncryDycryKey;
                    initVectorBytes = Encoding.UTF8.GetBytes(initVector);
                    plainTextBytes = Encoding.UTF8.GetBytes(plainText);
                    password = new PasswordDeriveBytes(passPhrase, null);
                    keyBytes = password.GetBytes(keysize / 8);
                    symmetricKey = new RijndaelManaged();
                    symmetricKey.Mode = CipherMode.CBC;
                    encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes);
                    memoryStream = new MemoryStream();
                    cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write);
                    cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
                    cryptoStream.FlushFinalBlock();
                    cipherTextBytes = memoryStream.ToArray();
                    memoryStream.Close();
                    cryptoStream.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    passPhrase = null;
                    initVectorBytes = null;
                    plainTextBytes = null;
                    password = null;
                    keyBytes = null;
                    symmetricKey = null;
                    encryptor = null;
                    memoryStream = null;
                    cryptoStream = null;

                }
                return Convert.ToBase64String(cipherTextBytes);
            }
            public static string DecryptString(string cipherText)
            {
                if (string.IsNullOrWhiteSpace(cipherText))
                    return string.Empty;

                string passPhrase = EncryDycryKey;
             //   string initVector = initVector; // must match the one used in encryption
                const int keysize = 256;

                byte[] initVectorBytes = Encoding.UTF8.GetBytes(initVector);
                byte[] cipherTextBytes = Convert.FromBase64String(cipherText);

                using (var password = new PasswordDeriveBytes(passPhrase, null))
                {
                    byte[] keyBytes = password.GetBytes(keysize / 8);

                    using (var symmetricKey = new RijndaelManaged())
                    {
                        symmetricKey.Mode = CipherMode.CBC;
                        symmetricKey.Padding = PaddingMode.PKCS7; // important!

                        using (var decryptor = symmetricKey.CreateDecryptor(keyBytes, initVectorBytes))
                        using (var memoryStream = new MemoryStream(cipherTextBytes))
                        using (var cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read))
                        using (var reader = new StreamReader(cryptoStream, Encoding.UTF8))
                        {
                            return reader.ReadToEnd(); // ✅ reads the full decrypted string
                        }
                    }
                }
            }


            //public static string DecryptString(string cipherText)
            //{
            //    try
            //    {
            //        passPhrase = EncryDycryKey;
            //        initVectorBytes = Encoding.UTF8.GetBytes(initVector);
            //        cipherTextBytes = Convert.FromBase64String(cipherText);
            //        password = new PasswordDeriveBytes(passPhrase, null);
            //        keyBytes = password.GetBytes(keysize / 8);
            //        symmetricKey = new RijndaelManaged();
            //        symmetricKey.Mode = CipherMode.CBC;
            //        decryptor = symmetricKey.CreateDecryptor(keyBytes, initVectorBytes);
            //        memoryStream = new MemoryStream(cipherTextBytes);
            //        cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read);
            //        plainTextBytes = new byte[cipherTextBytes.Length];
            //        decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);
            //        memoryStream.Close();
            //        cryptoStream.Close();
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
            //    finally
            //    {
            //        passPhrase = null;
            //        initVectorBytes = null;
            //        cipherTextBytes = null;
            //        password = null; keyBytes = null; symmetricKey = null; decryptor = null; memoryStream = null; cryptoStream = null;


            //    }
            //    return Encoding.UTF8.GetString(plainTextBytes,0, decryptedByteCount);
            //}

        }




        public static bool UIsNumberDigit(string str)
        {
            bool isNumeric;
            int n;
            return isNumeric = int.TryParse(str, out n);
        }

        public static bool UIDigitWithDecimal(string str)
        {
            bool isnum; int num;

            return isnum = int.TryParse(str, out num);
        }

        public static string UDReplaceComma(string str)
        {

            str = str.Replace(",", "");
            return str;
        }
        public static bool CheckValidDate(string str)
        {

            DateTime d;

            bool chValidity = DateTime.TryParseExact(
               str,
               "dd-mm-yyyy",
               CultureInfo.InvariantCulture,
               DateTimeStyles.None,
               out d);
            return chValidity;
        }


        public static string FormatAmount(string str)
        {
            str = String.Format("{0:N}", Convert.ToDouble(str));
            return str;
        }

        [System.Runtime.InteropServices.DllImport("wininet.dll")]
        private extern static bool InternetGetConnectedState(out int Description, int ReservedValue);
        public static bool CheckNet()
        {
            int desc;
            return InternetGetConnectedState(out desc, 0);

        }

    }
}
