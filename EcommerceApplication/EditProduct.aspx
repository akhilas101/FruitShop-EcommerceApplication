<%@ Page Title="Edit Products" Language="C#" MasterPageFile="~/Site6.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="EcommerceApplication.EditProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Dashboard Styles */
        .dashboard-container {
            display: flex;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .sidebar {
            width: 250px;
            background-color: #343a40;
            color: white;
            padding: 20px;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
            margin-bottom: 5px;
            border-radius: 4px;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 15px;
            text-align: center;
            border-radius: 4px 4px 0 0;
        }
        .form-container {
            margin-top: 20px;
        }
        .grid-container {
            max-width: 800px;
            width: 100%;
            margin: 20px auto;
        }
        .table-responsive {
            margin-top: 20px;
        }
        .table {
            background-color: white;
        }
        .btn {
            min-width: 100px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-container">
        <div class="sidebar">
            <h2>Admin Dashboard</h2>
            <a href="Dashboard.aspx">Dashboard</a>
            <a href="EditProduct.aspx">Edit Products</a>
            <a href="ManageCategories.aspx">Manage Categories</a>
            <a href="Orders.aspx">View Orders</a>
            <a href="Logout.aspx">Logout</a>
        </div>
        <div class="content">
            <div class="header">
                <h2>Edit Products</h2>
            </div>
            <div class="form-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Product_Id"
                    OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting"
                    CssClass="table table-bordered table-hover table-responsive">
                    <Columns>
                        <asp:BoundField DataField="Product_Id" HeaderText="Product ID" />

                        <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                                <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("Category_name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxCategory" runat="server" Text='<%# Eval("Category_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Product Name">
                            <ItemTemplate>
                                <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Product_name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxProductName" runat="server" Text='<%# Eval("Product_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Product Description">
                            <ItemTemplate>
                                <asp:Label ID="lblProductDescription" runat="server" Text='<%# Eval("Product_description") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxProductDescription" runat="server" Text='<%# Eval("Product_description") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Product Image">
                            <ItemTemplate>
                                <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("Product_image") %>' Height="90px" Width="90px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <asp:HiddenField ID="hfImagePath" runat="server" Value='<%# Eval("Product_image") %>' />
                                <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("Product_image") %>' Height="90px" Width="90px" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblProductPrice" runat="server" Text='<%# Eval("Product_price") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxProductPrice" runat="server" Text='<%# Eval("Product_price") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label ID="lblProductQty" runat="server" Text='<%# Eval("Product_stock") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxProductQty" runat="server" Text='<%# Eval("Product_stock") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblOrderStatus" runat="server" Text='<%# Eval("Product_status") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownListStatus" runat="server">
                                    <asp:ListItem Text="ACTIVE" Value="ACTIVE"></asp:ListItem>
                                    <asp:ListItem Text="INACTIVE" Value="INACTIVE"></asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                        <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
