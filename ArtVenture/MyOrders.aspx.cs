using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ArtVenture
{
    public partial class MyOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrdersGrid();
            }
        }

        private void BindOrdersGrid()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"SELECT os.order_id AS OrderID, os.pay_time AS PaymentTime, os.pay_method AS PaymentMethod,
                                p.tot_price AS TotalPrice, c.Img_id AS ImageID
                                FROM order_success AS os
                                JOIN payment AS p ON os.order_id = p.order_id
                                JOIN cart AS c ON os.userId = c.userId
                                WHERE os.userId = @userId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Assuming you have a way to retrieve the userId for the logged-in user
                    string userId = Session["userId"].ToString();
                    command.Parameters.AddWithValue("@userId", userId);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    ordersGridView.DataSource = dt;
                    ordersGridView.DataBind();
                }
            }
        }
    }
}