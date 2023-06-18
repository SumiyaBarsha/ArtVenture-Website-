using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtVenture
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
           
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

                    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM register WHERE [email] = @email", con);
                    cmd.Parameters.AddWithValue("@email", email);

                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    if (count > 0)
                    {
                        // User exists, update the password
                        cmd = new SqlCommand("UPDATE register SET [password] = @password WHERE [email] = @email", con);
                        cmd.Parameters.AddWithValue("@password", password);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.ExecuteNonQuery();

                        Response.Write("<script>alert('Password has been successfully reset.');</script>");
                    }
                    else
                    {
                        // User does not exist with the provided email address
                        Response.Write("<script>alert('No user found with the provided email address.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}