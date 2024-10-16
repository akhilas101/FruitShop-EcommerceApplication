using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceApplication
{
    public partial class Log : System.Web.UI.Page
    {
        ConnectionClass objcls = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string str = "select count(Reg_Id) from Login_tab where User_name='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'";
            string cid = objcls.Fun_scalar(str);
            int cid1 = Convert.ToInt32(cid);
            if (cid1 == 1)
            {
                string str1 = "select Reg_Id from Login_tab where User_name='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'";
                string regid = objcls.Fun_scalar(str1);
                string str2 = "select Log_Type from Login_tab where User_name='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'";
                string logtype = objcls.Fun_scalar(str2);
                if (logtype == "admin")
                {
                    Response.Redirect("AdminHome.aspx");
                }
                else if (logtype == "user")
                {
                    Response.Redirect("ViewCategory.aspx");
                }
            }
            else
            {
                Label1.Text = "Invalid username and password";
            }
            Label1.Visible = true;

        }
    }
}