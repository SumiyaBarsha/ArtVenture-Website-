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
    public partial class Login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["username"] != null && Request.Cookies["password"] != null)
                {
                    Usernametxt.Text = Request.Cookies["username"].Value;
                    Passwordtxt.Attributes["value"] = Request.Cookies["password"].Value;
                    RememberMeCheckBox.Checked = true;
                }
            }
        }
        protected void Signin_btn_Click(object sender, EventArgs e)
        {
            try
            {
                string username = Usernametxt.Text.Trim();
                string password = Passwordtxt.Text.Trim();

                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM register WHERE [username] = @username", con);
                cmd.Parameters.AddWithValue("@username", username);

                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count > 0)
                {
                    // User exists, check password
                    cmd = new SqlCommand("SELECT [password] FROM register WHERE [username] = @username", con);
                    cmd.Parameters.AddWithValue("@username", username);

                    string storedPassword = cmd.ExecuteScalar().ToString();

                    if (password == storedPassword)
                    {
                        // Password matches, login successful
                        Session["username"] = username;
                        Response.Redirect("~/Home.aspx");
                    }
                    else
                    {
                        // Password does not match
                        Response.Write("<script>alert('Invalid password.');</script>");
                    }
                }
                else
                {
                    // User does not exist
                    Response.Write("<script>alert('Invalid username.');</script>");
                }


                if (RememberMeCheckBox.Checked)
                {
                    // Set cookies to remember the username and password
                    Response.Cookies["username"].Value = Usernametxt.Text.Trim();
                    Response.Cookies["password"].Value = Passwordtxt.Text.Trim();
                    Response.Cookies["username"].Expires = DateTime.Now.AddDays(7); // Cookie expiration time
                    Response.Cookies["password"].Expires = DateTime.Now.AddDays(7);
                }
                else
                {
                    // Clear cookies
                    Response.Cookies["username"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["password"].Expires = DateTime.Now.AddDays(-1);
                }

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

    }
}