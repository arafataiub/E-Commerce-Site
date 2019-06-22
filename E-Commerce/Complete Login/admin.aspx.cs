using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Complete_Login
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["new"] != null)
            {
                LabelWelcome.Text += Session["new"].ToString();
                LabelCounter.Text = Session["counter"].ToString();
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["new"] = null;
            Session["admin"] = null;
            Session["counter"] = null;
            Response.Redirect("login.aspx");
        }

        protected void SqlDataSourceRegistration_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSourceProducts_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        

        protected void ButtonAddPro_Click1(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            FileUploadPic.SaveAs(Server.MapPath("~/pic/") + Path.GetFileName(FileUploadPic.FileName));
            string insertQuery = "insert into Products (name,price,image) values(@name,@price,@image)";
            string link = "pic/" + Path.GetFileName(FileUploadPic.FileName);
            SqlCommand com = new SqlCommand(insertQuery, conn);
            com.Parameters.AddWithValue("@name", TextBoxPN.Text);
            com.Parameters.AddWithValue("@price", TextBoxPri.Text);
            com.Parameters.AddWithValue("@image", link);


            com.ExecuteNonQuery();
            Response.Write("Upload is Successful");
            Response.Redirect("admin.aspx");

            conn.Close();
        }

    }

}
