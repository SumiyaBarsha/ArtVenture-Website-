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

                
                wishlistRepeater.DataSource = cartItems;
                wishlistRepeater.DataBind();
            }
        }


        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            
            string itemId = ((Button)sender).CommandArgument;

           
            DeleteWishItemFromDatabase(itemId);

            
            List<WishItem> wishItems = GetWishItemsFromDatabase();
            wishlistRepeater.DataSource = wishItems;
            wishlistRepeater.DataBind();

        }


        protected void wishlistRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                

                
                WishItem wishItem = e.Item.DataItem as WishItem;


                
                Button deleteButton = (Button)e.Item.FindControl("DeleteButton");

                
                deleteButton.CommandArgument = wishItem.ItemId;

                
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
                    cmd.Parameters.AddWithValue("@ItemId", itemId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private List<WishItem> GetWishItemsFromDatabase()
        {
            List<WishItem> wishItems = new List<WishItem>();
            string userID = Session["userId"].ToString();

            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "SELECT c.itemId, p.Img_id as ImgId, p.Img_name AS ProductName, p.Img_price AS Price " +
                               "FROM wishlist AS c " +
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
