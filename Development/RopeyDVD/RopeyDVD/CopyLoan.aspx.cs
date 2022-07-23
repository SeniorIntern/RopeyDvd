using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVD
{
    public partial class CopyLoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLoanCopy_Click(object sender, EventArgs e)
        {
            GridViewLoanCopy.DataSourceID = "";
            //GridView1.AllowSorting = true;
            GridViewLoanCopy.DataSource = SqlDataSourceLoanHistory1;
            GridViewLoanCopy.DataBind();
        }

        protected void DropDownCopyNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewLoanCopy.DataSourceID = "";
            if (DropDownCopyNo.SelectedIndex != 0)
            {
                //Get pass records
                GridViewLoanCopy.DataSource = SqlDataSourceLoanHistory2;
                GridViewLoanCopy.DataBind();
            }
        }
    }
}