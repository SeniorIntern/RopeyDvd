using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Windows.Forms;

namespace RopeyDVD
{
    public partial class AssistantSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void changeUserPassword()
        {
            MessageBox.Show("Password Updated Sucessfully");
            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=RopeyDatabase;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("select * from users where username=@username and userpassword=@userpassword", con);
            cmd.Parameters.AddWithValue("@username", Helper.username);
            cmd.Parameters.AddWithValue("@userpassword", Helper.password);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


            // check insert details match or not
            if (userNewPasswordTextBox.Text == confirmPasswordTextBox.Text)
            {

                string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=DVD;Integrated Security=True";

                string query = "update users set userpassword='" + userNewPasswordTextBox.Text + "' where username= '" + Helper.username+"' and userpassword='" + Helper.password + "'";
                SqlConnection connection = new SqlConnection(connectionString);
                SqlCommand cmd1 = new SqlCommand(query, connection);
                connection.Open();
                cmd1.ExecuteNonQuery();
                connection.Close();
                successfulLabel.Text = "Successfully Added";
                clearDetails();
            }

            else
            {
                successfulLabel.Text = "Invalid Details";
            }


        }

        public  void clearDetails()
        {
            userNewPasswordTextBox.Text = "";
            confirmPasswordTextBox.Text = "";
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            changeUserPassword();
        }
    }
}