using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVD
{
    public partial class DvdCopies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSearchDvdCopies_Click(object sender, EventArgs e)
        {
            DvdCopiesGridView.DataSourceID = "";
            //GridView1.AllowSorting = true;
            DvdCopiesGridView.DataSource = SqlDataSourceDvdCopiesS;
            DvdCopiesGridView.DataBind();
        }

        protected void DropDownActorSurname2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DvdCopiesGridView.DataSourceID = "";
            if (DropDownActorSurname2.SelectedIndex != 0)
            {
                //Get pass records
                DvdCopiesGridView.DataSource = SqlDataSourceDvdCopies;
                DvdCopiesGridView.DataBind();
            }
        }
    }
}