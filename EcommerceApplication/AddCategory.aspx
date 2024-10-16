<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="EcommerceApplication.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Link to Bootstrap CSS for responsive design -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Add Category</h2>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <form>
                    <div class="mb-3 row">
                        <label for="TextBox1" class="col-md-4 col-form-label">Category Name</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="TextBox2" class="col-md-4 col-form-label">Category Description</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="DropDownList1" class="col-md-4 col-form-label">Category Status</label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select">
                                <asp:ListItem Value="1">Active</asp:ListItem>
                                <asp:ListItem Value="2">Inactive</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="FileUpload1" class="col-md-4 col-form-label">Category Image</label>
                        <div class="col-md-8">
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <div class="col-md-8 offset-md-4">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" CssClass="btn btn-primary" />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <div class="col-md-8 offset-md-4">
                            <asp:Label ID="Label1" runat="server" Text="Label" CssClass="form-label text-success" Visible="False"></asp:Label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
