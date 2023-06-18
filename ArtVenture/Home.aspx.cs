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
    public partial class Home : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateLoginButtonText();
            }
        }
        protected void Signup_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Signup.aspx");
        }
        protected void Login_btn_Click(object sender, EventArgs e)
        {
            if(Session["username"] == null)
            {
                // User is not logged in, redirect to login page
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                // User is logged in, perform logout
                Session.Clear();
                UpdateLoginButtonText();
                Response.Redirect("~/Home.aspx");
            }
        }
        private void UpdateLoginButtonText()
        {
            if (Session["username"] == null)
            {
               // LoginBtn.Text = "Login";
            }
            else
            {
              //  Logout_btn.Text = "Logout";
            }
        }
    }

    }