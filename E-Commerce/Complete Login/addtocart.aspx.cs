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
    public partial class addtocart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            string selectQuery = "select price from Cart where cartId ='" + Session["new"] + "'";
            SqlCommand con = new SqlCommand(selectQuery, conn);

            con.CommandType = CommandType.Text;
            SqlDataReader dr = con.ExecuteReader();
            int price = 0;

            while (dr.Read())
            {
                price = price + dr.GetInt32(0);


            }
            dr.Close();
            Label4.Text = price.ToString();




            conn.Close();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonConfirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("confirmorder.aspx");
        }
    }
}