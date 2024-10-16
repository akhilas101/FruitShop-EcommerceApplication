using System;
using System.Data;
using System.Web.UI.WebControls;

namespace EcommerceApplication
{
    public partial class ViewCategory : System.Web.UI.Page
    {
        ConnectionClass objcls = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind_Grid(); 
            }
        }

        public void Bind_Grid()
        {
            string str = "SELECT * FROM Category_tab";
            DataSet ds = objcls.Fun_exeAdapter(str);  
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ViewProducts")
            {
               
                string categoryId = e.CommandArgument.ToString();

              
                Session["SelectedCategoryID"] = categoryId;

            
                Response.Redirect("ProductView.aspx");
            }
        }
    }
}
