<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Log.aspx.cs" Inherits="EcommerceApplication.Log" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-box {
            width: 400px;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .login-btn {
            width: 100%;
        }

        .label-style {
            color: #495057;
            font-weight: 500;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <div class="login-box">
            <h2 class="text-center mb-4">Login</h2>
            <div class="form-group">
                <label for="TextBox1" class="label-style">Username</label>
                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" placeholder="Enter username"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBox2" class="label-style">Password</label>
                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="Button1" CssClass="btn btn-primary login-btn" runat="server" OnClick="Button1_Click" Text="Login" />
            </div>
            <div class="form-group text-center">
                <asp:Label ID="Label1" CssClass="text-danger" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
