using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceApplication
{
    public partial class Site5 : System.Web.UI.MasterPage
    {
        ConnectionClass objcls = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int totalProductCount = objcls.GetTotalProductCount();
                int totalCategoryCount = objcls.GetTotalCategoryCount();

                lblTotalProducts.Text = "Total Products: " + totalProductCount.ToString();
                lblTotalCategories.Text = "Total Categories: " + totalCategoryCount.ToString();
            }
        }
    }
}