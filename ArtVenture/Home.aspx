<%@ Page Title="HomePage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" EnableEventValidation="false" Inherits="ArtVenture.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>ArtVenture</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"> 
    <link
        href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;600&family=Dancing+Script:wght@400;600;700&family=Lobster&family=Roboto+Flex:wght@100;500&family=Roboto:wght@300;500;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="styles/home_style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <header class="header-content">
        <div style="margin-top:30px;display:grid;
    grid-template-columns: 190px  30px 700px 120px 120px">
            <div>
                <h2 class="site-name">ArtVenture</h2>
            </div>
            <div></div>
            <div>
                
            </div>
           <div> <asp:Button ID="Signup_btn" runat="server" Text="SIGN UP" CssClass="signup-button"  OnClick="Signup_btn_Click" /></div>
          <div> <asp:Button ID="Login_btn" runat="server" Text="LOG IN" CssClass="login-button" OnClick="Login_btn_Click" OnCommand="Button_Command" CommandName="Toggle_Log" /></div>

            <div></div>
            <div></div>
            <div>
                <p style="text-align: center;font-size: 60px;font-family:'Dancing Script',cursive;color:aliceblue;">Dive Into Fantasy</p>
            </div>
        </div>

    </header>

   <section>
    <div class="menu-container">
        <asp:Menu ID="MainMenu" runat="server" CssClass="dropdown-menu" OnMenuItemClick="menu_MenuItemClick">
    <StaticSelectedStyle CssClass="selected" />
    <StaticMenuItemStyle CssClass="menu-item" />
    <StaticHoverStyle CssClass="hover" />
    <DynamicHoverStyle CssClass="hover" />
    <DynamicMenuStyle CssClass="submenu" />

    <Items>
        <asp:MenuItem Text='<i class="fas fa-home"></i> Home' NavigateUrl="~/Home.aspx" Selected="true" />
        <asp:MenuItem Text='<i class="fas fa-palette"></i> Artworks' NavigateUrl="~/Category.aspx" />
        <asp:MenuItem Text='<i class="fas fa-shopping-cart"></i> My Cart' NavigateUrl="~/Cart.aspx" />
        <asp:MenuItem Text='<i class="fas fa-heart"></i> Favorites' NavigateUrl="~/Wishlist.aspx" />
        <asp:MenuItem Text='<i class="fas fa-cog"></i> Settings'>
            <asp:MenuItem Text='<i class="fas fa-user"></i> My Profile'  Value="MyProfile"/>
            <asp:MenuItem Text='<i class="fas fa-list-alt"></i> My Orders' Value="MyOrders" />
        </asp:MenuItem>
    </Items>
</asp:Menu>
    </div>


</section>

    <section>
        <p style="margin-top:80px;margin-left:30px;text-align: center;font-size: 60px;">
            <b>Categories</b>
        </p>
        <div style="margin-top:50px;display:grid;grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr">
            <div><img class="category" src="img/peace.jfif">
                <p class="category-name">Sculpture</p>
            </div>
            <div><img class="category" src="img/clearwater.jpg">
                <p class="category-name">Painting</p>
            </div>
            <div><img class="category" src="img/garden3.jfif">
                <p class="category-name">Prints</p>
            </div>
            <div><img class="category" src="img/glassflower.jfif">
                <p class="category-name">Glass Art</p>
            </div>
            <div><img class="category" src="img/illustration.png">
                <p class="category-name">Drawing and Illustration</p>
            </div>
            <div><img class="category" src="img/Photography.jfif">
                <p class="category-name">Photography</p>
            </div>
            <div><img class="category" src="img/Embroidery.jfif">
                <p class="category-name">Fiber Arts</p>
            </div>
            <div><img class="category" src="img/min4.png">
                <p class="category-name">Miniature</p>
            </div>
        </div>


    </section>

    <section>
        <p style="margin-top:50px;text-align: center;font-size: 60px;"><b>Featured</b></p>
        <div style="margin-top:30px;display:grid;
    grid-template-columns: 1fr 1fr 1fr 1fr">
            <div style="margin-left: 40px;">
                <div><a href="https://metropolisjapan.com/event/art-fair-tokyo-2023/"><img src="img/Fair2.jpg" style="height:200px;width:250px" /></a></div>
                <div>
                    <h5>Featured Fair</h5>
                </div>
                <div>
                    <h2>Art Fair Tokyo 2023</h2>
                </div>
            </div>
            <div style="margin-left: 40px;">
                <div><a href="https://www.somersethouse.org.uk/whats-on/collect-2023"><img src="img/Fair1.jpg" style="height:200px;width:250px" /></a></div>
                <div>
                    <h5>Featured Fair</h5>
                </div>
                <div>
                    <h2>Collect 2023</h2>
                </div>
            </div>
        </div>


    </section>

   


    <hr style="margin-top:80px">
    <section>
            <div style="margin-left: 30px;margin-top:30px;font-size: 40px;">
                Featured Galleries</div>
        <div style="margin-top:30px;margin-bottom:30px;display: grid;grid-template-columns: 1fr 1fr 1fr">
            <div>
                <div><img src="img/Louvre.jpeg" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Louvre Museum</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        Paris, France</p>
                </div>
                 <div><asp:Button  style="margin-left:30px" runat="server" Text="Follow" CssClass="follow-btn" PostBackUrl="https://www.louvre.fr/en" /></div>
            </div> 
            <div>
                <div><img src="img/Moma.jpeg" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Museum of Modern Art (MoMA)</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        New York, USA</p>
                </div>
                <div><asp:Button  style="margin-left:30px" runat="server" Text="Follow" CssClass="follow-btn" PostBackUrl="https://www.moma.org" /></div>
            </div>
            <div>
                <div><img src="img/MuséeMarmottanMonet.jpg" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Musée Marmottan Monet</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        London</p>
                </div>
                <div><asp:Button  style="margin-left:30px" runat="server" Text="Follow" CssClass="follow-btn" PostBackUrl="https://www.marmottan.fr/en/" /></div>
            </div>
            <div>
                <div><img src="img/tate.jpeg" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Tate Modern</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                       London, UK</p>
                </div>
                <div><asp:Button  style="margin-left:30px" runat="server" Text="Follow" CssClass="follow-btn" PostBackUrl=" https://www.tate.org.uk/visit/tate-modern" /></div>
            </div>
            <div>
                <div><img src="img/MuseumofFineArtsBoston.jpg" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Uffizi Gallery</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        Florence, Italy</p>
                </div>
                 <div><asp:Button  style="margin-left:30px" runat="server" Text="Follow" CssClass="follow-btn" PostBackUrl=" https://www.uffizi.it/en" /></div>
            </div>
             </div>

    </section>

    <hr style="margin-top:80px">
    <section>
        <div style="margin:30px auto;display:grid;grid-template-columns: 1fr 3fr">
            <div class="get-app">
                <div style="font-size: 30px;">Get ArtVenture App</div>
                <div><button class="follow-btn">Download on App store</button></div>
                <div><button class="follow-btn">Google Play</button></div>
            </div>
            <div>
                <img src="img/garden3.jfif" style="margin:30px;width:800px">
            </div>
             </div>
    </section>
    <hr style="margin-top:80px">
    <section>
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
                    <a href="https://www.facebook.com/artventure992/"><i class="bi bi-facebook"></i></a>
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
