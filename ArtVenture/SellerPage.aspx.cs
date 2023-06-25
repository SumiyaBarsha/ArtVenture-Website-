using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace ArtVenture
{
    public partial class SellerPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;  
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get the username from the session
                string username = Session["username"] as string;

                // Set the welcome message
                welcomeLiteral.Text = "Welcome " + username;
            }
        }



        protected void UploadButton_Click(object sender, EventArgs e)
        {
            try
            {

                string imageId = imageIdTxt.Text.Trim();
                string imageName = imageNameTxt.Text.Trim();
                string imagePrice = imagePriceTxt.Text.Trim();
                string imageType = imageTypeTxt.Text.Trim();
                string imageFrame = imageFrameTxt.Text.Trim();
                string imageMedium = imageMediumTxt.Text.Trim();
                string imageDesc = imageDescTxt.Text.Trim();

                string userId = Session["userId"] as string;

                // Save the uploaded image to a folder
                if (fileUpload.HasFile)
                {
                    HttpPostedFile selectedfile = fileUpload.PostedFile;
                    string fileExtension = Path.GetExtension(selectedfile.FileName);
                 
                   
                    // Check if the file extension is allowed (e.g., restrict to images)
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                    if (allowedExtensions.Contains(fileExtension.ToLower()))
                    {
                        string imgName= selectedfile.FileName;
                        string uploadFolderPath = Server.MapPath("~/Uploads/");
                        if(!Directory.Exists(uploadFolderPath))
                        {
                            Directory.CreateDirectory(uploadFolderPath);
                        }
                        // Save the file to the server
                        string filePath = Path.Combine(uploadFolderPath, imgName);
                        selectedfile.SaveAs(filePath);
                       // selectedfile.SaveAs(uploadFolderPath+imageName);
                        uploadedImage.ImageUrl = "~/Uploads/" + imgName;

                        BinaryReader br = new BinaryReader(selectedfile.InputStream);
                        byte[] imgData = br.ReadBytes(selectedfile.ContentLength);
                        Session["Photoname"] = imgName;
                        Session["Photobinary"] = imgData;

                        // Insert the image details into the SQL table "pic_detail"
                        using (SqlConnection con = new SqlConnection(strcon))
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("INSERT INTO pic_detail ([Img], [Img_id], [Img_name], [Img_price], [Img_type], [Img_frame], [Img_medium], [Img_desc], [userId])" +
                                " VALUES (@Img, @Img_id, @Img_name, @Img_price, @Img_type, @Img_frame, @Img_medium, @Img_desc, @userId)", con);
                            cmd.Parameters.AddWithValue("@Img", imgData);
                            cmd.Parameters.AddWithValue("@Img_id", imageId);
                            cmd.Parameters.AddWithValue("@Img_name", imageName);
                            cmd.Parameters.AddWithValue("@Img_price", imagePrice);
                            cmd.Parameters.AddWithValue("@Img_type", imageType);
                            cmd.Parameters.AddWithValue("@Img_frame", imageFrame);
                            cmd.Parameters.AddWithValue("@Img_medium", imageMedium);
                            cmd.Parameters.AddWithValue("@Img_desc", imageDesc);
                            cmd.Parameters.AddWithValue("@userId", userId);
                            cmd.ExecuteNonQuery();
                        }

                        // Display success message or redirect to a different page
                        Response.Write("<script>alert('Image uploaded successfully.');</script>");
                        ClearUploadForm();
                    }
                    else
                    {
                        // Display an error message if no file is selected
                        Response.Write("<script>alert('Please select an image file to upload.');</script>");
                    }
                }
            }
            catch (SqlException ex)
            {
                string errorMessage = "SQL Error: " + ex.Message;
                if (ex.InnerException != null)
                    errorMessage += " Inner Exception: " + ex.InnerException.Message;
                Response.Write("<script>alert('" + errorMessage + "');</script>");
            }
        
            catch (Exception ex)
            {
                // Handle the exception
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        private int GetOrderCount()
        {
            int count = 0;
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM pic_detail WHERE seller_username = @username", con);
                    cmd.Parameters.AddWithValue("@username", Session["username"]);
                    count = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            catch (Exception ex)
            {
                // Handle the exception
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
            return count;
        }

        private DataTable GetProducts()
        {
            DataTable productsTable = new DataTable();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                SqlCommand cmd = new SqlCommand("SELECT [Img], [Img_name], [Img_price] FROM pic_detail", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(productsTable);
            }
            // Convert the byte array image data to base64 strings
            foreach (DataRow row in productsTable.Rows)
            {
                byte[] imgData = (byte[])row["Img"];
                string base64Image = Convert.ToBase64String(imgData);
                row["Img"] = base64Image;
            }
            return productsTable;
        }

        private void BindProductList()
        {
            DataTable productsTable = GetProducts();

            foreach (DataRow row in productsTable.Rows)
            {
                string base64Image = row["Img"].ToString();
                string imageUrl = "data:image;base64," + base64Image;
                string productName = row["Img_name"].ToString();
                string productPrice = row["Img_price"].ToString();

                // Create HTML markup for the product item
                string productItemHtml = $@"
        <li>
            <div class='product'>
                <img src='{imageUrl}' alt='{productName}' />
                <h3>{productName}</h3>
                <p>{productPrice}</p>
                <a href='#' class='edit-btn'>Edit</a>
                <a href='#' class='delete-btn'>Delete</a>
            </div>
        </li>";

                // Add the product item markup to the product list placeholder
                productListPlaceholder.Controls.Add(new LiteralControl(productItemHtml));
            }
        }

        private void ClearUploadForm()
        {
            imageIdTxt.Text = "";
            imageNameTxt.Text = "";
            imagePriceTxt.Text = "";
            imageTypeTxt.Text = "";
            imageFrameTxt.Text = "";
            imageMediumTxt.Text = "";
            imageDescTxt.Text = "";
            uploadedImage.ImageUrl = "";
            Session["Photoname"] = null;
            Session["Photobinary"] = null;
           // fileUpload.Dispose(); // Clear the selected file
        }


    }
}


