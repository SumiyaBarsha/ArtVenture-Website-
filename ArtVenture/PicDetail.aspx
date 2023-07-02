<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PicDetail.aspx.cs" Inherits="ArtVenture.PicDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>ArtVenture|Favourites</title>
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true">
     <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"> 
     <link
         href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;600&family=Dancing+Script:wght@400;600;700&family=Lobster&family=Roboto+Flex:wght@100;500&family=Roboto:wght@300;500;700&display=swap"
         rel="stylesheet">
     <link rel="stylesheet" href="styles/detail_style.css">
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
<section>
    <p style="margin:20px;font-size: 40px;text-align: left;">
        <b>Picture Details</b>
    </p>
   
        <div style="display:grid;grid-template-columns:1fr 1fr;margin:20px">
            <div class="left">
                <div>
                    
                    <asp:Image ID="DetailImage" runat="server" Width="230" Height="200" />
                    <br />
                    <asp:Label ID="ImageNameLabel" runat="server"></asp:Label>
                </div>
                </div>
            <div class="right">
                    <h2>Details</h2>
                <br />
                    <table>
                        <tr>
                            <td>Price: $</td>
                            <td><asp:Label ID="PriceLabel" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Category:</td>
                            <td><asp:Label ID="CategoryLabel" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Frame:</td>
                            <td><asp:Label ID="FrameLabel" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Medium:</td>
                            <td><asp:Label ID="MediumLabel" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Description:</td>
                            <td><asp:Label ID="DescriptionLabel" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="AddToCartButton" runat="server" Text="Add to Cart" CssClass="follow-btn" OnClick="AddToCartButton_Click" />
                    <br />
                </div>
            </div>
</section>


                 <hr style="margin-top:80px" />
     <section style="background-color: black;color: white;">
    <div style="padding:30px;display:grid;
        grid-template-columns: 1fr 1fr 1fr;background: #222;color: white;">
            <div>
                <h3>About Us</h3>
                <div><br></div>
                <div>
                    ArtVenture is an online marketplace<br>come together to make, sell, buy, and collect unique items
                </div>
                <div>Follow us on Instagram and Facebook</div>
                <div><br></div>
                <div>
                    <a href="https://www.instagram.com/_art_venture/?igshid=MzRlODBiNWFlZA%3D%3D"><i class="bi bi-instagram"></i></a>
                    <a href="https://www.facebook.com/artventure992/"><span class="bi bi-facebook blue-color"></span></a>
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
