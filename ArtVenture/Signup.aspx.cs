using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtVenture
{
    public partial class Signup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Register_btn_Click(object sender, EventArgs e)
        {
            if (ValidateInputs())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO register ([username], [email], [password], [category]) VALUES (@username, @email, @password, @category)", con);

                    cmd.Parameters.AddWithValue("@username", Usernametxt.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", Useremailtxt.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", Userpasstxt.Text.Trim());
                    cmd.Parameters.AddWithValue("@category", Usercategory.SelectedValue);

                    cmd.ExecuteNonQuery();

                    // Close the connection
                    con.Close();

                    // Success message in alerts
                    Response.Write("<script>alert('Registration Successful!');</script>");
                    Response.Redirect("~/Login.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
        private bool ValidateInputs()
        {
            // Check if the username is empty
            if (string.IsNullOrEmpty(Usernametxt.Text.Trim()))
            {
                ShowErrorMessage("Username cannot be empty.");
                return false;
            }

            // Check if the email is in a valid format
            if (!IsValidEmail(Useremailtxt.Text.Trim()))
            {
                ShowErrorMessage("Invalid email format.");
                return false;
            }

            // Check if the password meets the length requirement
            if (Userpasstxt.Text.Trim().Length < 8)
            {
                ShowErrorMessage("Password must be at least 8 characters long.");
                return false;
            }

            // Check if the password and password confirmation match
            if (Userpasstxt.Text.Trim() != Userpass2txt.Text.Trim())
            {
                ShowErrorMessage("Passwords do not match.");
                return false;
            }

            // Check if the email is already registered
            if (IsEmailRegistered(Useremailtxt.Text.Trim()))
            {
                ShowErrorMessage("Email is already registered.");
                return false;
            }

            return true;
        }

        private bool IsValidEmail(string email)
        {
            // Use regular expression to validate the email format
            string emailPattern = @"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
            return Regex.IsMatch(email, emailPattern);
        }

        private bool IsEmailRegistered(string email)
        {
            // Check if the email is already registered in the database
            bool emailExists = false;
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM register WHERE [email] = @email", con);
                cmd.Parameters.AddWithValue("@email", email);

                int count = Convert.ToInt32(cmd.ExecuteScalar());
                emailExists = count > 0;

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }

            return emailExists;
        }

        private void ShowErrorMessage(string message)
        {
            // Display error message in an alert
            Response.Write("<script>alert('" + message + "');</script>");
        }
    }
    }