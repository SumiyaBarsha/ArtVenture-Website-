using System;
using System.Configuration;
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
            if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
            {
                Login_btn.Text = "Logout";
                Signup_btn.Visible = false;
            }
        }
        protected void Signup_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Signup.aspx");
        }
        protected void Login_btn_Click(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                Session.Clear();
                UpdateLoginButtonText();
                Response.Redirect("~/Home.aspx");
            }
        }
        private void UpdateLoginButtonText()
        {
            if (Session["username"] == null)
            {
                 Login_btn.Text = "Login";

            }
            else
            {
                Login_btn.Text = "Logout";
                Signup_btn.Visible = false;
            }
        }

        protected void Button_Command(object sender, CommandEventArgs e)
        {
            Button button = (Button)sender;

            if (e.CommandName == "Toggle_Log")
            {
                button.Text = "Logout";
            }

        }

        protected void menu_MenuItemClick(object sender, MenuEventArgs e)
        {
            if (e.Item.Value == "MyOrders")
            {
                Response.Redirect("~/MyOrders.aspx");
            }
            if (e.Item.Value == "MyProfile")
            {
                Response.Redirect("~/Profile.aspx");
            }
        }

    }

}