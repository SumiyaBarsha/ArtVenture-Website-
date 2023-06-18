<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ArtVenture.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <title>ArtVenture|Cart</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link
        href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;600&family=Dancing+Script:wght@400;600;700&family=Lobster&family=Roboto+Flex:wght@100;500&family=Roboto:wght@300;500;700&display=swap"
        rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles/cart_style.css">
     <link rel="stylesheet" href="styles/home_style.css">
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
     <header class="header-content">
         <div
        style="padding:20px;display:grid;width:100%;grid-template-columns: 1fr 0.5fr 0.5fr 0.5fr;background-image:url(img/artsy\ \(2\).jfif)">
        <div class="site-name">ArtVenture</div>
        <div class="icons"><a href="Home.aspx" class="heart2"><i class="bx bx-home"></i></a></div>
        <div class="icons"><i class="bx bx-user"></i></div>
        <div class="icons"><a href="Favourites.aspx" class="heart2"><i class="bx bx-heart"></i></a></div>
        <div class="icons"><i class="bx bx-cart"></i></div>
    </div>

    </header>
    
    <div class="container">
    <h1>Shopping Cart</h1>
    <div class="cart-item">
      <div class="row">
        <div class="col-md-2">
          <img src="product-image1.jpg" alt="Product Image" class="product-image">
        </div>
        <div class="col-md-4">
          <h3 class="product-title">Product 1</h3>
          <p class="product-price">$99.99</p>
        </div>
        <div class="col-md-2">
          <input type="number" class="form-control quantity-input" value="1" min="1">
        </div>
        <div class="col-md-2">
          <h4 class="total-amount">$99.99</h4>
        </div>
        <div class="col-md-2">
          <button class="btn btn-danger delete-button">Delete</button>
        </div>
      </div>
    </div>
    <div class="cart-item">
      <div class="row">
        <div class="col-md-2">
          <img src="product-image2.jpg" alt="Product Image" class="product-image">
        </div>
        <div class="col-md-4">
          <h3 class="product-title">Product 2</h3>
          <p class="product-price">$49.99</p>
        </div>
        <div class="col-md-2">
          <input type="number" class="form-control quantity-input" value="2" min="1">
        </div>
        <div class="col-md-2">
          <h4 class="total-amount">$99.98</h4>
        </div>
        <div class="col-md-2">
          <button class="btn btn-danger delete-button">Delete</button>
        </div>
      </div>
    </div>
    <div class="cart-item">
      <div class="row">
        <div class="col-md-2">
          <img src="product-image3.jpg" alt="Product Image" class="product-image">
        </div>
        <div class="col-md-4">
          <h3 class="product-title">Product 3</h3>
          <p class="product-price">$19.99</p>
        </div>
        <div class="col-md-2">
          <input type="number" class="form-control quantity-input" value="3" min="1">
        </div>
        <div class="col-md-2">
          <h4 class="total-amount">$59.97</h4>
        </div>
        <div class="col-md-2">
          <button class="btn btn-danger delete-button">Delete</button>
        </div>
      </div>
    </div>
    <div class="cumulative-price">
      <h3>Cumulative Price: $259.94</h3>
    </div>
  </div>

  <form class="form-vertical my-form" role="form">
 <div class="payment-section">
      <h3>Add a new Details</h3>
      <form>
        <div class="form-group">
          <label for="fullname">Full name:</label>
          <input type="text" class="form-control" id="fullname" placeholder="Enter your full name" required>
        </div>
        <div class="form-group">
          <label for="mobile">Mobile number:</label>
          <input type="tel" class="form-control" id="mobile" placeholder="Enter your mobile number" required>
        </div>
        <div class="form-group">
          <label for="landmark">Landmark:</label>
          <input type="text" class="form-control" id="landmark" placeholder="Enter a landmark near your location" required>
        </div>
        <div class="form-group">
          <label for="town">Town/City:</label>
          <input type="text" class="form-control" id="town" placeholder="Enter your town or city" required>
        </div>
        <div class="form-group">
          <label for="addresstype">Address type:</label>
          <select class="form-control" id="addresstype" required>
            <option value="">Select an address type</option>
            <option value="home">Home</option>
            <option value="office">Office</option>
          </select>
        </div>
        <button  type="submit" class="btn btn-primary">Make a Payment</button>
      </form>
    </div>
  </form>


</asp:Content>
