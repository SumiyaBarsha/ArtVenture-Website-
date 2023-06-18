<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PicDetail.aspx.cs" Inherits="ArtVenture.PicDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>ArtVenture|Favourites</title>
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true">
     <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
     <link
         href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;600&family=Dancing+Script:wght@400;600;700&family=Lobster&family=Roboto+Flex:wght@100;500&family=Roboto:wght@300;500;700&display=swap"
         rel="stylesheet">
     <link rel="stylesheet" href="styles/home_style.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div
    style="padding:20px;display:grid;grid-template-columns: 1fr 4fr 0.5fr 0.5fr 0.5fr 0.5fr;background-image:url(img/artsy\ \(2\).jfif)">
    <div class="site-name">ArtVenture</div>
    <div class="container">
        <form action="">
            <input class="search-bar" type="text" placeholder="Search by artist,gallery,color etc.">
            <button class="search-icon" type="submit"><img src="img/search.png"
                    style="height:30px;width:28px"></button>
        </form>
    </div>
    <div class="icons"><a href="Home.aspx" class="heart2"><i class="bx bx-home"></i></a></div>
    <div class="icons"><i class="bx bx-user"></i></div>
    <div class="icons"><i class="bx bx-heart"></i></div>
    <div class="icons"><i class="bx bx-cart"></i></div>
</div>
<section>
    <p style="margin-left:30px;margin-top:30px;font-size: 40px;text-align: left;">
        <b>Picture Details</b>
    </p>
    <div style="margin-top:30px;margin-bottom:30px;display: grid;grid-template-columns: 1fr 1fr">
        <div>
            <div class="paint"><img src="img/painting1.avif" style="margin-left: 30px;height:275px;width:310px">
            </div>
            <div>
                <div>
                    <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                </div>
                <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
            font-size: 14px;">
                    Landscape plant pot</p>
            </div>
        </div>
        <div>
            <p style="font-size: 36px;text-decoration: underline;">Image Description</p>
            <div class="desc">Price:$12,000</div>
            <div class="desc">Medium:Oil</div>
            <div class="desc">Frame Size:
                <asp:DropDownList ID="ddlFrameSize" runat="server">
                    <asp:ListItem Text="6&quot;X6&quot;" Value="6X6"></asp:ListItem>
                    <asp:ListItem Text="8&quot;X8&quot;" Value="8X8"></asp:ListItem>
                    <asp:ListItem Text="12&quot;X14&quot;" Value="12X14"></asp:ListItem>
                    <asp:ListItem Text="16&quot;X8&quot;" Value="16X8"></asp:ListItem>
                    <asp:ListItem Text="10&quot;X8&quot;" Value="10X8"></asp:ListItem>
                    <asp:ListItem Text="24&quot;X20&quot;" Value="24X20"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                Description:<br />
                100% hand-painted original flower oil painting, red cherry blossoms in full bloom on canvas, large mountain abstract painting party, clear lake, lake reflection, fashionable wall decorative artwork, handmade home decor, original hand-painted texture canvas mural,
                accept custom photo oil painting, Christmas gift, New Year gift, housewarming gift.
            </div>
            <div>
                <button class="follow-btn" style="margin-top: 10px;margin-left: 0;">Add to Cart</button>
                <button class="follow-btn" style="margin-top: 10px;margin-left: 0;">Buy Now</button>
            </div>
        </div>
    </div>
</section>
<hr style="margin-top:80px" />
<section style="background-color: black;color: white;">
    <div style="padding:30px;display:grid;
    grid-template-columns: 1fr 1fr 1fr 1fr">
        <div>About Us</div>
        <div>Support</div>
        <div>Discover</div>
        <div>
            <div>Languages</div>
            <div>Countries</div>
        </div>
    </div>
</section>

</asp:Content>
