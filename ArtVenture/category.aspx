<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" EnableEventValidation="false" Inherits="ArtVenture.category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ArtVenture</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"> 
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;600&family=Dancing+Script:wght@400;600;700&family=Lobster&family=Roboto+Flex:wght@100;500&family=Roboto:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/home_style.css">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding: 20px; display: grid; grid-template-columns: 1fr 2.5fr 0.5fr 0.5fr 0.5fr 0.5fr 0.5fr; background-image: url(img/artsy\ \(2\).jfif)">
        <div class="site-name" style="margin-right:30px">ArtVenture</div>
        <div class="container" style="align-items:center;justify-content:center">
          <input id="searchInput" type="text" placeholder="Search by name,category etc." runat="server">
            <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" CssClass="small-button" />

</div>

        <div class="icons"><a href="Home.aspx"><i class="bx bx-home"></i></a></div>
    <div class="icons"><a href="category.aspx"><i class="bx bx-palette"></i></a></div>
    <div class="icons"><a href="Wishlist.aspx"><i class="bx bx-heart"></i></a></div>
    <div class="icons"><a href="Cart.aspx"><i class="bx bx-cart"></i></a></div>
    </div>


    <div class="container" style="text-align: center; display: flex; justify-content: center; align-items: center;"">
    <div style="width: 80%; margin: 20px auto;">
        <asp:GridView ID="searchResultsGridView" runat="server" AutoGenerateColumns="false" Visible="false">
            <Columns>
                <asp:ImageField DataImageUrlField="Img" HeaderText="Image" ControlStyle-Width="100" ControlStyle-Height="100" />
                <asp:BoundField DataField="Img_name" HeaderText="Image Name" />
                <asp:BoundField DataField="Img_price" HeaderText="Price($)" />
                <asp:BoundField DataField="Img_type" HeaderText="Category" />
                 <asp:BoundField DataField="Img_medium" HeaderText="Medium" />
                 <asp:BoundField DataField="Img_frame" HeaderText="Frame(inch)" />
            </Columns>
        </asp:GridView>
    </div>
