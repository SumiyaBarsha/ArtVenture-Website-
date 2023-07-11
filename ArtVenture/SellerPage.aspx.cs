using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ArtVenture
{
    public partial class SellerPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                string username = Session["username"] as string;

                welcomeLiteral.Text = "Welcome " + username;

                BindProductList();

            }
            if (IsPostBack)
            {
                BindProductList();

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
                string idImage = imageId + userId;

                string uploadFolderPath = Server.MapPath("~/img/Uploads/");
                if (fileUpload.HasFile)
                {
                    string fileName = Path.GetFileName(fileUpload.FileName);
                    string fileExtension = Path.GetExtension(fileName);
                    HttpPostedFile selectedfile = fileUpload.PostedFile;


                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                    if (allowedExtensions.Contains(fileExtension.ToLower()))
                    {
                        if (!Directory.Exists(uploadFolderPath))
                        {
                            Directory.CreateDirectory(uploadFolderPath);
                        }

                        string imgName = selectedfile.FileName;
                        string filePath = Path.Combine(uploadFolderPath, fileName);
                        selectedfile.SaveAs(filePath);

                        string imagePath = "~/img/Uploads/" + fileName;


                        BinaryReader br = new BinaryReader(selectedfile.InputStream);
                        byte[] imgData = br.ReadBytes(selectedfile.ContentLength);
                        Session["Photoname"] = imgName;
                        Session["Photobinary"] = imgData;

                        uploadedImage.ImageUrl = "~/img/Uploads/" + fileName;

                        using (SqlConnection con = new SqlConnection(strcon))
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("INSERT INTO pic_detail ([Img], [Img_id], [Img_name], [Img_price], [Img_type], [Img_frame], [Img_medium], [Img_desc], [userId])" +
                                " VALUES (@Img, @Img_id, @Img_name, @Img_price, @Img_type, @Img_frame, @Img_medium, @Img_desc, @userId)", con);
                            cmd.Parameters.AddWithValue("@Img", imagePath);
                            cmd.Parameters.AddWithValue("@Img_id", idImage);
                            cmd.Parameters.AddWithValue("@Img_name", imageName);
                            cmd.Parameters.AddWithValue("@Img_price", imagePrice);
                            cmd.Parameters.AddWithValue("@Img_type", imageType);
                            cmd.Parameters.AddWithValue("@Img_frame", imageFrame);
                            cmd.Parameters.AddWithValue("@Img_medium", imageMedium);
                            cmd.Parameters.AddWithValue("@Img_desc", imageDesc);
                            cmd.Parameters.AddWithValue("@userId", userId);
                            // cmd.ExecuteNonQuery();
                            int rowsAffected = cmd.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                messageLabel.Text = "Image uploaded successfully.";
                                ClearUploadForm();
                            }
                            else
                            {
                                messageLabel.Text = "Failed to upload image.";
                            }
                        }

                       
                        // Response.Write("<script>alert('Image uploaded successfully.');</script>");
                        BindProductList();
                        ClearUploadForm();
                    }
                    else
                    {
                        
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
               
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
             Response.Redirect("~/Login.aspx");
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
            fileUpload.Dispose(); 
        }


        private void BindProductList()
        {
            string userId = Session["userId"] as string;

            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT [Img], [Img_id], [Img_name], [Img_price] FROM pic_detail WHERE userId = @userId", con))
                {
                    cmd.Parameters.AddWithValue("@userId", userId);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        productRepeater.DataSource = dt;
                        productRepeater.DataBind();
                    }
                }
            }
        }

        protected void productRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView rowView = e.Item.DataItem as DataRowView;
                if (rowView != null)
                {
                    string imageUrl = rowView["Img"].ToString();
                    Image productImage = e.Item.FindControl("productImage") as Image;
                    if (productImage != null)
                    {
                        productImage.ImageUrl = ResolveUrl(imageUrl);
                    }
                }
                
            }
           
        }

        protected string GetImageSource(object imgData)
        {
            string imageUrl = imgData.ToString();
            return ResolveUrl(imageUrl);
        }


        protected void DeleteButton_Click(object sender, EventArgs e)
        {
           
            LinkButton deleteButton = sender as LinkButton;

            
            RepeaterItem item = deleteButton.NamingContainer as RepeaterItem;

            if (item != null)
            {
                
                string imageId = (item.FindControl("imageIdHiddenField") as HiddenField)?.Value;

                
                DeleteImage(imageId);
            }
        }


        private void DeleteImage(string imageId)
        {
            if (!string.IsNullOrEmpty(imageId))
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM pic_detail WHERE Img_id = @Img_id", con);
                    cmd.Parameters.AddWithValue("@Img_id", imageId);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        
                        Response.Write("<script>alert('Image deleted successfully.');</script>");
                        BindProductList();
                    }
                    else
                    {
                        
                        Response.Write("<script>alert('Failed to delete image.');</script>");
                    }
                }
            }
        }

    }
}



