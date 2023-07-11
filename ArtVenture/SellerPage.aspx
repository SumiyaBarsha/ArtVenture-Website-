<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SellerPage.aspx.cs" EnableEventValidation="false" Inherits="ArtVenture.SellerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Seller Page</title>
    <link rel="stylesheet" href="styles/seller_style.css">
     <script>
        function showPreviewImage() {
            var fileInput = document.getElementById('<%= fileUpload.ClientID %>');
            if (fileInput.files && fileInput.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var previewImage = document.getElementById('<%= uploadedImage.ClientID %>');
                    previewImage.src = e.target.result;
                };
                reader.readAsDataURL(fileInput.files[0]);
            }
        }
     </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
<div class="container">
  <h1><asp:Literal ID="welcomeLiteral" runat="server"></asp:Literal></h1>
  <p>Manage your products and sales here.</p>

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
          <asp:FileUpload ID="fileUpload" runat="server" onchange="showPreviewImage()"/>
        </div>
      </div>
    </div>
    <div>
        <div><asp:Button ID="uploadBtn" runat="server" Text="Upload" CssClass="follow-btn" OnClick="UploadButton_Click" /></div>
        <div><asp:Label ID="messageLabel" runat="server" CssClass="message"></asp:Label></div>
    </div>
    <div><asp:Button ID="LogoutBtn" runat="server" Text="Logout" CssClass="follow-btn" OnClick="LogoutButton_Click" /></div>

  </div>

  <div class="product-list">
  <h2>Product List</h2>
  <div class="row" style="display:grid;grid-template-columns: 1fr 1fr 1fr">
    <asp:Repeater runat="server" ID="productRepeater" OnItemDataBound="productRepeater_ItemDataBound">
      <ItemTemplate>
    <div class="col-md-3">
        <div class="product">
            <asp:Image ID="productImage" runat="server" Height="175" Width="210" ImageUrl='<%# GetImageSource(DataBinder.Eval(Container.DataItem, "Img")) %>' AlternateText='<%# Eval("Img_name") %>' />

            <h3><%# Eval("Img_name") %></h3>
            <p>Product ID: <%# Eval("Img_id") %></p>
            <p>Price: $<%# Eval("Img_price") %></p>
          <asp:LinkButton ID="deleteButton" runat="server" Text="Delete" CssClass="delete-btn" OnClick="DeleteButton_Click" OnClientClick="return confirm('Are you sure you want to delete this image?');" />
            <asp:HiddenField ID="imageIdHiddenField" runat="server" Value='<%# Eval("Img_id") %>' />

        </div>
    </div>
</ItemTemplate>
    </asp:Repeater>
  </div>
</div>
    </div>

</asp:Content>
