using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace EcommerceApplication
{
    public class ConnectionClass
    {
        SqlConnection con;
        SqlCommand cmd;
        public ConnectionClass()
        {
            con = new SqlConnection(@"server=DESKTOP-KAI9EEB\SQLEXPRESS; database=FruitShop;Integrated security=true");
        }
        public int Fun_Non_Query(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(sqlquery, con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
        public string Fun_scalar(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(sqlquery, con);
            con.Open();
            String s = cmd.ExecuteScalar().ToString();
            con.Close();
            return s;
        }

        public DataSet Fun_exeAdapter(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            SqlDataAdapter da = new SqlDataAdapter(sqlquery, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public DataTable Fun_Exedatatable(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            SqlDataAdapter da = new SqlDataAdapter(sqlquery, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public int GetTotalProductCount()
        {
            string query = "SELECT COUNT(Product_Id) FROM Product_tab";
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(query, con);
            con.Open();
            int productCount = (int)cmd.ExecuteScalar();
            con.Close();
            return productCount;
        }

        public int GetTotalCategoryCount()
        {
            string query = "SELECT COUNT(Category_id) FROM Category_tab";
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(query, con);
            con.Open();
            int categoryCount = (int)cmd.ExecuteScalar();
            con.Close();
            return categoryCount;
        }



    }
}