<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ArtVenture.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="styles/login-style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="styles/login_style.css" rel="stylesheet" />
    <title>ArtVenture|Login</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="box">
        <div class="container">

            <div class="top">
                <span>Don't Have an account?<a href="Signup.aspx" style="font-size:16px;margin-left:2px">Sign Up</a></span>
                <header>Login</header>
            </div>

            <div class="input-field">
                <label for="body_Usernametxt">Username</label>
                <asp:TextBox ID="Usernametxt" runat="server" CssClass="input"></asp:TextBox>
                <i class='bx bx-user'></i>
            </div>

            <div class="input-field">
                 <label for="body_Passwordtxt">Password</label>
                <asp:TextBox ID="Passwordtxt" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                <i class='bx bx-lock-alt'></i>
            </div>

            <div class="input-field">
               <%-- <input type="submit" class="submit" value="Login" id="Sign_in_btn"> --%>
                 <asp:Button ID="Signin_btn" runat="server" Text="LOGIN" CssClass="submit" OnClick="Signin_btn_Click" />
            </div>

            <div class="two-col">
                <div class="one">
                    <asp:CheckBox ID="RememberMeCheckBox" runat="server" Text="Remember Me" />
                </div>
                <div class="two">
                    <asp:HyperLink ID="ForgotPasswordLink" runat="server" NavigateUrl="ForgotPassword.aspx" Text="Forgot password?" />
                </div>
            </div>
            <div class="two-col">
                <div class="one">
                    <asp:Button ID ="Google_btn" runat="server" Text="Google" CssClass="g-btn"  />
                </div>
                <div>
                   <asp:Button ID ="Fb_btn" runat="server" Text="Facebook" CssClass="f-btn" />
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>
