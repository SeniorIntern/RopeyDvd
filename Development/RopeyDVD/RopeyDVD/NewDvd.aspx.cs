using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVD
{
    public partial class AddDVD : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /*
        private void clearTxt()
        {
            dvdTitleTB.Text = "";
            standardChargeB.Text = " ";
            penaltyChargeB.Text = " ";
            dateReleaseB.Text = " ";
                
        }
        protected void addDVDB_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source = .\SQLEXPRESS;" +
                "Database = DVDStore;" +
                "Trusted_Connection = True;";

            string query = "Insert into DVDDetail (CategoryNumber,StudioNumber , ProducerNumber, DVDTitle, DateReleased, StandardCharge, PenaltyCharge ) values ('" + catDD.SelectedValue + "', '" + studioDD.SelectedValue + "','" + producerDD.SelectedValue + "', '" + dvdTitleTB.Text.ToString() + "', '" + dateReleaseB.Text.ToString() + "', '" + standardChargeB.Text.ToString() + "', '" + penaltyChargeB.Text.ToString() + "')";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            cmd.ExecuteNonQuery();

            connection.Close();
            clearTxt();

            castPanel.Visible = true;
        }

        protected void castMemberB_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source = .\SQLEXPRESS;" +
                "Database = DVDStore;" +
                "Trusted_Connection = True;";

            string query = "Insert into CastMember ( ActorNumber, DVDNumber ) values ('" + actordd.SelectedValue + "','" + dvdNoDD.SelectedValue + "')";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            cmd.ExecuteNonQuery();

            connection.Close();
            actordd.SelectedValue = default;
            dvdNoDD.SelectedValue = default;
        }
        */
    }
}