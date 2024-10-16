<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SingleProductView.aspx.cs" Inherits="EcommerceApplication.SingleProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .product-image {
            width: 150px;
            height: 150px;
            object-fit: cover;
        }

        .card {
            margin: auto;
            max-width: 600px;
        }

        .offers, .reviews {
            margin-top: 20px;
        }

        .offer-item {
            font-size: 14px;
        }

        .star-rating {
            color: #ffcc00;
        }

        .review-item {
            margin-top: 10px;
            border-top: 1px solid #eaeaea;
            padding-top: 10px;
        }

        .custom-navbar {
            background-color: #343a40;
        }

        .custom-navbar .nav-link, .custom-navbar .navbar-brand {
            color: #ffffff !important;
        }

        .custom-navbar .nav-link:hover {
            color: #ffc107 !important;
        }

        .cart-icon {
            font-size: 1.5rem; /* Increase icon size */
            color: red; /* Set icon color to red */
        }

        .cart-icon:hover {
            color: #ffc107; /* Change color on hover */
        }

        /* Style for search input to reduce width */
        .custom-search {
            width: 200px; /* Adjust this value for desired width */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Custom Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Tropiko</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <form class="d-flex">
                    <input class="form-control me-2 custom-search" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-warning" type="submit">Search</button>
                </form>
                <!-- Cart Icon -->
                <a href="Cart.aspx" class="ms-3 cart-icon">
                    <i class="fas fa-shopping-cart"></i> <!-- Cart Icon -->
                </a>
            </div>
        </div>
    </nav>

    <!-- Product Details -->
    <div class="container mt-5">
        <h2 class="text-center mb-4">Product Details</h2>
        <div class="card shadow-sm">
            <div class="card-body text-center">
                <img id="ProductImage" class="product-image mb-3" runat="server" />
                <h5 class="card-title" id="ProductName" runat="server"></h5>
                <p class="card-text" id="ProductDescription" runat="server"></p>
                <p class="card-text">Price: ₹<strong id="ProductPrice" runat="server"></strong></p>

                <div class="mb-3">
                    <asp:Label runat="server" AssociatedControlID="QuantityDropdown" Text="Quantity:" CssClass="me-2" />
                    <asp:DropDownList ID="QuantityDropdown" runat="server" CssClass="form-select w-auto" OnSelectedIndexChanged="QuantityDropdown_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Text="1" Value="1" />
                        <asp:ListItem Text="2" Value="2" />
                        <asp:ListItem Text="3" Value="3" />
                        <asp:ListItem Text="4" Value="4" />
                        <asp:ListItem Text="5" Value="5" />
                    </asp:DropDownList>
                </div>

                <div class="d-flex justify-content-center">
                    <asp:Button ID="AddToCartButton" runat="server" Text="Add to Cart" CssClass="btn btn-success me-2" OnClick="AddToCartButton_Click" />
                    <asp:Button ID="ContinueButton" runat="server" Text="Continue" CssClass="btn btn-secondary" OnClick="ContinueButton_Click" />
                </div>

                <div class="offers mt-4">
                    <h5>Available Offers</h5>
                    <ul class="list-unstyled">
                        <li class="offer-item">Bank Offer: 5% Unlimited Cashback on Axis Bank Credit Card <a href="#">T&C</a></li>
                        <li class="offer-item">Bank Offer: 10% off up to ₹1,500 on Axis Bank Credit Card on orders of ₹4,990 and above <a href="#">T&C</a></li>
                        <li class="offer-item">Special Price: Get extra 36% off (price inclusive of cashback/coupon) <a href="#">T&C</a></li>
                    </ul>
                </div>

                <div class="reviews mt-5">
                    <h5>Customer Reviews</h5>
                    <div class="review-item">
                        <div class="star-rating">
                            ★★★★☆
                        </div>
                        <p class="small">"Great product, value for money!"</p>
                    </div>
                    <div class="review-item">
                        <div class="star-rating">
                            ★★★☆☆
                        </div>
                        <p class="small">"Good, but could be better with more features."</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add FontAwesome for cart/search icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</asp:Content>
