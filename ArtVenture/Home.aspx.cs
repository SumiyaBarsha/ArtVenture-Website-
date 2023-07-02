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
                Login_btn.Text = "Logout"; // Change the button text to "Logout"
                Signup_btn.Visible = false; // Hide the Signup button
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

        protected void Button_Command(object sender, CommandEventArgs e)
        {
            Button button = (Button)sender;

            if (e.CommandName == "Toggle_Log")
            {
                button.Text = "Logout";

                // Add your logic for adding the item to the cart
            }

        }

        protected void menu_MenuItemClick(object sender, MenuEventArgs e)
        {
            if (e.Item.Value == "MyOrders")
            {
                // Handle the click event of the "My Orders" menu item
                // Redirect to the My Orders page or perform any other desired action
                Response.Redirect("~/MyOrders.aspx");
            }
            if (e.Item.Value == "MyProfile")
            {
                // Handle the click event of the "My Orders" menu item
                // Redirect to the My Orders page or perform any other desired action
                Response.Redirect("~/Profile.aspx");
            }
        }

    }

}