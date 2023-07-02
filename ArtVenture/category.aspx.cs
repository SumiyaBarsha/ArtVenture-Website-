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

        // Method to retrieve image data from the database based on category and bind it to the repeater
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

                // Show or hide the GridView based on search results
                searchResultsGridView.Visible = searchResults.Count > 0;
            }
            else
            {
                // Hide the GridView when search query is empty or null
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
                // Display search results
                searchResultsGridView.DataSource = searchResults;
                searchResultsGridView.DataBind();
                searchResultsGridView.Visible = true;

              
            }
            else
            {
                // Display search message
                searchResultsGridView.Visible = false;

            }
        }

        private List<ImageModel> SearchImagesByImgName(string searchTerm)
        {
            string searchQuery
                = searchTerm.ToLower(); // Convert the search query to lowercase

            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "SELECT [Img], [Img_id], [Img_name], [Img_price], [Img_type], [Img_medium], [Img_frame] FROM pic_detail WHERE LOWER([Img_name]) LIKE '%' + @SearchQuery + '%' OR [Img_type] = @SearchInput"; // Convert Img_name to lowercase in the query

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@SearchQuery", searchQuery);
                    cmd.Parameters.AddWithValue("@SearchInput", searchTerm);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    // Bind the DataTable to the GridView
                    searchResultsGridView.DataSource = dataTable;
                    searchResultsGridView.DataBind();
                }
            }

            List<ImageModel> searchResults = new List<ImageModel>();

            // Example code to search for images based on image name
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

                            // Item added to cart, display a success message or perform any additional actions
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
                            // Set the parameter values for insertion
                            insertCommand.Parameters.AddWithValue("@itemId", userId + imgId);
                            insertCommand.Parameters.AddWithValue("@userId", userId);
                            insertCommand.Parameters.AddWithValue("@Img_id", imgId);


                            insertCommand.ExecuteNonQuery();

                            // Item added to cart, display a success message or perform any additional actions
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
