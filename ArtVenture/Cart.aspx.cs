using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq.Expressions;
using System.Reflection;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Services;

namespace ArtVenture
{
    public partial class Cart : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                // Populate the cart items from the database or any data source
                List<CartItem> cartItems = GetCartItemsFromDatabase();

                // Bind the cart items to the repeater control
                cartItemsRepeater.DataSource = cartItems;
                cartItemsRepeater.DataBind();

                // Calculate and display the cumulative price
                decimal cumulativePrice = CalculateCumulativePrice(cartItems);
                cumulativePriceLabel.Text = cumulativePrice.ToString("C");

            }
           
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            // Get the ItemId from the command argument of the delete button
            string itemId = ((Button)sender).CommandArgument;

            // Delete the item from the cart in the database or any data source
            DeleteCartItemFromDatabase(itemId);

            // Rebind the cart items after deletion
            List<CartItem> cartItems = GetCartItemsFromDatabase();
            cartItemsRepeater.DataSource = cartItems;
            cartItemsRepeater.DataBind();

            // Calculate and display the updated cumulative price
            decimal cumulativePrice = CalculateCumulativePrice(cartItems);
            cumulativePriceLabel.Text = cumulativePrice.ToString("C");
        }

        private void DeleteCartItemFromDatabase(string itemId)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "DELETE FROM Cart WHERE ItemId = @ItemId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ItemId", itemId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }



        protected void cartItemsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the controls within the Repeater item
                TextBox quantityInput = e.Item.FindControl("quantityInput") as TextBox;
                Label cumulativePrice = e.Item.FindControl("cumulativePrice") as Label;

                // Get the corresponding CartItem object from the data source
                CartItem cartItem = e.Item.DataItem as CartItem;

                // Set the initial value of the quantity-input control
                quantityInput.Text = cartItem.QuantityInput.ToString();

                

                // Find the delete button control
                Button deleteButton = (Button)e.Item.FindControl("DeleteButton");

                // Set the command argument for the delete button
                deleteButton.CommandArgument = cartItem.ItemId;

                // Set the ID of the delete button to match the item's ItemId
                deleteButton.ID = cartItem.ItemId;


            }
        }


        // Retrieve the cart items from the database or any data source
        private List<CartItem> GetCartItemsFromDatabase()
        {
            List<CartItem> cartItems = new List<CartItem>();

            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "SELECT c.itemId, c.quantity, p.Img_id as ImgId, p.Img_name AS ProductName, p.Img_price AS Price " +
                               "FROM cart AS c " +
                               "INNER JOIN signup AS s ON c.userId = s.userId " +
                               "INNER JOIN pic_detail AS p ON c.Img_id = p.Img_id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            CartItem cartItem = new CartItem
                            {
                                ItemId = reader["itemId"].ToString(),
                                ImgId = reader["ImgId"].ToString(),
                                ProductName = reader["ProductName"].ToString(),
                                Price = Convert.ToDecimal(reader["Price"]),
                                QuantityInput = Convert.ToInt32(reader["quantity"])
                            };

                            cartItems.Add(cartItem);
                        }
                    }
                }
            }
            return cartItems;
        }


        // Calculate the cumulative price of all cart items
        private decimal CalculateCumulativePrice(List<CartItem> cartItems)
        {
            decimal cumulativePrice = 0;
            foreach (CartItem cartItem in cartItems)
            {
                cumulativePrice += cartItem.Price * cartItem.QuantityInput;
            }
            return cumulativePrice;
        }


        protected void confirmInfoButton_Click(object sender, EventArgs e)
        {
            try {
                if (UserIsLoggedIn())
                {
                    // Get the current user ID from your authentication mechanism
                    string userId = Session["userId"] as string;

                    // Get the cumulative price from the label or any other source
                    decimal cumulativePrice = Decimal.Parse(cumulativePriceLabel.Text.Replace("$", ""));

                    // Get the address type selected by the user
                    string addressType = addresstype.Value;

                    // Add additional charges based on the address type
                    if (addressType == "home")
                    {
                        cumulativePrice += 50;
                        cumulativePriceLabel.Text = cumulativePrice.ToString("C");
                        messageLabel.Text = "Delivery Charge $50 added";
                        //ClientScript.RegisterStartupScript(this.GetType(), "PaymentAlert", "alert('Delivery Charge $50 added.');", true);
                    }
                    else if (addressType == "office")
                    {
                        cumulativePrice += 20;
                        cumulativePriceLabel.Text = cumulativePrice.ToString("C");
                        messageLabel.Text = "Delivery Charge $20 added";
                       // ClientScript.RegisterStartupScript(this.GetType(), "PaymentAlert", "alert('Delivery Charge $20 added.');", true);

                    }
                    totalPriceLabel.Text = cumulativePrice.ToString("C");


                    // Get other payment details from the form controls in the "payment-section" div
                    string fullName = fullname.Value;
                    string mobileNumber = mobile.Value;
                    string landmark = this.landmark.Value;
                    string townCity = town.Value;

                    // Get the current timestamp
                    DateTime timestamp = DateTime.Now;

                    // Generate a new GUID for the order ID
                    string orderId = Guid.NewGuid().ToString();
                    Session["orderId"] = orderId;

                    // Save the data to the "order" table
                    string query = "INSERT INTO payment ([order_id], [userId], [p_name], [p_land], [p_time], [tot_price], [mobile], [p_city], [p_address]) VALUES (@order_id, @userId, @p_name, @p_land, @p_time, @tot_price, @mobile, @p_city, @p_address)";
                    using (SqlConnection connection = new SqlConnection(strcon))
                    {
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@order_id", orderId);
                        command.Parameters.AddWithValue("@userId", userId);
                        command.Parameters.AddWithValue("@p_name", fullName);
                        command.Parameters.AddWithValue("@p_land", landmark);
                        command.Parameters.AddWithValue("@p_time", timestamp);
                        command.Parameters.AddWithValue("@tot_price", cumulativePrice);
                        command.Parameters.AddWithValue("@mobile", mobileNumber);
                        command.Parameters.AddWithValue("@p_city", townCity);
                        command.Parameters.AddWithValue("@p_address", addressType);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }

                    if(fullName!= null && landmark!= null && timestamp!= null  &&
                        mobileNumber!=null && townCity!=null && addresstype!=null) 
                    {
                        Response.Write("<script>alert('Info is Confirmed'</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Please fill out all information!'</script>");
                    }
                }
                else
                {
                    ShowLoginMessage();
                }
            }catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        } 
        private bool UserIsLoggedIn()
        {
            string userId = Session["userId"] as string;
            if(userId == null) { return false; }
            else { return true; }
        }

        private void ShowLoginMessage()
        {
            ClientScript.RegisterStartupScript(this.GetType(), "loginAlert", "alert('Please login to proceed with payment.');", true);
        }

        protected void confirmButton_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the payment details
                string totalPrice = totalPriceLabel.Text;
                string selectedDeliveryMethod = deliveryMethod.SelectedValue;
                string orderId = Session["orderId"] as string;

                // Save the payment details to the order_success table
                SavePaymentDetails(totalPrice, selectedDeliveryMethod,orderId);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        private void SavePaymentDetails(string totalPrice, string deliveryMethod, string orderId)
        {
            // Get other necessary payment details
            string userId = Session["userId"] as string;
            DateTime timestamp = DateTime.Now;
            string paymentId = Guid.NewGuid().ToString();
          

            // Save the payment details to the order_success table
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "INSERT INTO order_success (payment_id,order_id, userId, pay_time, pay_method) " +
                               "VALUES (@payment_id,@order_id, @userId, @pay_time, @pay_method)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@payment_id", paymentId);
                    cmd.Parameters.AddWithValue("@order_id", orderId);
                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.Parameters.AddWithValue("@pay_time", timestamp);
                    cmd.Parameters.AddWithValue("@pay_method", deliveryMethod);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                Response.Write("<script>alert('Order received for order id: "+ orderId + "');</script>");
            }
        }




    }

    // Model class for cart items
    public class CartItem
    {
        public string ItemId { get; set; }

        public string ImgId { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public int QuantityInput { get; set; }
    }

}
