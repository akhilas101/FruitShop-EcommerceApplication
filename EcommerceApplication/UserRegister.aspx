<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="EcommerceApplication.UserRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .center-form {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Full page height */
            padding: 20px; /* Add padding to prevent overflow */
        }
        .form-container {
            width: 100%; /* Full width for small screens */
            max-width: 600px; /* Max width for larger screens */
            background-color: #f7f7f7;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            box-sizing: border-box; /* Ensure padding doesn't affect total width */
        }
        table {
            width: 100%;
            border-collapse: collapse; /* Collapse borders for a cleaner look */
        }
        td {
            padding: 10px;
            vertical-align: top; /* Align top for better appearance */
        }
        @media (max-width: 768px) {
            .form-container {
                width: 90%; /* More space on smaller screens */
            }
            td {
                display: block; /* Stack items for smaller screens */
                width: 100%; /* Full width for each field */
            }
            td:nth-child(1) {
                text-align: left; /* Align label text to the left */
                margin-bottom: 5px; /* Add space between fields */
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center-form">
        <div class="form-container">
            <table>
                <tr>
                    <td>Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Email<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Phone<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Address<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Username<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" AutoPostBack="True" OnTextChanged="TextBox5_TextChanged"></asp:TextBox>
                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Password<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <asp:Button ID="Button1" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
