<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ArtVenture.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ArtVenture</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"> 
    <link
        href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;600&family=Dancing+Script:wght@400;600;700&family=Lobster&family=Roboto+Flex:wght@100;500&family=Roboto:wght@300;500;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link href="styles/profile_style.css" rel="stylesheet" />

    <script>
        function showPreviewImage() {
            var fileInput = document.getElementById('<%= FileUpload1.ClientID %>');
            if (fileInput.files && fileInput.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var previewImage = document.getElementById('<%= profileImage.ClientID %>');
                    previewImage.src = e.target.result;
                };
                reader.readAsDataURL(fileInput.files[0]);
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  

    <div
    style="padding:20px;display:grid;grid-template-columns: 2.5fr  0.5fr 0.5fr 0.5fr 0.5fr;background-image:url(img/artsy\ \(2\).jfif)">
    <div class="site-name">ArtVenture</div>
    <div class="icons"><a href="Home.aspx"><i class="bx bx-home"></i></a></div>
    <div class="icons"><a href="category.aspx"><i class="bx bx-palette"></i></a></div>
    <div class="icons"><a href="Wishlist.aspx"><i class="bx bx-heart"></i></a></div>
    <div class="icons"><a href="Cart.aspx"><i class="bx bx-cart"></i></a></div>
</div>
    <div class="container">
    <h1>Profile</h1>
    <div class="profile">
    <label>Profile Picture:</label>
        <div> <asp:Image ID="profileImage" runat="server" Width="200" Height="200" /></div>
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Button ID="uploadButton" runat="server" Text="Upload" OnClick="uploadButton_Click" />
            <asp:Button ID="updateButton" runat="server" Text="Update" Visible="false" OnClick="updateButton_Click" />
        </div>
        <div> <asp:Label ID="messageLabel" runat="server"></asp:Label></div>
   </div>

        <div class="profile-details">
            <h2><asp:Label ID="usernameLabel" runat="server"></asp:Label></h2>
            <div class="profile-info">
                <div>
                    <label>User ID:</label>
                    <asp:Label ID="userIdLabel" runat="server"></asp:Label>
                </div>
                <div>
                    <label>Email:</label>
                    <asp:Label ID="emailLabel" runat="server"></asp:Label>
                </div>
                <div>
                    <label>Category:</label>
                    <asp:Label ID="categoryLabel" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <div class="profile-form">
    <div class="profile-details">
        <div class="field">
            <label>Age:</label>
            <asp:Label ID="ageLabel" runat="server" Text=""></asp:Label>
            <asp:LinkButton ID="addAgeLink" runat="server" OnClick="addAgeLink_Click">Add Age</asp:LinkButton>
            <asp:TextBox ID="ageTextBox" runat="server" CssClass="hidden" TextMode="Number"></asp:TextBox>
            <asp:Button ID="saveAgeButton" runat="server" Text="Save" CssClass="hidden" OnClick="saveAgeButton_Click" />
        </div>
        <div class="field">
            <label>Phone Number:</label>
            <asp:Label ID="phoneLabel" runat="server" Text=""></asp:Label>
            <asp:LinkButton ID="addPhoneLink" runat="server" OnClick="addPhoneLink_Click">Add Phone Number</asp:LinkButton>
            <asp:TextBox ID="phoneTextBox" runat="server" CssClass="hidden"></asp:TextBox>
            <asp:Button ID="savePhoneButton" runat="server" Text="Save" CssClass="hidden" OnClick="savePhoneButton_Click" />
        </div>
        <div class="field">
            <label>Address:</label>
            <asp:Label ID="addressLabel" runat="server" Text=""></asp:Label>
            <asp:LinkButton ID="addAddressLink" runat="server" OnClick="addAddressLink_Click">Add Address</asp:LinkButton>
            <asp:TextBox ID="addressTextBox" runat="server" CssClass="hidden" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="saveAddressButton" runat="server" Text="Save" CssClass="hidden" OnClick="saveAddressButton_Click" />
        </div>
    </div>
</div>


    
    <section>
        <div style="padding:30px;display:grid;
        grid-template-columns: 1fr 1fr 1fr;background: #222;color: white;margin-top:30px">
            <div>
                <h3>About Us</h3>
                <div><br></div>
                <div>
                    ArtVenture is an online marketplace<br>come together to make, sell, buy, and collect unique items
                </div>
                <div>Follow us on Instagram and Facebook</div>
                <div><br></div>
                 <div class="newicons">
                    <a href="https://www.instagram.com/_art_venture/?igshid=MzRlODBiNWFlZA%3D%3D"><i class="bi bi-instagram"></i></a>
                    <a href="https://www.facebook.com/artventure992/"><i class="bi bi-facebook blue-color"></i></a>
                </div>
            </div>
            <div>
                <h3>Contact Us</h3>
                <div><br></div>
                <div>Email: artventurebd@gmail.com</div>
                <div>Phone No: 01********0</div>

            </div>
            <div>
                <h3>Discover</h3>
                <div><br></div>
                <div><a href="#">What's new?</a></div>
            </div>
        </div>
       

    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
