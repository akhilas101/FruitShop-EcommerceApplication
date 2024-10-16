<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="EditCateory.aspx.cs" Inherits="EcommerceApplication.EditCateory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            margin-top: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .grid-container {
            max-width: 800px;
            margin: 0 auto;
        }
        .grid-buttons {
            display: flex;
            justify-content: space-between;
        }
        .grid-buttons .btn {
            margin: 5px;
        }
        .table-responsive {
            margin-top: 20px;
        }
        /* Custom button style for uniform width */
        .btn-block {
            width: 100%;
            display: block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="grid-container">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Category_id"
                OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanging="GridView1_SelectedIndexChanging"
                CssClass="table table-bordered table-hover table-responsive">
                <Columns>
                    <asp:TemplateField HeaderText="Category Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Category_img") %>' Height="90px" Width="90px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:HiddenField ID="hfImagePath" runat="server" Value='<%# Eval("Category_img") %>' />
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Category_img") %>' Height="90px" Width="90px" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Category_name" HeaderText="Category Name" />
                    <asp:BoundField DataField="Category_description" HeaderText="Description" />
                    <asp:BoundField DataField="Category_status" HeaderText="Status" />

                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" SelectText="Select" ItemStyle-CssClass="btn btn-primary btn-block" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Delete" ItemStyle-CssClass="btn btn-danger btn-block" />
                    <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Edit" ItemStyle-CssClass="btn btn-warning btn-block" />
                </Columns>
            </asp:GridView>

            <div class="grid-buttons">
                <asp:Label ID="Label1" runat="server" Text="Category Label 1" CssClass="form-label"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Category Label 2" CssClass="form-label"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
