using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtVenture
{

    public partial class Profile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
                string userId = Session["userId"].ToString();

                if (!string.IsNullOrEmpty(userId))
                {
                    
                    FetchUserDetails(userId);

                    DisplayProfilePicture(userId);
                }

            
        }
    }
        protected void uploadButton_Click(object sender, EventArgs e)
        {
            try
            {
                string uploadFolderPath = Server.MapPath("~/img/ProfilePictures/");
                if (FileUpload1.HasFile)
                {
                    string fileName = Path.GetFileName(FileUpload1.FileName);
                    string fileExtension = Path.GetExtension(fileName);
                    HttpPostedFile selectedfile = FileUpload1.PostedFile;

                    string userId = Session["userId"].ToString();
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
                        string imagePath = "~/img/ProfilePictures/" + fileName;

                        BinaryReader br = new BinaryReader(selectedfile.InputStream);
                        byte[] imgData = br.ReadBytes(selectedfile.ContentLength);
                        Session["Photoname"] = imgName;
                        Session["Photobinary"] = imgData;

                        profileImage.ImageUrl = "~/img/ProfilePictures/" + fileName;

                        using (SqlConnection con = new SqlConnection(strcon))
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("INSERT INTO profiles ([userId],[Img])  VALUES (@userId, @Img)", con);
                            cmd.Parameters.AddWithValue("@Img", imagePath);
                            cmd.Parameters.AddWithValue("@userId", userId);
                            // cmd.ExecuteNonQuery();
                            int rowsAffected = cmd.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                messageLabel.Text = "Image uploaded successfully.";
                                uploadButton.Visible = false; // Hide the upload button
                                updateButton.Visible = true; // Show the update button
                            }
                            else
                            {
                                messageLabel.Text = "Failed to upload image.";
                            }
                        }
                    }
                }
            }
            catch
            { 

            }
        }
        private void DisplayProfilePicture(string userId)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT [Img] FROM profiles WHERE [userId] = @userId", con);
                cmd.Parameters.AddWithValue("@userId", userId);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string imagePath = reader["Img"].ToString();
                    profileImage.ImageUrl = imagePath;
                }
                reader.Close();
            }
        }


        protected void updateButton_Click(object sender, EventArgs e)
        {
            try
            {
                string uploadFolderPath = Server.MapPath("~/img/ProfilePictures/");
                if (FileUpload1.HasFile)
                {
                    string fileName = Path.GetFileName(FileUpload1.FileName);
                    string fileExtension = Path.GetExtension(fileName);
                    HttpPostedFile selectedfile = FileUpload1.PostedFile;

                    string userId = Session["userId"].ToString();
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
                        string imagePath = "~/img/ProfilePictures/" + fileName;

                        BinaryReader br = new BinaryReader(selectedfile.InputStream);
                        byte[] imgData = br.ReadBytes(selectedfile.ContentLength);
                        Session["Photoname"] = imgName;
                        Session["Photobinary"] = imgData;

                        profileImage.ImageUrl = "~/img/ProfilePictures/" + fileName;

                        using (SqlConnection con = new SqlConnection(strcon))
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("UPDATE profiles SET [Img] = @Img WHERE [userId] = @userId", con);
                            cmd.Parameters.AddWithValue("@Img", imagePath);
                            cmd.Parameters.AddWithValue("@userId", userId);
                            int rowsAffected = cmd.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                messageLabel.Text = "Image updated successfully.";
                            }
                            else
                            {
                                messageLabel.Text = "Failed to update image.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                
                messageLabel.Text = "Error updating image: " + ex.Message;
            }
        }


        protected void addAgeLink_Click(object sender, EventArgs e)
        {
            ageLabel.Visible = false;
            addAgeLink.Visible = false;
            ageTextBox.CssClass = "";
            saveAgeButton.CssClass = "";
        }

        protected void saveAgeButton_Click(object sender, EventArgs e)
        {
            string age = ageTextBox.Text.Trim();
            string userId = Session["userId"].ToString();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE profiles SET [age] = @age WHERE [userId] = @userId", con);
                cmd.Parameters.AddWithValue("@age", age);
                cmd.Parameters.AddWithValue("@userId", userId);
                // cmd.ExecuteNonQuery();
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    Response.Write("<script>alert('Updated age');</script>");

                }
                else
                {
                    Response.Write("<script>alert('Failed to Update');</script>");
                }
            }
            ageLabel.Text = age;
            ageLabel.Visible = true;
            addAgeLink.Visible = true;
            ageTextBox.CssClass = "hidden";
            saveAgeButton.CssClass = "hidden";
        }

        protected void addPhoneLink_Click(object sender, EventArgs e)
        {
            phoneLabel.Visible = false;
            addPhoneLink.Visible = false;
            phoneTextBox.CssClass = "";
            savePhoneButton.CssClass = "";
        }

        protected void savePhoneButton_Click(object sender, EventArgs e)
        {
            string phoneNumber = phoneTextBox.Text.Trim();
            string userId = Session["userId"].ToString();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE profiles SET [phone] = @phone WHERE [userId] = @userId", con);
                cmd.Parameters.AddWithValue("@phone", phoneNumber);
                cmd.Parameters.AddWithValue("@userId", userId);
                // cmd.ExecuteNonQuery();
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    Response.Write("<script>alert('Updated phone');</script>");

                }
                else
                {
                    Response.Write("<script>alert('Failed to Update');</script>");
                }
            }
        
            phoneLabel.Text = phoneNumber;
            phoneLabel.Visible = true;
            addPhoneLink.Visible = true;
            phoneTextBox.CssClass = "hidden";
            savePhoneButton.CssClass = "hidden";
        }

        protected void addAddressLink_Click(object sender, EventArgs e)
        {
            addressLabel.Visible = false;
            addAddressLink.Visible = false;
            addressTextBox.CssClass = "";
            saveAddressButton.CssClass = "";
        }

        protected void saveAddressButton_Click(object sender, EventArgs e)
        {
            string address = addressTextBox.Text.Trim();
            string userId = Session["userId"].ToString();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE profiles SET [address] = @address WHERE [userId] = @userId", con);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@userId", userId);
                // cmd.ExecuteNonQuery();
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    Response.Write("<script>alert('Updated address');</script>");

                }
                else
                {
                    Response.Write("<script>alert('Failed to Update');</script>");
                }
            }
            addressLabel.Text = address;
            addressLabel.Visible = true;
            addAddressLink.Visible = true;
            addressTextBox.CssClass = "hidden";
            saveAddressButton.CssClass = "hidden";
        }



        private void FetchUserDetails(string userId)
    {
       
        string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT username, email, category FROM signup WHERE userId = @userId";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@userId", userId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {     
                    userIdLabel.Text = userId;
                    usernameLabel.Text = reader["username"].ToString();
                    emailLabel.Text = reader["email"].ToString();
                    categoryLabel.Text = reader["category"].ToString();
                }

                reader.Close();
            }
        }
    }

   
  }
}