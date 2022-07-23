using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVD
{
    public partial class DvdOnLoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSearchLoanDvd_Click(object sender, EventArgs e)
        {
            GridViewDvdOnLoan.DataSourceID = "";
            //GridView1.AllowSorting = true;
            GridViewDvdOnLoan.DataSource = SqlDataSourceFindCopies;
            GridViewDvdOnLoan.DataBind();
        }

        protected void DropDownMemberSurname_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewDvdOnLoan.DataSourceID = "";
            if (DropDownMemberSurname.SelectedIndex != 0)
            {
                GridViewDvdOnLoan.DataSource = SqlDataSourceFindCopies2;
                GridViewDvdOnLoan.DataBind();
            }
        }
    }
}