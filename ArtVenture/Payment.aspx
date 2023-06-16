<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="ArtVenture.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>ArtVenture|Payment</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link
        href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;600&family=Dancing+Script:wght@400;600;700&family=Lobster&family=Roboto+Flex:wght@100;500&family=Roboto:wght@300;500;700&display=swap"
        rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles/payment_style.css">
    <link href="styles/home_style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div
        style="padding:20px;display:grid;grid-template-columns: 1fr 4fr 0.5fr 0.5fr 0.5fr;background-image:url(img/artsy\ \(2\).jfif)">
        <div class="site-name">ArtVenture</div>
        <div class="container">
            <form action="">
                <input class="search-bar" type="text" placeholder="Search by artist,gallery,color etc.">
                <button class="search-icon" type="submit"><img src="img/search.png"
                        style="height:30px;width:28px"></button>
            </form>
        </div>
        <div class="icons"><i class="bx bx-user"></i></div>
        <div class="icons"><i class="bx bx-heart"></i></div>
        <div class="icons"><i class="bx bx-cart"></i></div>
    </div>

    <div class="container">
        <h1>Payment Checkout</h1>
        <form class="form-vertical my-form" role="form">
          <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" class="form-control" id="address" placeholder="Enter your address" required>
          </div>
          <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="tel" class="form-control" id="phone" placeholder="Enter your phone number" required>
          </div>
          <div class="payment-methods">
            <h3>Select Payment Method:</h3>
            <div class="payment-option">
              <input type="radio" name="payment" id="cash-on-delivery" value="cash-on-delivery" required>
              <label for="cash-on-delivery">Cash on Delivery</label>
            </div>
            <div class="payment-option">
              <input type="radio" name="payment" id="bkash" value="bkash" required>
              <label for="bkash">bKash</label>
            </div>
            <div class="payment-option">
              <input type="radio" name="payment" id="rocket" value="rocket" required>
              <label for="rocket">Rocket</label>
            </div>
          </div>
          <div class="payment-button">
            <button type="submit" class="btn btn-primary">Proceed to Payment</button>
          </div>
        </form>
      </div>
    
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
      <script>
        // Disable mobile banking options by default
        $(document).ready(function() {
          $('input[name="payment"]').prop('disabled', true);
        });
    
        // Enable mobile banking options when Cash on Delivery is selected
        $('#cash-on-delivery').change(function() {
          if ($(this).is(':checked')) {
            $('input[name="payment"]').prop('disabled', true);
          }
        });
    
        // Disable Cash on Delivery when mobile banking options are selected
        $('input[name="payment"]').not('#cash-on-delivery').change(function() {
          if ($(this).is(':checked')) {
            $('#cash-on-delivery').prop('disabled', true);
          }
        });
      </script>
</asp:Content>
