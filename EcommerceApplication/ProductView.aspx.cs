using System;
using System.Data;
using System.Web.UI.WebControls;

namespace EcommerceApplication
{
    public partial class ProductView : System.Web.UI.Page
    {
        ConnectionClass objcls = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SelectedCategoryID"] != null)
                {
                    string categoryId = Session["SelectedCategoryID"].ToString();
                    BindProducts(categoryId);
                }
            }
        }

        private void BindProducts(string categoryId)
        {
            string query = $"SELECT * FROM Product_tab WHERE Category_id = '{categoryId}'";

            DataSet ds = objcls.Fun_exeAdapter(query);

            ProductDataList.DataSource = ds;
            ProductDataList.DataBind();
        }

        protected void ProductImageButton_Command(object source, CommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                string[] args = e.CommandArgument.ToString().Split('|');
                string productId = args[0];  
                string productImage = args[1]; 
                string productPrice = args[2]; 
                string productDescription = args[3]; 

                Response.Redirect($"SingleProductView.aspx?ProductId={productId}&ProductImage={productImage}&ProductPrice={productPrice}&ProductDescription={productDescription}");
            }
        }
    }
}
