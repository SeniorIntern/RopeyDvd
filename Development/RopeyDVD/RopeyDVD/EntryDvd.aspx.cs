using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace RopeyDVD
{
    public partial class EntryDvd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            castPanel.Visible = true;
        }

        private void clearTxt()
        {
            dvdTitleTB.Text = "";
            dvdNumTB.Text= "";
            standardChargeB.Text = " ";
            penaltyChargeB.Text = " ";
            dateReleaseB.Text = " ";

        }
        protected void addDVDB_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager
               .ConnectionStrings["RopeyDatabaseConnectionString"]
               .ConnectionString.ToString();

            string query = "Insert into DVDTitle (DvdNumber, CategoryNumber,StudioNumber , ProducerNumber, DTitle, DateReleased, StandardCharge, PenaltyCharge ) values ('" + dvdNumTB.Text.ToString() + "', '" + catDD.SelectedValue + "', '" + studioDD.SelectedValue + "','" + producerDD.SelectedValue + "', '" + dvdTitleTB.Text.ToString() + "', '" + dateReleaseB.Text.ToString() + "', '" + standardChargeB.Text.ToString() + "', '" + penaltyChargeB.Text.ToString() + "')"; 
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
                "Database = RopeyDatabase;" +
                "Trusted_Connection = True;";


            string CmQuery = "Insert into [CastMember](DvdNumber, ActorNumber) values ('" + dvdNoDD.SelectedValue + "', '" + actordd.SelectedValue + "')";

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(CmQuery, connection);
            connection.Open();
            cmd.ExecuteNonQuery();

            connection.Close();
            actordd.SelectedValue = default;
            dvdNoDD.SelectedValue = default;
            LabelRecDvdNo.Text = "";
            LabelRecActorNo.Text = "";
        }
    }
}