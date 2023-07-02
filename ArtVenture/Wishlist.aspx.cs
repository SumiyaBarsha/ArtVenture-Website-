using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ArtVenture
{
    public partial class Wishlist : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                List<WishItem> cartItems = GetWishItemsFromDatabase();

                // Bind the cart items to the repeater control
                wishlistRepeater.DataSource = cartItems;
                wishlistRepeater.DataBind();
            }
        }


        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            // Get the ItemId from the command argument of the delete button
            string itemId = ((Button)sender).CommandArgument;

            // Delete the item from the cart in the database or any data source
            DeleteWishItemFromDatabase(itemId);

            // Rebind the cart items after deletion
            List<WishItem> wishItems = GetWishItemsFromDatabase();
            wishlistRepeater.DataSource = wishItems;
            wishlistRepeater.DataBind();

        }


        protected void wishlistRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                

                // Get the corresponding CartItem object from the data source
                WishItem wishItem = e.Item.DataItem as WishItem;


                // Find the delete button control
                Button deleteButton = (Button)e.Item.FindControl("DeleteButton");

                // Set the command argument for the delete button
                deleteButton.CommandArgument = wishItem.ItemId;

                // Set the ID of the delete button to match the item's ItemId
                deleteButton.ID = wishItem.ItemId;


            }
        }


        private void DeleteWishItemFromDatabase(string itemId)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "DELETE FROM wishlist WHERE ItemId = @ItemId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    Response.Write("<script>alert('here');</script>");
                    cmd.Parameters.AddWithValue("@ItemId", itemId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private List<WishItem> GetWishItemsFromDatabase()
        {
            List<WishItem> wishItems = new List<WishItem>();

            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "SELECT c.itemId, p.Img_id as ImgId, p.Img_name AS ProductName, p.Img_price AS Price " +
                               "FROM wishlist AS c " +
                               "INNER JOIN signup AS s ON c.userId = s.userId " +
                               "INNER JOIN pic_detail AS p ON c.Img_id = p.Img_id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            WishItem wishItem = new WishItem
                            {
                                ItemId = reader["itemId"].ToString(),
                                ImgId = reader["ImgId"].ToString(),
                                ProductName = reader["ProductName"].ToString(),
                                Price = Convert.ToDecimal(reader["Price"]),
                            };

                            wishItems.Add(wishItem);
                        }
                    }
                }
            }
            return wishItems;
        }

     

    }

    public class WishItem
    {
        public string ItemId { get; set; }

        public string ImgId { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }

    }
}