</div>




    <section style="margin-left:30px">
        <p style="margin-left: 30px; margin-top: 30px; font-size: 40px; text-decoration: underline;"><b>Find Something You Love</b></p>

         <%-- Sculpture Section --%>
         <section>
    <h1 style="text-align: center; font-size: 28px; margin: 15px">Sculpture</h1>
    <div id="sculptureContainer" runat="server" style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr">
        <asp:Repeater ID="SculptureRepeater" runat="server">
            <ItemTemplate>
                <div>
                    <a href='<%# "PicDetail.aspx?Img_id=" + Eval("Img_id") %>'>
                        <asp:Image ID="SculptureImage" runat="server" Height="175px" Width="210px" ImageUrl='<%# Eval("Img") %>' />
                    </a>
                    <div>
                        <p style="font-size: 24px; display: inline-block; color: gray; font-family: 'Times New Roman', Times, serif"><%# Eval("Img_name") %></p>
                    </div>
                    <div>$<%# Eval("Img_price") %></div>
                    <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Cart" onClick="AddtoCartButton_Click" CommandArgument ='<%# Eval("Img_id") %>' />
                            </div>
                    <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Wishlist" onClick="FavoriteButton_Click"  CommandArgument='<%# Eval("Img_id") %>' />
                            </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</section>



            <%-- Painting Section --%>
        <section>
    <h1 style="text-align: center; font-size: 28px; margin: 15px">Painting</h1>
    <div id="paintingContainer" runat="server" style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr">
        <asp:Repeater ID="PaintingRepeater" runat="server">
            <ItemTemplate>
                <div>
                    <a href='<%# "PicDetail.aspx?Img_id=" + Eval("Img_id") %>'>
                        <asp:Image ID="PaintingImage" runat="server" Height="175px" Width="210px" ImageUrl='<%# Eval("Img") %>' />
                    </a>
                    <div>
                        <p style="font-size: 24px; display: inline-block; color: gray; font-family: 'Times New Roman', Times, serif"><%# Eval("Img_name") %></p>
                    </div>
                    <div>$<%# Eval("Img_price") %></div>
                   <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Cart" onClick="AddtoCartButton_Click" CommandArgument ='<%# Eval("Img_id") %>' />
                            </div>
                    <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Wishlist" onClick="FavoriteButton_Click"  CommandArgument='<%# Eval("Img_id") %>' />
                            </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</section>

            <%-- Photography Section --%>
        <section>
    <h1 style="text-align: center; font-size: 28px; margin: 15px">Photography</h1>
    <div id="photographyContainer" runat="server" style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr">
        <asp:Repeater ID="PhotographyRepeater" runat="server">
            <ItemTemplate>
                <div>
                    <a href='<%# "PicDetail.aspx?Img_id=" + Eval("Img_id") %>'>
                        <asp:Image ID="PhotographyImage" runat="server" Height="175px" Width="210px" ImageUrl='<%# Eval("Img") %>' />
                    </a>
                    <div>
                        <p style="font-size: 24px; display: inline-block; color: gray; font-family: 'Times New Roman', Times, serif"><%# Eval("Img_name") %></p>
                    </div>
                    <div>$<%# Eval("Img_price") %></div>
                     <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Cart" onClick="AddtoCartButton_Click"  CommandArgument ='<%# Eval("Img_id") %>' />
                            </div>
                    <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Wishlist" onClick="FavoriteButton_Click"  CommandArgument='<%# Eval("Img_id") %>' />
                            </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</section>

             <%-- Fiber Art Section --%>
         <section>
    <h1 style="text-align: center; font-size: 28px; margin: 15px">Fiber Art</h1>
    <div id="fiberContainer" runat="server" style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr">
        <asp:Repeater ID="FiberRepeater" runat="server">
            <ItemTemplate>
                <div>
                   <a href='<%# "PicDetail.aspx?Img_id=" + Eval("Img_id") %>'>
                        <asp:Image ID="FiberImage" runat="server" Height="175px" Width="210px" ImageUrl='<%# Eval("Img") %>' />
                    </a>
                    <div>
                        <p style="font-size: 24px; display: inline-block; color: gray; font-family: 'Times New Roman', Times, serif"><%# Eval("Img_name") %></p>
                    </div>
                    <div>$<%# Eval("Img_price") %></div>
                   <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Cart" onClick="AddtoCartButton_Click"  CommandArgument ='<%# Eval("Img_id") %>' />
                            </div>
                    <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Wishlist" onClick="FavoriteButton_Click"  CommandArgument='<%# Eval("Img_id") %>' />
                            </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</section>

             <%-- Glass art Section --%>
        <section>
    <h1 style="text-align: center; font-size: 28px; margin: 15px">Glass Art</h1>
    <div id="glassContainer" runat="server" style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr">
        <asp:Repeater ID="GlassRepeater" runat="server">
            <ItemTemplate>
                <div>
                   <a href='<%# "PicDetail.aspx?Img_id=" + Eval("Img_id") %>'>
                        <asp:Image ID="GlassImage" runat="server" Height="175px" Width="210px" ImageUrl='<%# Eval("Img") %>' />
                    </a>
                    <div>
                        <p style="font-size: 24px; display: inline-block; color: gray; font-family: 'Times New Roman', Times, serif"><%# Eval("Img_name") %></p>
                    </div>
                    <div>$<%# Eval("Img_price") %></div>
                    <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Cart" onClick="AddtoCartButton_Click"  CommandArgument ='<%# Eval("Img_id") %>' />
                            </div>
                    <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Wishlist" onClick="FavoriteButton_Click"  CommandArgument='<%# Eval("Img_id") %>' />
                            </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</section>

             <%-- Drawing and Illustrations Section --%>
        <section>
    <h1 style="text-align: center; font-size: 28px; margin: 15px">Drawing and Illustrations</h1>
    <div id="drawingContainer" runat="server" style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr">
        <asp:Repeater ID="DrawingRepeater" runat="server">
            <ItemTemplate>
                <div>
                   <a href='<%# "PicDetail.aspx?Img_id=" + Eval("Img_id") %>'>
                        <asp:Image ID="DrawingImage" runat="server" Height="175px" Width="210px" ImageUrl='<%# Eval("Img") %>' />
                    </a>
                    <div>
                        <p style="font-size: 24px; display: inline-block; color: gray; font-family: 'Times New Roman', Times, serif"><%# Eval("Img_name") %></p>
                    </div>
                    <div>$<%# Eval("Img_price") %></div>
                   <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Cart" onClick="AddtoCartButton_Click"  CommandArgument ='<%# Eval("Img_id") %>' />
                            </div>
                    <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Wishlist" onClick="FavoriteButton_Click"  CommandArgument='<%# Eval("Img_id") %>' />
                            </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</section>

             <%-- Miniature Section --%>
         <section>
    <h1 style="text-align: center; font-size: 28px; margin: 15px">Miniature</h1>
    <div id="miniatureContainer" runat="server" style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr">
        <asp:Repeater ID="MiniatureRepeater" runat="server">
            <ItemTemplate>
                <div>
                   <a href='<%# "PicDetail.aspx?Img_id=" + Eval("Img_id") %>'>
                        <asp:Image ID="MiniatureImage" runat="server" Height="175px" Width="210px" ImageUrl='<%# Eval("Img") %>' />
                    </a>
                    <div>
                        <p style="font-size: 24px; display: inline-block; color: gray; font-family: 'Times New Roman', Times, serif"><%# Eval("Img_name") %></p>
                    </div>
                    <div>$<%# Eval("Img_price") %></div>
                    <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Cart" onClick="AddtoCartButton_Click"  CommandArgument ='<%# Eval("Img_id") %>' />
                            </div>
                    <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Wishlist" onClick="FavoriteButton_Click"  CommandArgument='<%# Eval("Img_id") %>' />
                            </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</section>

             <%-- Prints Section --%>
        <section>
    <h1 style="text-align: center; font-size: 28px; margin: 15px">Prints</h1>
    <div id="printContainer" runat="server" style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr">
        <asp:Repeater ID="PrintRepeater" runat="server">
            <ItemTemplate>
                <div>
                   <a href='<%# "PicDetail.aspx?Img_id=" + Eval("Img_id") %>'>
                        <asp:Image ID="PrintImage" runat="server" Height="175px" Width="210px" ImageUrl='<%# Eval("Img") %>' />
                    </a>
                    <div>
                        <p style="font-size: 24px; display: inline-block; color: gray; font-family: 'Times New Roman', Times, serif"><%# Eval("Img_name") %></p>
                    </div>
                    <div>$<%# Eval("Img_price") %></div>
                    <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Cart" onClick="AddtoCartButton_Click"  CommandArgument ='<%# Eval("Img_id") %>' />
                            </div>
                    <div>
                      <asp:Button runat="server" CssClass="follow-btn" Text="Add to Wishlist" onClick="FavoriteButton_Click"  CommandArgument='<%# Eval("Img_id") %>' />
                            </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</section>

    </section>

    <hr style="margin-top: 80px">

    <section style="background-color: black; color: white;">
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
