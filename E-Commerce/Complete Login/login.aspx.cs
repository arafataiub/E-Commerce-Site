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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Request.Cookies["username"] !=null && Request.Cookies["password"] != null)
                {
                    TextBoxUserName.Text = Request.Cookies["username"].Value;
                    TextBoxLoginPassword.Attributes.Add("value", Request.Cookies["password"].Value);
                    Checkme.Checked = true;
                    
                }
            }
            if (Session["new"] != null && Session["admin"] != null)
            {
                Response.Redirect("admin.aspx");
            }
            else if(Session["new"] != null)
            {
                Response.Redirect("user.aspx");
            }
            else
            {

            }

        }
        static string Encrypt(string value)
        {
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding utf8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(utf8.GetBytes(value));
                return Convert.ToBase64String(data);
            }
        }

        static int trial = 0;
        static string trialtemp;

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {

            if(string.IsNullOrEmpty(TextBoxUserName.Text) )
            {
                Response.Write("Enter Username!");
            }
            else
            {
                if(string.IsNullOrEmpty(TextBoxLoginPassword.Text))
                {
                    Response.Write("Enter Password!");
                }
                else
                {
                    

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    conn.Open();
                    string checkuser = "select count(*) from UserInfo where username='" + TextBoxUserName.Text + "'";
                    SqlCommand com = new SqlCommand(checkuser, conn);
                    int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                    conn.Close();

                    if (temp == 1)
                    {
                        conn.Open();
                        string checkPasswordQuery = "select password from UserInfo where username='" + TextBoxUserName.Text + "'";
                        SqlCommand passcom = new SqlCommand(checkPasswordQuery, conn);
                        string password = passcom.ExecuteScalar().ToString().Replace(" ", "");

                        string checkstatusQuery = "select usertype from UserInfo where username='" + TextBoxUserName.Text + "'";
                        SqlCommand statuscom = new SqlCommand(checkstatusQuery, conn);
                        string usertype = statuscom.ExecuteScalar().ToString().Replace(" ", "");

                        string checkstatus= "select status from UserInfo where username='" + TextBoxUserName.Text + "'";
                        SqlCommand checkstatuscom = new SqlCommand(checkstatus, conn);
                        string status = checkstatuscom.ExecuteScalar().ToString().Replace(" ", "");

                        if (Session["trial1"] != null && string.Equals(trialtemp,TextBoxUserName.Text))
                        {
                            Response.Write("Your Login is temporary Blocked for 5 min");

                        }
                        else if (Session["trial2"] != null && string.Equals(trialtemp, TextBoxUserName.Text))
                        {
                            Response.Write("Your Login is temporary Blocked for 15 min");
                        }
                        else if(string.Equals(status,"deactive"))
                        {
                            Response.Write("Your Login in blocked,reset your password");
                        }
                        else
                        {
                            if (password == Encrypt(TextBoxLoginPassword.Text))
                            {
                                if(string.Equals(trialtemp,TextBoxUserName.Text))
                                {
                                    trial = 0;
                                    trialtemp = null;
                                }
                                
                                if (Checkme.Checked)
                                {
                                    Response.Cookies["username"].Value = TextBoxUserName.Text;
                                    Response.Cookies["password"].Value = TextBoxLoginPassword.Text;
                                    Response.Cookies["username"].Expires = DateTime.Now.AddYears(1);
                                    Response.Cookies["password"].Expires = DateTime.Now.AddYears(1);
                                }
                                else
                                {
                                    Response.Cookies["username"].Expires = DateTime.Now.AddYears(-1);
                                    Response.Cookies["password"].Expires = DateTime.Now.AddYears(-1);

                                }
                                string checkcounterQuery = "update UserInfo set count = count + 1 where username='" + TextBoxUserName.Text + "'";
                                SqlCommand countercom = new SqlCommand(checkcounterQuery, conn);
                                countercom.ExecuteNonQuery();

                                //UPDATE TheTable SET RevisionId = RevisionId + 1 WHERE Id = @id
                                string showcounterQuery = "select count from UserInfo where username='" + TextBoxUserName.Text + "'";
                                SqlCommand showcom = new SqlCommand(showcounterQuery, conn);
                                int counter = Convert.ToInt32(showcom.ExecuteScalar().ToString());


                                Session["new"] = TextBoxUserName.Text;
                                Session["counter"] = counter;
                                Response.Write("Password is Correct");
                                if (usertype == "admin")
                                {
                                    Session["admin"] = "admin";
                                    Response.Redirect("admin.aspx");
                                }
                                else
                                {
                                    Response.Redirect("user.aspx");
                                }

                            }
                            else
                            {
                                Response.Write("Password is not Correct");
                                if (trial == 0)
                                {
                                    trialtemp = TextBoxUserName.Text;
                                    trial = trial + 1;
                                }
                                else if (string.Equals(trialtemp, TextBoxUserName.Text))
                                {
                                    trial = trial + 1;
                                    if (trial == 3)
                                    {
                                        Session["trial1"] = TextBoxUserName.Text;
                                        Session.Timeout = 1;
                                    }
                                    else if (trial == 6)
                                    {
                                        Session["trial2"] = TextBoxUserName.Text;
                                        Session.Timeout = 1;
                                    }
                                    else if (trial == 9)
                                    {
                                        string deactive = "update UserInfo set status = 'deactive' where username='" + TextBoxUserName.Text + "'";
                                        SqlCommand deactivecom = new SqlCommand(deactive, conn);
                                        //com.Parameters.AddWithValue("@deactive", "deactive");
                                        deactivecom.ExecuteNonQuery();

                                    }


                                }
                                else
                                {
                                    trialtemp = TextBoxUserName.Text;
                                    trial = 1;
                                }



                            }
                            conn.Close();

                        }

                    }
                    else
                    {
                        Response.Write("User Name is not Correct");
                    }

                }
            }
            

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgetpassword.aspx");
        }
    }
}