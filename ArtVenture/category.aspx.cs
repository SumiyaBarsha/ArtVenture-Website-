using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Services;
using System.Web.UI.WebControls;


namespace ArtVenture
{
    public partial class category : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string searchQuery = Request.Form["__EVENTTARGET"]; // Get the search query from the postback

                BindImageDataByCategory("Sculpture", searchQuery, SculptureRepeater);
                BindImageDataByCategory("Painting", searchQuery, PaintingRepeater);
                BindImageDataByCategory("Photography", searchQuery, PhotographyRepeater);
                BindImageDataByCategory("FiberArt", searchQuery, FiberRepeater);
                BindImageDataByCategory("GlassArt", searchQuery, GlassRepeater);
                BindImageDataByCategory("DrawingandIllustrations", searchQuery, DrawingRepeater);
                BindImageDataByCategory("Miniature", searchQuery, MiniatureRepeater);
                BindImageDataByCategory("Prints", searchQuery, PrintRepeater);

                BindGridView();

            }

        }

        private void BindImageDataByCategory(string category, string searchQuery, Repeater repeater)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "SELECT [Img], [Img_id], [Img_name], [Img_price] FROM pic_detail WHERE Img_type = @Img_type";

                if (!string.IsNullOrEmpty(searchQuery))
                {
                    query += " AND [Img_name] LIKE '%' + @SearchQuery + '%'";
                }
                else
                {
                    Response.Write("<script>alert('Enter Something to Search : '</script>");
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Img_type", category);

                    if (!string.IsNullOrEmpty(searchQuery))
                    {
                        cmd.Parameters.AddWithValue("@SearchQuery", searchQuery);
                    }

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    repeater.DataSource = dataTable;
                    repeater.DataBind();
                }
            }
        }


        protected void searchButton_Click(object sender, EventArgs e)
        {
            string searchTerm = searchInput.Value;

            if (!string.IsNullOrEmpty(searchTerm))
            {
                List<ImageModel> searchResults = SearchImagesByImgName(searchTerm);

                searchResultsGridView.DataSource = searchResults;
                searchResultsGridView.DataBind();

                searchResultsGridView.Visible = searchResults.Count > 0;
            }
            else
            {
                searchResultsGridView.Visible = false;
            }
        }

        private void BindGridView()
        {
            List<ImageModel> allImages = FetchImagesFromDataSource();

            searchResultsGridView.DataSource = allImages;
            searchResultsGridView.DataBind();
        }

        private void PerformSearch()
        {
            string searchTerm = searchInput.Value;

            List<ImageModel> searchResults = SearchImagesByImgName(searchTerm);

            if (searchResults.Count > 0)
            {
                searchResultsGridView.DataSource = searchResults;
                searchResultsGridView.DataBind();
                searchResultsGridView.Visible = true;

              
            }
            else
            {
                searchResultsGridView.Visible = false;

            }
        }

        private List<ImageModel> SearchImagesByImgName(string searchTerm)
        {
            string searchQuery
                = searchTerm.ToLower(); 

            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "SELECT [Img], [Img_id], [Img_name], [Img_price], [Img_type], [Img_medium], [Img_frame] FROM pic_detail WHERE LOWER([Img_name]) LIKE '%' + @SearchQuery + '%' OR [Img_type] = @SearchInput";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@SearchQuery", searchQuery);
                    cmd.Parameters.AddWithValue("@SearchInput", searchTerm);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    searchResultsGridView.DataSource = dataTable;
                    searchResultsGridView.DataBind();
                }
            }

            List<ImageModel> searchResults = new List<ImageModel>();
            foreach (ImageModel image in FetchImagesFromDataSource())
            {
                if (image.Img_name.ToLower().Contains(searchQuery) || image.Img_type.Equals(searchTerm, StringComparison.OrdinalIgnoreCase))
                {
                    searchResults.Add(image);
                }
            }
            return searchResults;
        }



        private List<ImageModel> FetchImagesFromDataSource()
        {
            List<ImageModel> images = new List<ImageModel>();

            // Retrieve image data from the data source
            // Iterate through the data source and populate the image list

            // Example code to fetch images from the database
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "SELECT [Img], [Img_id], [Img_name], [Img_price],[Img_type],[Img_medium],[Img_frame] FROM pic_detail";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ImageModel image = new ImageModel();
                        image.Img = reader["Img"].ToString();
                        image.Img_id = reader["Img_id"].ToString();
                        image.Img_name = reader["Img_name"].ToString();
                        image.Img_price = reader["Img_price"].ToString();
                        image.Img_type = reader["Img_type"].ToString();
                        image.Img_medium = reader["Img_medium"].ToString();
                        image.Img_frame = reader["Img_frame"].ToString();


                        // Add the image to the list
                        images.Add(image);
                    }

                    reader.Close();
                }
            }
            return images;

        }



        protected void FavoriteButton_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            string imgId = button.CommandArgument.ToString();
            String userId = Session["userId"].ToString();

            AddToWishlist(userId, imgId);
        }

        protected void AddtoCartButton_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            string imgId = button.CommandArgument.ToString();
            String userId = Session["userId"].ToString();

            AddToCart(userId, imgId);
        }

        private void AddToCart(string userId, string imgId)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "SELECT COUNT(*) FROM cart WHERE itemId = @itemId";

                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@itemId", userId + imgId);

                    con.Open();

                    int itemCount = Convert.ToInt32(command.ExecuteScalar());

                    if (itemCount > 0)
                    {
                        query = "UPDATE cart SET quantity = quantity + 1 WHERE itemId = @itemId";

                        using (SqlCommand updateCommand = new SqlCommand(query, con))
                        {
                            
                            updateCommand.Parameters.AddWithValue("@itemId", userId + imgId);

                            updateCommand.ExecuteNonQuery();

                            Response.Write("<script>alert('Item quantity increased in the cart.');</script>");
                        }
                    }
                    else
                    {
                        string relativePath = "~/img/Shoppingbag.jpg";
                        string imageurl = ResolveUrl(relativePath);

                        query = "INSERT INTO cart (itemId, userId, Img_id, quantity) VALUES (@itemId, @userId, @Img_id, @quantity)";

                        using (SqlCommand insertCommand = new SqlCommand(query, con))
                        {
                            // Set the parameter values for insertion
                            insertCommand.Parameters.AddWithValue("@itemId", userId + imgId);
                            insertCommand.Parameters.AddWithValue("@userId", userId);
                            insertCommand.Parameters.AddWithValue("@Img_id", imgId);
                            insertCommand.Parameters.AddWithValue("@ImageUrl", imageurl);
                            insertCommand.Parameters.AddWithValue("@quantity", 1);

                            insertCommand.ExecuteNonQuery();

                            Response.Write("<script>alert('Item added to cart.');</script>");
                        }
                    }
                }
            }
        }


        private void AddToWishlist(string userId, string imgId)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "SELECT COUNT(*) FROM wishlist WHERE itemId = @itemId";

                using (SqlCommand command = new SqlCommand(query, con))
                {
                    // Set the parameter values
                    command.Parameters.AddWithValue("@itemId", userId + imgId);

                    con.Open();

                        // Item does not exist in the cart, proceed with insertion
                        query = "INSERT INTO wishlist (itemId, userId, Img_id) VALUES (@itemId, @userId, @Img_id)";

                        using (SqlCommand insertCommand = new SqlCommand(query, con))
                        {
                            insertCommand.Parameters.AddWithValue("@itemId", userId + imgId);
                            insertCommand.Parameters.AddWithValue("@userId", userId);
                            insertCommand.Parameters.AddWithValue("@Img_id", imgId);


                            insertCommand.ExecuteNonQuery();

                            Response.Write("<script>alert('Item added to wishlist.');</script>");
                        }
                    
                }
            }
        }

    }
    public class ImageModel
    {
        public string Img { get; set; }
        public string Img_id { get; set; }
        public string Img_name { get; set; }
        public string Img_price { get; set; }

        public string Img_type { get; set; }
        public string Img_medium { get; set; }
        public string Img_frame { get; set; }
    }
}
