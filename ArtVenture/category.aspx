<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="ArtVenture.category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>ArtVenture</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link
        href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;600&family=Dancing+Script:wght@400;600;700&family=Lobster&family=Roboto+Flex:wght@100;500&family=Roboto:wght@300;500;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="styles/home_style.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div
        style="padding:20px;display:grid;grid-template-columns: 1fr 4.5fr 0.5fr 0.5fr 0.5fr 0.5fr;background-image:url(img/artsy\ \(2\).jfif)">
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
        <div class="icons"><a href="Favourites.aspx" class="heart2"><i class="bx bx-heart"></i></a></div>
        <div class="icons"><i class="bx bx-cart"></i></div>
    </div>

    <section>
        <p style="margin-top:50px;margin-left:5px;text-align: center;font-size: 60px;">
            <b>Categories</b>
        </p>
        <div style="margin-top:50px;display:grid;
        grid-template-columns:1fr 0.8fr 0.8fr 0.8fr 0.8fr 0.8fr 0.8fr 0.8fr 0.8fr">

            <div style="text-align: center;align-self:center;width:1fr;font-size:24px;
            background-image:url(img/bluewave.png);">
                <p>Arts and Crafts,<br>Paintings,<br>Photography</p>
            </div>
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
        <p style="margin-left:30px;margin-top:30px;font-size: 40px;text-decoration: underline;"><b>Find Someting You
                Love</b></p>
        <button class="follow-btn">All Filters</button>
        <div style="margin-top:30px;display:grid;
        grid-template-columns: 1fr 1fr 1fr 1fr">
        </div>
        <div style="margin-top:30px;margin-bottom:30px;display: grid;grid-template-columns: 1fr 1fr 1fr 1fr">
            <div>
                <div class="paint"><a href="pic-detail.html"><img src="img/painting1.avif" style="margin-left: 30px;height:175px;width:210px"></a></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="favorites.html" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/min1.png" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/sculpture1.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting4.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting3.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/min2.jfif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting11.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/sculpture4.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting10.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting8.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting15.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting24.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting19.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/min5.png" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/sculpture2.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting22.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting23.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting19.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting13.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting16.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting20.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/min8.png" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
            <div>
                <div class="paint"><img src="img/painting21.avif" style="margin-left: 30px;height:175px;width:210px"></div>
                <div>
                    <div>
                        <p style="margin-left:30px;font-size: 24px;display: inline-block;">Jonas Wood</p>
                    </div>
                    <p style="display: inline-block;margin-left:30px;color:gray;font-family:'Times New Roman', Times, serif;
                font-size: 14px;">
                        Landscape plant pot</p>
                </div>
                <div style="margin-left: 30px;"><i class="bx bx-star"></i></div>
                <div style="margin-left: 30px;">$12,000</div>
                <div>
                    <div style="display: grid;grid-template-columns: 2.5fr 1fr;">
                        <div> <button class="follow-btn">Add to Cart</button></div>
                        <div><a href="#" class="heart"><i class="bx bx-heart"></i></a></div>
                    </div>
                 </div>
            </div>
           
    </section>
    <section>
        <p style="font-size: 36px;font-weight: bold;margin-left: 30px;text-decoration: underline;
        margin-bottom: 20px;">There's more to discover</p>
        <div class= "page-div"style="display: grid;grid-template-columns:  40px 40px 40px 40px 40px;
        margin-left:30px">
        <div><button class="page-btn"><i class=" bx bxs-arrow-from-right"></i></button></div>
        <div><button class="page-btn">1</button></div>
        <div><button class="page-btn">2</button></div>
        <div><button class="page-btn">..</button></div>
        <div><button class="page-btn"><i class=" bx bxs-arrow-from-left"></i></button></div>
        </div>
    </section>
    <hr style="margin-top:80px">
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
