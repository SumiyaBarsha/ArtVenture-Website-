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
            string userId = Session["userId"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"SELECT os.order_id AS OrderID, os.pay_time AS PaymentTime, os.pay_method AS PaymentMethod,
                                p.tot_price AS TotalPrice
                        FROM order_success AS os
                        INNER JOIN payment AS p ON os.order_id = p.order_id
                        WHERE os.userId = @userId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
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