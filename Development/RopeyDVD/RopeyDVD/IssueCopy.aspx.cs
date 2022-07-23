using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace RopeyDVD
{
    public partial class IssueDvd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Age is suitable to take loan");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Member have total loans: 1");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            MessageBox.Show("DVD Copy Issued Sucessfully");

        }
    }
}