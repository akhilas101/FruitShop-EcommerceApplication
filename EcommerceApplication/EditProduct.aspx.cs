using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceApplication
{
    public partial class EditProduct : System.Web.UI.Page
    {
        ConnectionClass objcls = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            string query = "SELECT p.Product_Id, p.Product_name, p.Product_description, p.Product_image, p.Product_price, p.Product_stock,  p.Product_status, c.Category_name " +
                           "FROM Product_tab p INNER JOIN Category_tab c ON p.Category_id = c.Category_id";
            DataSet ds = objcls.Fun_exeAdapter(query);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Get the data from the row being edited
            int productId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string productName = (GridView1.Rows[e.RowIndex].FindControl("TextBoxProductName") as TextBox).Text.Replace("'", "''");
            string productDescription = (GridView1.Rows[e.RowIndex].FindControl("TextBoxProductDescription") as TextBox).Text.Replace("'", "''");
            string productPrice = (GridView1.Rows[e.RowIndex].FindControl("TextBoxProductPrice") as TextBox).Text;
            string productQty = (GridView1.Rows[e.RowIndex].FindControl("TextBoxProductQty") as TextBox).Text;
            string productStatus = (GridView1.Rows[e.RowIndex].FindControl("DropDownListStatus") as DropDownList).SelectedItem.Text.Replace("'", "''");

            // Define the maximum length based on your database column definition
            const int maxDescriptionLength = 255; // Adjust this value as needed

            // Truncate the description if it's too long
            if (productDescription.Length > maxDescriptionLength)
            {
                productDescription = productDescription.Substring(0, maxDescriptionLength);
            }

            // Update query with concatenation
            string updateQuery = "UPDATE Product_tab SET Product_name = '" + productName +
                                 "', Product_description = '" + productDescription +
                                 "', Product_price = " + productPrice +
                                 ", Product_stock = " + productQty +
                                 ", Product_status = '" + productStatus +
                                 "' WHERE Product_Id = " + productId;

            // Debugging: Print the final SQL query to see the exact string being executed
            Console.WriteLine(updateQuery); // You might want to use logging instead of Console

            int i = objcls.Fun_Non_Query(updateQuery);
            if (i == 1)
            {
                GridView1.EditIndex = -1;
                BindGrid();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
        }
    }
}
