<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="ArtVenture.Wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <title>ArtVenture|Cart</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link
        href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;600&family=Dancing+Script:wght@400;600;700&family=Lobster&family=Roboto+Flex:wght@100;500&family=Roboto:wght@300;500;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"> 
<link href="styles/wishlist_style.css" rel="stylesheet" />
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


   <div class="wishlist-container">
        <h2 class="wishlist-header" style="font-size:28px;color:darkblue">My Wishlist</h2>
        <asp:Repeater ID="wishlistRepeater" runat="server" OnItemDataBound="wishlistRepeater_ItemDataBound">
            <ItemTemplate>
                <div class="wishlist-item">
                    <div class="wishlist-item-image">
                        <asp:Image ID="productImage" runat="server" CssClass="wishlist-item-image" ImageUrl="img/Shoppingbag.jpg" />

                    </div>
                    <div class="wishlist-item-details">
                        <h4 class="wishlist-item-title"><%# Eval("ProductName") %></h4>
                        <p class="wishlist-item-price">$<%# Eval("Price") %></p>
                       
                    </div>
                    <div>
                         <asp:Button ID="deleteButton" runat="server" Text="Remove" OnClick="DeleteButton_Click" CssClass="wishlist-item-remove"  CommandArgument='<%# Eval("ItemId") %>'  />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Label ID="messageLabel" runat="server" CssClass="wishlist-message" Visible="false"></asp:Label>
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
