using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Complete_Login
{
    public partial class confirmorder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["new"]!=null)
            {
                
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }

        protected void ButtonConfirm_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            string selectQuery = "select name,price from Cart where cartId ='" + Session["new"] + "'";
            SqlCommand con = new SqlCommand(selectQuery, conn);
            
            con.CommandType = CommandType.Text;
            SqlDataReader dr = con.ExecuteReader();
            string details = null;
            int price = 0;
            
            while (dr.Read())
            {
                details = details + dr[0].ToString() + ",";
                price = price + dr.GetInt32(1);
                
 
            }
            dr.Close();

           

            conn.Close();

            conn.Open();
            string insertQuery = "insert into Orders (name,address,phone,status,details,un,cost) values(@name,@address,@phone,@status,@details,@un,@cost)";
            SqlCommand com = new SqlCommand(insertQuery, conn);
           
            com.Parameters.AddWithValue("@name", TextBoxName.Text);
            com.Parameters.AddWithValue("@address",TextBoxAddress.Text);
            com.Parameters.AddWithValue("@phone",TextBoxPhone.Text);
            com.Parameters.AddWithValue("@status", "pending");
            com.Parameters.AddWithValue("@details", details);
            com.Parameters.AddWithValue("@un", Session["new"]);
            com.Parameters.AddWithValue("@cost", price);


            com.ExecuteNonQuery();

            

            conn.Close();

            conn.Open();
            string deleteQuery = "delete from Cart where cartId ='" + Session["new"] + "'";
            SqlCommand cop = new SqlCommand(deleteQuery, conn);
            cop.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("home.aspx");


        }
    }
}