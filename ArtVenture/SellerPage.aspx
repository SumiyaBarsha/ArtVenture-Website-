<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SellerPage.aspx.cs" Inherits="ArtVenture.SellerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Seller Page</title>
    <link rel="stylesheet" href="styles/seller_style.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
<div class="container">
  <h1><asp:Literal ID="welcomeLiteral" runat="server"></asp:Literal></h1>
  <p>Manage your products and sales here.</p>

    <div class="order-count">
    <h3>Total Orders: <asp:Literal ID="orderCountLiteral" runat="server"></asp:Literal></h3>
  </div>
 <div class="upload-form">
    <h2>Upload Image</h2>
    <div class="form-item-container">
      <div class="left">
        <div class="form-item">
          <asp:TextBox ID="imageIdTxt" runat="server" placeholder="Image ID"></asp:TextBox>
        </div>
        <div class="form-item">
          <asp:TextBox ID="imageNameTxt" runat="server" placeholder="Image Name"></asp:TextBox>
        </div>
        <div class="form-item">
          <asp:TextBox ID="imagePriceTxt" runat="server" placeholder="Image Price($)"></asp:TextBox>
        </div>
        <div class="form-item">
          <asp:TextBox ID="imageTypeTxt" runat="server" placeholder="Image Type"></asp:TextBox>
        </div>
        <div class="form-item">
          <asp:TextBox ID="imageFrameTxt" runat="server" placeholder="Image Frame"></asp:TextBox>
        </div>
        <div class="form-item">
          <asp:TextBox ID="imageMediumTxt" runat="server" placeholder="Image Medium"></asp:TextBox>
        </div>
        <div class="form-item">
          <asp:TextBox ID="imageDescTxt" runat="server" placeholder="Image Description"></asp:TextBox>
        </div>
      </div>
      <div class="right">
        <div class="form-item">
          <asp:Image ID="uploadedImage" runat="server" CssClass="uploaded-image" />
        </div>
        <div class="form-item">
          <asp:FileUpload ID="fileUpload" runat="server" />
        </div>
      </div>
    </div>
    <asp:Button ID="uploadBtn" runat="server" Text="Upload" CssClass="upload-btn" OnClick="UploadButton_Click" />
  </div>

  <div class="product-list">
    <h2>Product List</h2>
    <ul runat="server" id="productListPlaceholder">
      <li>
        <div class="product">
          <img src="product1.jpg" alt="Product 1" />
          <h3>Product 1</h3>
          <p>Description of Product 1</p>
          <a href="#" class="edit-btn">Edit</a>
          <a href="#" class="delete-btn">Delete</a>
        </div>
      </li>
      <li>
        <div class="product">
          <img src="product2.jpg" alt="Product 2" />
          <h3>Product 2</h3>
          <p>Description of Product 2</p>
          <a href="#" class="edit-btn">Edit</a>
          <a href="#" class="delete-btn">Delete</a>
        </div>
      </li>
      <!-- Add more product items here -->
    </ul>
  </div>
</div>

</asp:Content>
