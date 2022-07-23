using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace RopeyDVD
{
    public partial class DvdReturn : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.ConnectionString = @"Data Source = .\SQLEXPRESS;" +
                "Database = RopeyDatabase;" +
                "Trusted_Connection = True;";
            con.Open();
            returnDVDDetails();
            //   DropDownListCopyNumber.SelectedIndex = 0;
            GridViewLoan.Visible = false;

        }

        protected void btnReturnLoan_Click(object sender, EventArgs e)
        {
            returnDVD();
        }


        // method to display dvd detailson loan

        public void returnDVDDetails()
        {
            sda = new SqlDataAdapter("select loan.loannumber, DVDTitle.Penaltycharge, dateDue from loan inner join dvdCopy on dvdcopy.copynumber= loan.copynumber inner join dvdtitle on dvdcopy.dvdnumber= dvdtitle.dvdnumber   where  loan.CopyNumber = '" + DropDownListCopyNumber.SelectedValue + "' and datereturned is null; ", con);
            dt = new DataTable();
            sda.Fill(dt);
            GridViewLoan.DataSource = dt;
            GridViewLoan.DataBind();
        }


        //method to return loan
        public void returnDVD()
        {
            if (dt.Rows.Count > 0)
            {
                DateTime duedate = Convert.ToDateTime((GridViewLoan.Rows[0].Cells[2].Text));

                int pently = Int16.Parse(GridViewLoan.Rows[0].Cells[1].Text);

                if (duedate > DateTime.Now)
                {
                    string connectionString = @"Data Source = .\SQLEXPRESS;" +
                "Database = RopeyDatabase;" +
                "Trusted_Connection = True;";

                    string query1 = "update loan set datereturned='" + DateTime.Now + "' where CopyNumber = '" + DropDownListCopyNumber.SelectedValue + "'  ";
                    SqlConnection connection1 = new SqlConnection(connectionString);
                    SqlCommand cmd1 = new SqlCommand(query1, connection1);
                    connection1.Open();
                    cmd1.ExecuteNonQuery();

                    connection1.Close();

                    MessageBox.Show("DVD Returned Successfully! No Pentalty", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    clearDetails();
                }

                else
                {

                    string connectionString = @"Data Source = .\SQLEXPRESS;" +
                "Database = RopeyDatabase;" +
                "Trusted_Connection = True;";
                    //  DateTime duedate = Convert.ToDateTime((GridViewLoan.Rows[0].Cells[2].Text));
                    //    int pently = Int16.Parse( GridViewLoan.Rows[0].Cells[1].Text);

                    DateTime currentdate1 = DateTime.Now;
                    var days = ((int)(currentdate1 - duedate).TotalDays);


                    string query1 = "update loan set datereturned='" + DateTime.Now + "' where CopyNumber = '" + DropDownListCopyNumber.SelectedValue + "' ";
                    SqlConnection connection1 = new SqlConnection(connectionString);
                    SqlCommand cmd1 = new SqlCommand(query1, connection1);
                    connection1.Open();
                    cmd1.ExecuteNonQuery();

                    connection1.Close();


                    MessageBox.Show("DVD Returned Successfully!  Due Date is '" + days + " days and'RS: '" + days * pently + "' Penalty has been Charged!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    clearDetails();
                }
            }

        }


        public void clearDetails()
        {
            DropDownListCopyNumber.SelectedIndex = 0;
            GridViewLoan.DataSource = null;
        }

        protected void DropDownListCopyNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            // GridViewLoan.DataSource = null;
            returnDVDDetails();
        }

        protected void GridViewLoan_Load(object sender, EventArgs e)
        {
        }
    }
}