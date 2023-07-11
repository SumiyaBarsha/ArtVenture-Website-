using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace ArtVenture
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            }
        }
        protected void ResetPasswordBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string email = EmailTxt.Text.Trim();
                string password = PasswordTxt.Text.Trim();
                string retypePassword = RetypePasswordTxt.Text.Trim();

                if (password != retypePassword)
                {
                    Response.Write("<script>alert('Password and retype password do not match.');</script>");
                    return;
                }

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM signup WHERE [email] = @email", con);
                    cmd.Parameters.AddWithValue("@email", email);

                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    if (count > 0)
                    {
                        cmd = new SqlCommand("UPDATE signup SET [password] = @password WHERE [email] = @email", con);
                        string hashedPassword = HashPassword(PasswordTxt.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", hashedPassword);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.ExecuteNonQuery();

                        Response.Write("<script>alert('Password has been successfully reset.');</script>");
                        Response.Redirect("~/Login.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('No user found with the provided email address.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        private string HashPassword(string password)
        {
            // Generate a salt
            byte[] salt;
            new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);

            // Create the hash and combine the salt
            var pbkdf2 = new Rfc2898DeriveBytes(password, salt, 10000);
            byte[] hash = pbkdf2.GetBytes(20);
            byte[] hashBytes = new byte[36];
            Array.Copy(salt, 0, hashBytes, 0, 16);
            Array.Copy(hash, 0, hashBytes, 16, 20);

            // Convert the combined salt and hash to a string
            string savedPasswordHash = Convert.ToBase64String(hashBytes);

            return savedPasswordHash;
        }
    }
}