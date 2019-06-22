using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace Complete_Login
{
    public partial class forgetpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /*static string Encrypt(string value)
        {
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding utf8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(utf8.GetBytes(value));
                return Convert.ToBase64String(data);
            }
        }*/

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(TextBoxForPass.Text))
            {
                Response.Write("Enter User name");
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn.Open();
                string checkuser = "select count(*) from UserInfo where username='" + TextBoxForPass.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

                conn.Close();
                if (temp == 1)
                {
                    Session["temp"] = TextBoxForPass.Text ;
                    Response.Redirect("forgetpassword2.aspx");
                }
                else
                {
                    Response.Write("User Name is not Correct");
                }

            }
           
        }
    }
}