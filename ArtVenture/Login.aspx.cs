using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace ArtVenture
{
    public partial class Login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void Signin_btn_Click(object sender, EventArgs e)
        {
            try
            {
                string username = Usernametxt.Text.Trim();
                string password = Passwordtxt.Text.Trim();

                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM signup WHERE [username] = @username", con);
                cmd.Parameters.AddWithValue("@username", username);

                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count > 0)
                {
                 
                    cmd = new SqlCommand("SELECT [password],[userId], [category] FROM signup WHERE [username] = @username", con);
                    cmd.Parameters.AddWithValue("@username", username);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        string storedPasswordHash = reader["password"].ToString();
                        string category = reader["category"].ToString();
                        string userId = reader["userId"].ToString();

                       
                        if (VerifyPassword(password, storedPasswordHash))
                        {
                            
                            Session["username"] = username;
                            Session["userId"] = userId;
                            Session["LoggedIn"] = true;

                            if (category == "Buyer")
                            {
                                Response.Redirect("~/Home.aspx?hideSignup=true");
                            }
                            else if (category == "Seller")
                            {
                                Response.Redirect("~/SellerPage.aspx");
                            }
                        }
                        else
                        {
                           
                            Response.Write("<script>alert('Invalid password.');</script>");
                        }
                    }
                    else
                    {
                        
                        Response.Write("<script>alert('Invalid username.');</script>");
                    }
                }


                
                Session["LoggedIn"] = true;

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        private bool VerifyPassword(string enteredPassword, string storedPasswordHash)
        {
            // Convert the stored hash string to bytes
            byte[] hashBytes = Convert.FromBase64String(storedPasswordHash);

            // Extract the salt from the hashBytes
            byte[] salt = new byte[16];
            Array.Copy(hashBytes, 0, salt, 0, 16);

            // Compute the hash of the entered password using the extracted salt
            var pbkdf2 = new Rfc2898DeriveBytes(enteredPassword, salt, 10000);
            byte[] enteredHash = pbkdf2.GetBytes(20);

            // Compare the entered hash with the stored hash
            for (int i = 0; i < 20; i++)
            {
                if (hashBytes[i + 16] != enteredHash[i])
                {
                    return false; // Passwords don't match
                }
            }

            return true; // Passwords match
        }


    }
}