using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceApplication
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        ConnectionClass objcls = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string sel = "select max(Reg_Id) from Login_tab";
            string regid = objcls.Fun_scalar(sel);
            int reg_id = 0;
            if (regid == "")
            {
                reg_id = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(regid);
                reg_id = newregid + 1;
            }
            string ins = "insert into Admin_Reg_tab values(" + reg_id + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "')";
            int i = objcls.Fun_Non_Query(ins);
            if (i == 1)
            {
                string inslog = "insert into Login_tab values(" + reg_id + ",'" + TextBox5.Text + "','" + TextBox5.Text + "','admin','active')";
                int j = objcls.Fun_Non_Query(inslog);
            }

        }
    }
}