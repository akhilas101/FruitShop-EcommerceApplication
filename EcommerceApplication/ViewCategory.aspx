<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ViewCategory.aspx.cs" Inherits="EcommerceApplication.ViewCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Link Bootstrap for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom styles for navbar */
        .custom-navbar {
            background-color: #343a40;
        }
        .custom-navbar .nav-link, .custom-navbar .navbar-brand {
            color: #ffffff !important;
        }
        .custom-navbar .nav-link:hover {
            color: #ffc107 !important;
        }
        .search-bar {
            width: 200px; /* Set the search bar length */
        }
        .cart-icon {
            font-size: 1.5rem; /* Increase icon size */
            color: red; /* Set icon color to red */
        }
        .cart-icon:hover {
            color: #ffc107; /* Change color on hover */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Custom Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Tropiko</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <form class="d-flex">
                    <input class="form-control search-bar me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-warning" type="submit">Search</button>
                </form>
                <!-- Cart Icon -->
                <a href="Cart.aspx" class="ms-3 cart-icon">
                    <i class="fas fa-shopping-cart"></i> <!-- Cart Icon -->
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h2 class="text-center mb-4">Categories</h2>
        <div class="row">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" ItemStyle-CssClass="col-lg-3 col-md-4 col-sm-6 mb-4" 
                          OnItemCommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <div class="card h-100">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("Category_img") %>' CssClass="card-img-top" Height="150px"
                                         CommandName="ViewProducts" CommandArgument='<%# Eval("Category_id") %>' />
                        <div class="card-body">
                            <h5 class="card-title">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Category_name") %>'></asp:Label>
                            </h5>
                            <p class="card-text">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Category_description") %>'></asp:Label>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

    <!-- Add FontAwesome for cart/search icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</asp:Content>
