<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ArtVenture.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="styles/login-style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="styles/login_style.css" rel="stylesheet" />
    <title>ArtVenture|Login</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <body style="background-image: url(img/light2.png);background-size: cover;
              background-position: center;background-attachment: fixed;background-repeat: no-repeat;">
    <div class="box">
        <div class="container">

            <div class="top">
                <span>Don't Have an account?<a href="Signup.aspx" style="font-size:16px;margin-left:2px">Sign Up</a></span>
                <header>Login</header>
            </div>

            <div class="input-field">
                <input type="text" class="input" placeholder="Username" id="">
                <i class='bx bx-user'></i>
            </div>

            <div class="input-field">
                <input type="Password" class="input" placeholder="Password" id="">
                <i class='bx bx-lock-alt'></i>
            </div>

            <div class="input-field">
                <input type="submit" class="submit" value="Login" id="">
            </div>

            <div class="two-col">
                <div class="one">
                    <input type="checkbox" name="" id="check">
                    <label for="check"> Remember Me</label>
                </div>
                <div class="two">
                    <label><a href="#">Forgot password?</a></label>
                </div>
            </div>
            <div class="two-col">
                <div class="one">
                   <a href="#" ><button class="g-btn">Google</button></a>
                </div>
                <div>
                    <a href="#" ><button class="f-btn">Facebook</button></a>
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>
