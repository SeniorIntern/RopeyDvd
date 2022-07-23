using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVD
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LinkButtonFun1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ActorsDvd.aspx");
        }

        protected void LinkButtonFun2_Click(object sender, EventArgs e)
        {
            Response.Redirect("DvdCopies.aspx");
        }
    }
}