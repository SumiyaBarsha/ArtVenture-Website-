<%@ Page Title="HomePage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" EnableEventValidation="false" Inherits="ArtVenture.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>ArtVenture</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link
        href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;600&family=Dancing+Script:wght@400;600;700&family=Lobster&family=Roboto+Flex:wght@100;500&family=Roboto:wght@300;500;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="styles/home_style.css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <header class="header-content">
        <div style="margin-top:30px;display:grid;
    grid-template-columns: 190px  30px 700px 120px 120px">
            <div>
                <h2 class="site-name">ArtVenture</h2>
            </div>
            <div><img class="icon" src="img/palette(1).png" style="height:20px;width:30px;"></div>
            <div>
                <div class="container">
                    <form action="">
                        <input class="search-bar" type="text" placeholder="Search by artist,gallery,color etc.">
                        <button class="search-icon" type="submit"><img src="img/search.png"
                                style="height:30px;width:28px"></button>
                    </form>
                </div>
            </div>
           <div> <asp:Button ID="Signup_btn" runat="server" Text="SIGN UP" CssClass="signup-button" OnClick="Signup_btn_Click" /></div>
          <div> <asp:Button ID="Login_btn" runat="server" Text="LOG IN" CssClass="login-button" OnClick="Login_btn_Click" /></div>

            <div></div>
            <div></div>
            <div>
                <p style="text-align: center;font-size: 60px;font-family:'Dancing Script',cursive;color:aliceblue;">Dive Into Fantasy</p>
            </div>
        </div>

    </header>

    <section>
        <div class="dropdown-menu">
            <ul>
                <li class="active"><a href="Home.aspx">Home </a> </li>
                <li><a href="Category.aspx">Artworks</a>
                </li>
                <li><a href="Cart.aspx">My Cart</a></li>
                <li><a href="Favourites.aspx">Favourites</a></li>
                <li><a href="#">Settings</a>
                    <div class="artwork-menu">
                        <ul>
                            <li><a href="#">My Profile</a></li>
                            <li><a href="#">My Orders</a></li>
                        </ul>

                    </div>
                </li>
            </ul>
        </div>
    </section>

    <section>
        <p style="margin-top:80px;margin-left:30px;text-align: center;font-size: 60px;">
            <b>Categories</b>
        </p>
        <div style="margin-top:50px;display:grid;grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr">
            <div><img class="category" src="img/Piece for Peace Sculpture.jfif">
                <p class="category-name"><a href="#">Sculpture</a></p>
            </div>
            <div><img class="category" src="img/clearwater.jpg">
                <p class="category-name"><a href="#">Painting</a></p>
            </div>
            <div><img class="category" src="img/garden3.jfif">
                <p class="category-name"><a href="#">Prints</a></p>
            </div>
            <div><img class="category" src="img/Ronnie Hughes - Piedmont Craftsmen.jfif">
                <p class="category-name"><a href="#">Glass Art</a></p>
            </div>
            <div><img class="category" src="img/illustration.png">
                <p class="category-name"><a href="#">Drawing and Illustration</a></p>
            </div>
            <div><img class="category" src="img/Photography.jfif">
                <p class="category-name"><a href="#">Photography</a></p>
            </div>
            <div><img class="category" src="img/Embroidery.jfif">
                <p class="category-name"><a href="#">Fiber Arts</a></p>
            </div>
            <div><img class="category" src="img/Dollhouse Miniature.jfif">
                <p class="category-name"><a href="#">Miniature</a></p>
            </div>
        </div>


    </section>

    <section>
        <p style="margin-top:50px;text-align: center;font-size: 60px;"><b>Featured</b></p>
        <div style="margin-top:30px;display:grid;
    grid-template-columns: 1fr 1fr 1fr 1fr">
            <div style="margin-left: 40px;">
                <div><img src="img/fair1.webp" style="height:200px;width:250px"></div>
                <div>
                    <h5>Featured Fair</h5>
                </div>
                <div>
                    <h2>Art Fair Tokyo 2023</h2>
                </div>
            </div>
            <div style="margin-left: 40px;">
                <div><img src="img/fair2.webp" style="height:200px;width:250px"></div>
                <div>
                    <h5>Featured Fair</h5>
                </div>
                <div>
                    <h2>Collect 2023</h2>
                </div>
            </div>
        </div>


    </section>
    <section>
        <p style="margin-top:80px;margin-left:30px;text-align: left;font-size: 40px;">
            <b>Curator's Picks:Emerging</b>
        </p>
        <div style="margin-top:8px;display:grid;grid-template-columns: 1fr 1fr">
            <div style="margin-left: 30px;font-size: 20px;color:cadetblue">The best works by rising talents on
                ArtVenture,
                all available now.</div>
            <div style="text-align: end;padding:10px">
                <a href="#" style="text-decoration-color: cadetblue;color:cadetblue">
                    view all works</a>
            </div>
        </div>
        <div style="margin-left: 40px;">
            <div><img src="img/fair1.webp" style="height:200px;width:250px"></div>
            <div>
                <h5>Featured Fair</h5>
            </div>
            <div>
                <h2>Art Fair Tokyo 2023</h2>
            </div>
        </div>
        <div style="margin-left: 40px;">
            <div><img src="img/fair2.webp" style="height:200px;width:250px"></div>
            <div>
                <h5>Featured Fair</h5>
            </div>
            <div>
                <h2>Collect 2023</h2>
            </div>
        </div>


    </section>

    <hr style="margin-top:80px">
    <section>
        <div style="margin-top:80px;display:grid;grid-template-columns: 1fr 1fr">
            <div style="margin-left: 30px;font-size: 40px;">
                Trending Artists on ArtVenture</div>
            <div style="text-align: end;padding:10px">
                <a href="#" style="text-decoration-color: cadetblue;color:cadetblue">
                    view all artists</a>
            </div>
        </div>
        <div style="margin-top:30px;margin-bottom:30px;display: grid;grid-template-columns: 1fr 1fr 1fr">
            <div>
                <div><img src="img/artist1.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Luke Edward Hall</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        American,b.1991</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
            </div>
            <div>
                <div><img src="img/artist2.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Luke Edward Hall</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        American,b.1991</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
            </div>
            <div>
                <div><img src="img/artist3.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Luke Edward Hall</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        American,b.1991</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
            </div>
            <div>
                <div><img src="img/artist4.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Luke Edward Hall</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        American,b.1991</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
            </div>
            <div>
                <div><img src="img/artist5.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Luke Edward Hall</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        American,b.1991</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
            </div>
            <div>
                <div><img src="img/artist6.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Luke Edward Hall</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        American,b.1991</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
            </div>
            <div>
                <div><img src="img/artist7.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Luke Edward Hall</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        American,b.1991</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
            </div>
             </div>


    </section>

    <hr style="margin-top:80px">
    <section>
        <div style="margin-top:80px;display:grid;grid-template-columns: 1fr 1fr">
            <div style="margin-left: 30px;font-size: 40px;">
                Auction Lots</div>
            <div style="text-align: end;padding:10px">
                <a href="#" style="text-decoration-color: cadetblue;color:cadetblue">
                    view all auctions</a>
            </div>
        </div>
        <div style="margin-top:30px;margin-bottom:30px;display: grid;grid-template-columns: 1fr 1fr 1fr 1fr">
            <div>
                <div><img src="img/auction1.webp" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;">$12,000</div>
                <div> <button class="follow-btn">Get Details</button></div>
            </div>
            <div>
                <div><img src="img/auction2.webp" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Banksy</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        Bomb Hunger,2003</p>
                </div>
                <div style="margin-left: 30px;">$18,000</div>
                <div> <button class="follow-btn">Get Details</button></div>
            </div>
            <div>
                <div><img src="img/auction3.webp" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Arnaldo Pomodoro</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        Le Coffret,1981</p>
                </div>
                <div style="margin-left: 30px;">$1,300</div>
                <div> <button class="follow-btn">Get Details</button></div>
            </div>
            <div>
                <div><img src="img/auction4.webp" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Yoshimoto Nara</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        Cosmic Girl</p>
                </div>
                <div style="margin-left: 30px;">$6,500</div>
                <div> <button class="follow-btn">Get Details</button></div>
            </div>
            <div>
                <div><img src="img/auction5.webp" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Luke Edward Hall</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        American,b.1991</p>
                </div>
                <div style="margin-left: 30px;">$12,000</div>
                <div> <button class="follow-btn">Get Details</button></div>
            </div>
            <div>
                <div><img src="img/auction6.webp" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Luke Edward Hall</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        American,b.1991</p>
                </div>
                <div style="margin-left: 30px;">$12,000</div>
                <div> <button class="follow-btn">Get Details</button></div>
            </div>
            <div>
                <div><img src="img/auction7.webp" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Luke Edward Hall</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        American,b.1991</p>
                </div>
                <div style="margin-left: 30px;">$12,000</div>
                <div> <button class="follow-btn">Get Details</button></div>
            </div>
            <div>
                <div><img src="img/auction8.webp" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Luke Edward Hall</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        American,b.1991</p>
                </div>
                <div style="margin-left: 30px;">$12,000</div>
                <div> <button class="follow-btn">Get Details</button></div>
            </div>
            <div>
                <div><img src="img/auction9.webp" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Luke Edward Hall</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        American,b.1991</p>
                </div>
                <div style="margin-left: 30px;">$12,000</div>
                <div> <button class="follow-btn">Get Details</button></div>
            </div>
             </div>


    </section>


    <hr style="margin-top:80px">
    <section>
        <div style="margin-top:80px;display:grid;grid-template-columns: 1fr 1fr">
            <div style="margin-left: 30px;font-size: 40px;">
                Featured Galleries</div>
            <div style="text-align: end;padding:10px">
                <a href="#" style="text-decoration-color: cadetblue;color:cadetblue">
                    view all galleries</a>
            </div>
        </div>
        <div style="margin-top:30px;margin-bottom:30px;display: grid;grid-template-columns: 1fr 1fr 1fr">
            <div>
                <div><img src="img/gallery1.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">S&P Gallery</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        London</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
            </div>
            <div>
                <div><img src="img/gallery2.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Verdyun</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        Moregem</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
            </div>
            <div>
                <div><img src="img/gallery3.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Litvak Contemporary</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        Tel-Aviv</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
            </div>
            <div>
                <div><img src="img/gallery4.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Modern Rocks Gallery</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        Austin</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
            </div>
            <div>
                <div><img src="img/gallery5.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Michael Hoppen Gallery</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        London</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
            </div>
            <div>
                <div><img src="img/gallery6.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Liss Llewellyn</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        London</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
            </div>
            <div>
                <div><img src="img/gallery7.webp" style="margin-left: 30px;height:300px;width:350px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Galerie Fischer</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                    font-size: 14px;">
                        Lucerne</p>
                </div>
                <div> <button class="follow-btn">Follow</button></div>
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
        grid-template-columns: 1fr 1fr 1fr 1fr;background: #222;color: white;">
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
