using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;


namespace RopeyDVD
{
    public partial class MangerSettings : System.Web.UI.Page
    {

        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bntAddUser_Click(object sender, EventArgs e)
        {
            addUser();
        }

        // method to add users 
        public void addUser()
        {
            string connectionString = ConfigurationManager
               .ConnectionStrings["RopeyDatabaseConnectionString"]
               .ConnectionString.ToString();

            string query = "Insert into [User](UserNumber, UserName, UserType, UserPassword) values ('" + userNumberTextBox.Text + "', '" + userNameTextBox.Text + "', '" + DropDownListUserType.SelectedValue + "','" + passwordTextBox.Text + "' )";
            //MessageBox.Show(userNumberTextBox.Text);
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            cmd.ExecuteNonQuery();

            connection.Close();
            successfulLabel.Text = "Successfully Added";
            clearDetails();
        }

        // method to clear all details
        public void clearDetails()
        {
            userNumberTextBox.Text = "";
            userNameTextBox.Text = "";
            passwordTextBox.Text = "";
            DropDownListUserType.SelectedIndex = 0;
        }



    }
}