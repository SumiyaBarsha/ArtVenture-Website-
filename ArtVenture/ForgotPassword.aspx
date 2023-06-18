<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="ArtVenture.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>ArtVenture | Forgot Password</title>
    <link href="styles/login_style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="box">
        <div class="container">
            <div class="top">
                <header>Forgot Password</header>
            </div>
            <div class="input-field">
                <label for="EmailTxt">Email</label>
                <asp:TextBox ID="EmailTxt" runat="server" CssClass="input"></asp:TextBox>
                <i class='bx bx-envelope'></i>
            </div>
            <div class="input-field">
                <label for="PasswordTxt">New Password</label>
                <asp:TextBox ID="PasswordTxt" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                <i class='bx bx-lock-alt'></i>
            </div>
            <div class="input-field">
                <label for="RetypePasswordTxt">Retype New Password</label>
                <asp:TextBox ID="RetypePasswordTxt" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                <i class='bx bx-lock-alt'></i>
            </div>
            <div class="input-field">
                <asp:Button ID="ResetPasswordBtn" runat="server" Text="Reset Password" CssClass="submit" OnClick="ResetPasswordBtn_Click" />
            </div>
        </div>
    </div>
</asp:Content>
