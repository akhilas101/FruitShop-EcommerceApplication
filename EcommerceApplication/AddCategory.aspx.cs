using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceApplication
{
    public partial class AddCategory : System.Web.UI.Page
    {
        ConnectionClass objcls = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string path = "~/PHS/" + FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath(path));
            string strinsert = "insert into Category_tab values('" + TextBox1.Text + "', '" + TextBox2.Text + "', '" + DropDownList1.SelectedItem.Text + "', '" + path + "')";
            int i = objcls.Fun_Non_Query(strinsert);
            if (i == 1)
            {
                Label1.Text = "Inserted";
            }
            Label1.Visible = true;
        }
    }
}