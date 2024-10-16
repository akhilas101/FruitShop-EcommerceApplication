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
    public partial class EditCateory : System.Web.UI.Page
    {
        ConnectionClass objcls = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { }

            Bind_Grid();

        }
        public void Bind_Grid()
        {
            string str = "SELECT * FROM Category_tab";
            DataSet ds = objcls.Fun_exeAdapter(str);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

      
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Bind_Grid();
        }
      

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow rw = GridView1.Rows[e.NewSelectedIndex];
            Label1.Text = rw.Cells[2].Text;
            Label2.Text = rw.Cells[3].Text;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Bind_Grid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];

            int categoryId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            string categoryName = ((TextBox)row.Cells[1].Controls[0]).Text;
            string categoryDescription = ((TextBox)row.Cells[2].Controls[0]).Text;
            string categoryStatus = ((TextBox)row.Cells[3].Controls[0]).Text;

            FileUpload fileUpload = (FileUpload)row.FindControl("FileUpload1");
            HiddenField hfImagePath = (HiddenField)row.FindControl("hfImagePath");

            string newImagePath;
            if (fileUpload.HasFile)
            {
                string imagePath = "~/PHS/" + fileUpload.FileName;
                fileUpload.SaveAs(MapPath(imagePath));
                newImagePath = imagePath;
            }
            else
            {
                newImagePath = hfImagePath.Value;
            }

            string updateQuery = "UPDATE Category_tab SET Category_name = '" + categoryName + "', " +
                                 "Category_description = '" + categoryDescription + "', " +
                                 "Category_status = '" + categoryStatus + "', " +
                                 "Category_img = '" + newImagePath + "' " +
                                 "WHERE Category_id = " + categoryId;

            int result = objcls.Fun_Non_Query(updateQuery);

            if (result == 1)
            {
                GridView1.EditIndex = -1;
                Bind_Grid();
            }
            else
            {
                Label1.Text = "Error updating the record.";
            }

        }
    }
}