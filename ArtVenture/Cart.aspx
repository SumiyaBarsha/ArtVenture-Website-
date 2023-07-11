<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ArtVenture.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <title>ArtVenture|Cart</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link
        href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;600&family=Dancing+Script:wght@400;600;700&family=Lobster&family=Roboto+Flex:wght@100;500&family=Roboto:wght@300;500;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles/cart_style.css">

   <script>
       window.addEventListener('DOMContentLoaded', (event) => {
           const quantityInput = document.getElementById('quantityInput');
           const cumulativePrice = document.getElementById('cumulativePrice');
           const unitPrice = document.getElementById('unitPrice');
           console.log('Unit Price:', unitPriceValue);

           // Get the unit price as a numeric value
           const unitPriceValue = parseFloat(unitPrice.innerHTML);

           // Calculate cumulative price when quantity input changes
           quantityInput.addEventListener('input', () => {
               const quantity = parseInt(quantityInput.value);
               console.log('Quantity:', quantity);
               const total = quantity * unitPriceValue;
               console.log('Quantity input changed');

               cumulativePrice.innerHTML = total;
           });
       });


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
    <h1><b>Shopping Cart</b></h1>
        <br />
         <div><asp:Label ID="orderLabel" runat="server" CssClass="order-message"></asp:Label></div>
        <br />
   <div class="cart-items">
  <asp:Repeater ID="cartItemsRepeater" runat="server" OnItemDataBound="cartItemsRepeater_ItemDataBound">
    <ItemTemplate>
      <div class="row">
        <div class="col-md-2">
          <div class="cart-item-image">
            <asp:Image ID="productImage" runat="server" CssClass="cart-item-image" ImageUrl="img/Shoppingbag.jpg" />
          </div>
        </div>
        <div class="col-md-4">
          <h4><%# Eval("ProductName") %></h4>
        </div>
        <div class="col-md-2">
          <p class="price"><%# Eval("Price", "{0:C}") %></p>
        </div>
        <div class="col-md-2">
  <asp:TextBox ID="quantityInput" runat="server" Width="50" Text='<%# Eval("QuantityInput") %>' ReadOnly="true"></asp:TextBox>
          </div>
          <div class="col-md-2">
                        <asp:Button ID="deleteButton" runat="server" Text="Delete" CssClass="btn btn-danger"
                            CommandName="Delete" CommandArgument='<%# Eval("ItemId") %>' OnClick="DeleteButton_Click" />
                    </div>
      </div>
    </ItemTemplate>
  </asp:Repeater>
</div>

    <div class="cumulative-price">
    <label for="cumulativePriceLabel">Total Price:</label>
    <asp:Label ID="cumulativePriceLabel" runat="server" Text='<%# Eval("CumulativePrice", "{0:C}") %>'></asp:Label>
        <div><asp:Label ID="messageLabel" runat="server" CssClass="message"></asp:Label></div>
</div>


    <div class="payment-section">
    <h3>Add New Details</h3>
    <div class="form-group">
        <label for="fullname">Full name:</label>
        <input type="text" class="form-control" id="fullname" placeholder="Enter your full name"  runat="server" />
    </div>
    <div class="form-group">
        <label for="mobile">Mobile number:</label>
        <input type="tel" class="form-control" id="mobile" placeholder="Enter your mobile number"  runat="server" />
    </div>
    <div class="form-group">
        <label for="landmark">Landmark:</label>
        <input type="text" class="form-control" id="landmark" placeholder="Enter a landmark near your location" runat="server" />
    </div>
    <div class="form-group">
        <label for="town">Town/City:</label>
        <input type="text" class="form-control" id="town" placeholder="Enter your town or city" runat="server" />
    </div>
    <div class="form-group">
        <label for="addresstype">Address type:</label>
        <select class="form-control" id="addresstype"  runat="server">
            <option value="">Select an address type</option>
            <option value="home">Home</option>
            <option value="office">Office</option>
        </select>
    </div>
        <div>
        <asp:Button ID="paymentButton" runat="server" Text="Confirm Your Info" OnClick="confirmInfoButton_Click" Cssclass="confirmbtn"/>
       </div>

</div>
        </div>
  <br>
        <br />

  <div class="container">
        <h1>Payment Checkout</h1>

        <div class="form-group">
            <label for="totalPriceLabel">Total Price to Pay:</label>
            <asp:Label ID="totalPriceLabel" runat="server" CssClass="form-control" ReadOnly="true"></asp:Label>
        </div>

        <div class="form-group">
            <label for="deliveryMethod">Select Delivery Method:</label>
            <asp:DropDownList ID="deliveryMethod" runat="server" CssClass="form-control">
                <asp:ListItem Text="Cash on Delivery" Value="COD"></asp:ListItem>
                <asp:ListItem Text="bKash(N/A)" Value="bKash"></asp:ListItem>
                <asp:ListItem Text="Nagad(N/A)" Value="Nagad"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Button ID="confirmButton" runat="server" Text="Confirm Order" OnClick="confirmButton_Click" CssClass="confirmbtn" />
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

