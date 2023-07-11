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
               
                List<CartItem> cartItems = GetCartItemsFromDatabase();

                // Bind the cart items to the repeater control
                cartItemsRepeater.DataSource = cartItems;
                cartItemsRepeater.DataBind();

                decimal cumulativePrice = CalculateCumulativePrice(cartItems);
                cumulativePriceLabel.Text = cumulativePrice.ToString("C");

               
            }
           
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            // Get the ItemId from the command argument of the delete button
            string itemId = ((Button)sender).CommandArgument;

            DeleteCartItemFromDatabase(itemId);

            List<CartItem> cartItems = GetCartItemsFromDatabase();
            cartItemsRepeater.DataSource = cartItems;
            cartItemsRepeater.DataBind();

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
                TextBox quantityInput = e.Item.FindControl("quantityInput") as TextBox;
                Label cumulativePrice = e.Item.FindControl("cumulativePrice") as Label;

                CartItem cartItem = e.Item.DataItem as CartItem;

                quantityInput.Text = cartItem.QuantityInput.ToString();

                Button deleteButton = (Button)e.Item.FindControl("DeleteButton");
                deleteButton.CommandArgument = cartItem.ItemId;
                deleteButton.ID = cartItem.ItemId;


            }
        }


        private List<CartItem> GetCartItemsFromDatabase()
        {
            List<CartItem> cartItems = new List<CartItem>();
            string userID = Session["userId"].ToString();

            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "SELECT c.itemId, c.quantity, p.Img_id as ImgId, p.Img_name AS ProductName, p.Img_price AS Price " +
                               "FROM cart AS c " +
                               "INNER JOIN signup AS s ON c.userId = s.userId " +
                               "INNER JOIN pic_detail AS p ON c.Img_id = p.Img_id WHERE s.userId = @userId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@userId", userID);
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
                    string userId = Session["userId"] as string;

                    decimal cumulativePrice = Decimal.Parse(cumulativePriceLabel.Text.Replace("$", ""));

                    string addressType = addresstype.Value;

                    if (addressType == "home")
                    {
                        cumulativePrice += 50;
                        cumulativePriceLabel.Text = cumulativePrice.ToString("C");
                        messageLabel.Text = "Delivery Charge $50 added";
                    }
                    else if (addressType == "office")
                    {
                        cumulativePrice += 20;
                        cumulativePriceLabel.Text = cumulativePrice.ToString("C");
                        messageLabel.Text = "Delivery Charge $20 added";

                    }
                    totalPriceLabel.Text = cumulativePrice.ToString("C");

                    string fullName = fullname.Value;
                    string mobileNumber = mobile.Value;
                    string landmark = this.landmark.Value;
                    string townCity = town.Value;

                    DateTime timestamp = DateTime.Now;

                    string orderId = Guid.NewGuid().ToString();
                    Session["orderId"] = orderId;

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
            string userId = Session["userId"] as string;
            DateTime timestamp = DateTime.Now;
            string paymentId = Guid.NewGuid().ToString();
          
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
                orderLabel.Text = "Order placed successfully";
                Response.Write("<script>alert('Order received for order id: "+ orderId + "');</script>");
                ClearCartItems(userId);


            }
        }

        private void ClearCartItems(string userId)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "DELETE FROM cart WHERE userId = @userId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@userId", userId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }





    }

    public class CartItem
    {
        public string ItemId { get; set; }

        public string ImgId { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public int QuantityInput { get; set; }
    }

}
