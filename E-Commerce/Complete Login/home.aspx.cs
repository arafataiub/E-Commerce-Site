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
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string count = "0";
            LabelCount.Text = count;
            HyperLink2.Visible = false;
            LabelCartCount.Visible = false;
            LabelCount.Visible = false;
            HyperLink1.Visible = false;
            HyperLinkHome.Visible = false;

            if (Session["new"] != null)
            {
                HyperLinkHome.Visible = true;
                HyperLinklogin.Visible = false;
                HyperLinkres.Visible = false;
                HyperLink2.Visible = true;
                LabelCartCount.Visible = true;
                LabelCount.Visible = true;
                HyperLink1.Visible = true;
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                con.Open();
                //string countQuery = "select count(*) from Cart ";
                string countQuery = "select count(*) from Cart where cartId ='" + Session["new"] + "'";

                SqlCommand cob = new SqlCommand(countQuery, con);
                //cob.Parameters.AddWithValue("@id", Session["new"]);



                //int temp =  cob.ExecuteNonQuery();
                int temp = Convert.ToInt32(cob.ExecuteScalar().ToString());



                con.Close();
                LabelCount.Text = temp.ToString();
                


            }

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string name = null;
            int price = 0;
            if (e.CommandName == "addToCart")
            {
                if(Session["new"]==null)
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    conn.Open();

                    string nameQuery = "select name,price from Products where productId ='" + e.CommandArgument.ToString() + "'";
                    SqlCommand con1 = new SqlCommand(nameQuery, conn);
                    con1.CommandType = CommandType.Text;
                    SqlDataReader dr = con1.ExecuteReader();
                    
                    while (dr.Read())
                    {
                        name = dr[0].ToString();
                        price = Convert.ToInt32(dr[1].ToString());


                    }
                    dr.Close();


                    string insertQuery = "insert into Cart (cartId,productId,name,price) values(@cartId,@productId,@name,@price)";
                    SqlCommand com = new SqlCommand(insertQuery, conn);
                    com.Parameters.AddWithValue("@cartId", Session["new"]);
                    com.Parameters.AddWithValue("@productId", e.CommandArgument.ToString());
                    com.Parameters.AddWithValue("@name",name);
                    com.Parameters.AddWithValue("@price", price);
                    com.ExecuteNonQuery();

                    Response.Redirect("home.aspx");

                    conn.Close();

                }
                
            }
        }
    }
}