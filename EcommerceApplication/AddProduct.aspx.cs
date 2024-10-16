using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace EcommerceApplication
{
    public partial class AddProduct : System.Web.UI.Page
    {
        ConnectionClass objcls = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "SELECT Category_id, Category_name FROM Category_tab";

               
                DataSet ds = objcls.Fun_exeAdapter(query);

              
                DropDownList2.DataSource = ds;
                DropDownList2.DataTextField = "Category_name";  
                DropDownList2.DataValueField = "Category_id";   
                DropDownList2.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string path = "~/photo/" + FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath(path));

            string strinsert = "insert into Product_tab values('" + DropDownList2.SelectedValue + "','" + TextBox1.Text + "', '" + TextBox2.Text + "',  '" + path + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + DropDownList1.SelectedItem.Text + "')";
            int i = objcls.Fun_Non_Query(strinsert);
            if (i == 1)
            {
                Label1.Text = "Inserted";
            }
            Label1.Visible = true;
        }
    }
}