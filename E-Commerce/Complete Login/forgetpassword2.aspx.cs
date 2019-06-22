using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Complete_Login
{
    public partial class forgetpassword2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["temp"] != null)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn.Open();
                string sq1Query = "select s_ques1 from UserInfo where username='" + Session["temp"] + "'";
                SqlCommand sq1 = new SqlCommand(sq1Query, conn);
                Labelsq1.Text = sq1.ExecuteScalar().ToString().Replace(" ", "");

                string sq2Query = "select s_ques2 from UserInfo where username='" + Session["temp"] + "'";
                SqlCommand sq2 = new SqlCommand(sq2Query, conn);
                Labelsq2.Text = sq2.ExecuteScalar().ToString().Replace(" ", "");
                conn.Close();


                

            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(TextBoxsa1.Text) || string.IsNullOrEmpty(TextBoxsa2.Text))
            {
                Response.Write("Answer all the question");
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn.Open();
                string sa1Query = "select s_ans1 from UserInfo where username='" + Session["temp"] + "'";
                SqlCommand sa1 = new SqlCommand(sa1Query, conn);
                string sans1 = sa1.ExecuteScalar().ToString().Replace(" ", "");

                
                

                if (string.Equals(TextBoxsa1.Text,sans1))
                {
                    string sa2Query = "select s_ans2 from UserInfo where username='" + Session["temp"] + "'";
                    SqlCommand sa2 = new SqlCommand(sa2Query, conn);
                    string sans2 = sa2.ExecuteScalar().ToString().Replace(" ", "");
                    conn.Close();

                    

                    if (string.Equals(TextBoxsa2.Text, sans2))
                    {
                        Response.Redirect("resetpass.aspx");
                    }
                    else
                    {
                        Response.Redirect("login.aspx");
                    }

                }
                else
                {
                    Response.Redirect("login.aspx");
                }

            }
            
            
        }
    }
}