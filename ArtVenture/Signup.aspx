<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="ArtVenture.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ArtVenture|Sign Up</title>
        <link rel="stylesheet" href="styles/signup_style.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="login-box">
            <div class="left">
              <h1>Sign up</h1>
              
              <input type="text" name="username" placeholder="Username" />
              <input type="text" name="email" placeholder="E-mail" />
              <input type="password" name="password" placeholder="Password" />
              <input type="password" name="password2" placeholder="Retype password" />
              <input type="submit" name="signup_submit" value="Sign me up" />
            </div>
            
            <div class="right">
              <span class="loginwith">Sign in with<br />social network</span>
              
              <button class="social-signin facebook">Log in with facebook</button>
              <button class="social-signin twitter">Log in with Twitter</button>
              <button class="social-signin google">Log in with Google+</button>
            </div>
            <div class="or">OR</div>
          </div>
</asp:Content>
