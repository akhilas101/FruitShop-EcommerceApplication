using System;
using System.Data;
using System.Web.UI;

namespace EcommerceApplication
{
    public partial class SingleProductView : Page
    {
        ConnectionClass objcls = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productId = Request.QueryString["ProductId"];
                if (!string.IsNullOrEmpty(productId))
                {
                    LoadProductDetails(productId);
                }
            }
        }

        private void LoadProductDetails(string productId)
        {
            string query = "SELECT Product_name, Product_image, Product_price, Product_description FROM Product_tab WHERE Product_id = '" + productId + "'";
            DataSet ds = objcls.Fun_exeAdapter(query);


            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                ProductImage.Attributes["src"] = ds.Tables[0].Rows[0]["Product_image"].ToString();
                ProductName.InnerText = ds.Tables[0].Rows[0]["Product_name"].ToString();
                ProductPrice.InnerText = ds.Tables[0].Rows[0]["Product_price"].ToString();
                ProductDescription.InnerText = ds.Tables[0].Rows[0]["Product_description"].ToString();
            }
        }

        protected void AddToCartButton_Click(object sender, EventArgs e)
        {
            string productId = Request.QueryString["ProductId"];
            int userId = 1; // Replace with the actual logged-in user ID, you can fetch this from the session or login system.
            int quantity = Convert.ToInt32(QuantityDropdown.SelectedValue);

            if (!string.IsNullOrEmpty(productId))
            {
                string query = "SELECT Product_price FROM Product_tab WHERE Product_id = '" + productId + "'";
                DataSet ds = objcls.Fun_exeAdapter(query);


                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    float price = Convert.ToSingle(ds.Tables[0].Rows[0]["Product_price"]);
                    float totalPrice = price * quantity;

                    string insertQuery = "INSERT INTO Cart_tab (Product_id, User_Id, qty, Total_price) " +
                      "VALUES (" + productId + ", " + userId + ", " + quantity + ", " + totalPrice + ")";
                    int result = objcls.Fun_Non_Query(insertQuery);

                    if (result > 0)
                    {
                        Response.Write("<script>alert('Product added to cart successfully!');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Failed to add product to cart.');</script>");
                    }
                }
            }
        }


        protected void ContinueButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductView.aspx");
        }

        protected void QuantityDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            string productId = Request.QueryString["ProductId"];
            if (!string.IsNullOrEmpty(productId))
            {
                string query = "SELECT Product_price FROM Product_tab WHERE Product_id = '" + productId + "'";
                DataSet ds = objcls.Fun_exeAdapter(query);

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    int price = Convert.ToInt32(ds.Tables[0].Rows[0]["Product_price"]);
                    int quantity = Convert.ToInt32(QuantityDropdown.SelectedValue);
                    int totalPrice = price * quantity;
                    ProductPrice.InnerText = totalPrice.ToString();
                }
            }
        }
    }
}
