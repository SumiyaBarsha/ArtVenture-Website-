<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ArtVenture.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Profile - E-commerce</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link href="styles/profile_style.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="profile">
      <img src="profile-picture.jpg" alt="Profile Picture" class="profile-img">
      <div class="profile-details">
        <h1>John Doe</h1>
        <p>Email: johndoe@example.com</p>
        <p>Location: New York City</p>
        <p>Member Since: January 1, 2022</p>
      </div>
    </div>

    <h2>Order History</h2>
    <div class="order-history">
      <table class="order-history-table">
        <thead>
          <tr>
            <th>Order ID</th>
            <th>Order Date</th>
            <th>Total Amount</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>12345</td>
            <td>January 15, 2022</td>
            <td>$150.00</td>
            <td>Delivered</td>
          </tr>
          <tr>
            <td>67890</td>
            <td>February 20, 2022</td>
            <td>$250.00</td>
            <td>Shipped</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</asp:Content>
