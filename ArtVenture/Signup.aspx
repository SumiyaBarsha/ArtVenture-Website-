<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="ArtVenture.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ArtVenture|Sign Up</title>
        <link rel="stylesheet" href="styles/signup_style.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="login-box">
            <div class="left">
              <h1>Sign up</h1>
              
                <div class="row">
            <div class="col-md-6 mx-auto">
                
                <div class="form-group">
                   <label for="body_Usernametxt">Username</label>
                <asp:TextBox ID="Usernametxt" runat="server" CssClass="input"></asp:TextBox>
                </div>

                <div class="form-group">
                   <label for="body_Useremailtxt">E-mail</label>
                <asp:TextBox ID="Useremailtxt" runat="server" CssClass="input"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="body_Userpasstxt">Password</label>
                <asp:TextBox ID="Userpasstxt" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="body_Userpass2txt">Retype password</label>
                <asp:TextBox ID="Userpass2txt" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
                </div>

                    <div class="col-md-6">
                        <label for="body_Usercategory">Select</label>
                        <asp:DropDownList CssClass="form-control" ID="Usercategory" runat="server">
                            <asp:ListItem Value="Buyer">Buyer</asp:ListItem>
                            <asp:ListItem Value="Seller">Seller</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <asp:Button ID="Register_btn" runat="server" Text="Sign Me Up" OnClick="Register_btn_Click" />
                </div>
                </div>
            </div>
            
            <div class="right">
              <span class="loginwith">Sign in with<br />social network</span>
            
                 <asp:Button ID="HomeButton" runat="server" Width="220px" CssClass="social-signin facebook" Text="Back to Home" OnClick="Home_btn_Click" />

            </div>
            <div class="or">OR</div>
        </div>
</asp:Content>
