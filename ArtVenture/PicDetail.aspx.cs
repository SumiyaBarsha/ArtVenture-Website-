using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace ArtVenture
{
    public partial class PicDetail : System.Web.UI.Page
    {
       String strcon= ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get the image ID from the query string or any other source
                string imageId = Request.QueryString["Img_id"];

                if (!string.IsNullOrEmpty(imageId))
                {
                    LoadImageDetails(imageId);
                }
            }
        }

        private void LoadImageDetails(string imageId)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "SELECT Img, Img_id, Img_name, Img_price, Img_type, Img_medium, Img_frame, Img_desc FROM pic_detail WHERE Img_id = @Img_id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Img_id", imageId);
                  
                    con.Open();
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        
                        if (dt.Rows.Count > 0)
                        {
                            
                            DataRow row = dt.Rows[0];
                           
                            string imageUrl = row["Img"].ToString();
                            string imageName = row["Img_name"].ToString();
                            string imagePrice = row["Img_price"].ToString();
                            string imageType = row["Img_type"].ToString();
                            string imageMedium = row["Img_medium"].ToString();
                            string imageFrame = row["Img_frame"].ToString();
                            string imageDescription = row["Img_desc"].ToString();

                            DetailImage.ImageUrl = imageUrl;
                            ImageNameLabel.Text = imageName;
                            PriceLabel.Text =  imagePrice;
                            CategoryLabel.Text = imageType;
                            FrameLabel.Text = imageFrame;
                            MediumLabel.Text = imageMedium;
                            DescriptionLabel.Text = imageDescription;

                        }
                        else
                        {
                           
                            Response.Write("<script>alert('No rows found.');</script>");
                        }
                    }
                }
            }
        }

        protected void AddToCartButton_Click(object sender, EventArgs e)
        {
            string imgId = Request.QueryString["Img_id"];
            string userId = RetrieveUserIdFromDatabase(imgId);

            // Retrieve the ImageUrl from the database
            string imageUrl = RetrieveImageUrlFromDatabase(imgId);

            // Save the necessary information to the cart table
            AddToCart(userId, imgId, imageUrl);
        }


        private string RetrieveUserIdFromDatabase(string imageId)
        {
            string userId = null;

            // Establish a database connection
            using (SqlConnection connection = new SqlConnection(strcon))
            {
                connection.Open();

                // Create a SQL command to retrieve the userId
                string query = "SELECT userId FROM pic_detail WHERE Img_id = @ImageId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ImageId", imageId);

                    // Execute the query and retrieve the userId
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            userId = reader["userId"].ToString();
                        }
                    }
                }
            }

            return userId;
        }
        private string RetrieveImageUrlFromDatabase(string imageId)
        {
            string imageUrl = null;

            // Establish a database connection
            using (SqlConnection connection = new SqlConnection(strcon))
            {
                connection.Open();

                // Create a SQL command to retrieve the imageUrl
                string query = "SELECT Img FROM pic_detail WHERE Img_id = @ImageId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ImageId", imageId);

                    // Execute the query and retrieve the imageUrl
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            imageUrl = reader["Img"].ToString();
                        }
                    }
                }
            }

            return imageUrl;
        }


        private void AddToCart(string userId, string imgId, string imageUrl)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "SELECT COUNT(*) FROM cart WHERE itemId = @itemId";

                using (SqlCommand command = new SqlCommand(query, con))
                {
                    // Set the parameter values
                    command.Parameters.AddWithValue("@itemId", userId + imgId);

                    con.Open();

                    int itemCount = Convert.ToInt32(command.ExecuteScalar());

                    if (itemCount > 0)
                    {
                        // Item already exists in the cart, increase the quantity
                        query = "UPDATE cart SET quantity = quantity + 1 WHERE itemId = @itemId";

                        using (SqlCommand updateCommand = new SqlCommand(query, con))
                        {
                            // Set the parameter values for update
                            updateCommand.Parameters.AddWithValue("@itemId", userId + imgId);

                            updateCommand.ExecuteNonQuery();

                            // Display a message or perform any additional actions
                            Response.Write("<script>alert('Item quantity increased in the cart.');</script>");
                        }
                    }
                    else
                    {
                        // Item does not exist in the cart, proceed with insertion
                        query = "INSERT INTO cart (itemId, userId, Img_id, quantity) VALUES (@itemId, @userId, @Img_id, @quantity)";

                        using (SqlCommand insertCommand = new SqlCommand(query, con))
                        {
                            // Set the parameter values for insertion
                            insertCommand.Parameters.AddWithValue("@itemId", userId + imgId);
                            insertCommand.Parameters.AddWithValue("@userId", userId);
                            insertCommand.Parameters.AddWithValue("@Img_id", imgId);
                            insertCommand.Parameters.AddWithValue("@ImageUrl", imageUrl);
                            insertCommand.Parameters.AddWithValue("@quantity", 1);

                            insertCommand.ExecuteNonQuery();

                            // Item added to cart, display a success message or perform any additional actions
                            Response.Write("<script>alert('Item added to cart.');</script>");
                        }
                    }
                }
            }
        }

    }
}
