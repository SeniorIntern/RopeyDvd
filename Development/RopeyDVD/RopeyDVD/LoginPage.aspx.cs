using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//importing necessary packages
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

namespace RopeyDVD
{
    public partial class LoginPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["RopeyDatabaseConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["role"] = "nonuser";
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager
               .ConnectionStrings["RopeyDatabaseConnectionString"]
               .ConnectionString.ToString();
            string query = "GetUser";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@uid", TbUserLoginId.Text);
                cmd.Parameters.AddWithValue("@pw", TbUserLoginPasswd.Text);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adapter.Fill(ds);

                //configure helper
                Helper.username = TbUserLoginId.Text;
                Helper.password = TbUserLoginPasswd.Text;

                if (ds.Tables[0].Rows.Count == 1)
                {
                    //valid login deatils -> aunthenticate user
                    //FormsAuthentication.RedirectFromLoginPage(TbUserLoginId.Text, false);
                    Session["role"] = "Manager";
                    Response.Redirect("ActorsDvd.aspx");
                }
                else
                {
                    //invalid login details -> show error msg
                    Response.Write("<p>Invalid Login Attempt</p>");
                }

            }
        }
    }
}