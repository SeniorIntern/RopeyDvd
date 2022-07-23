using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVD
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try {
                if (Session["role"].Equals("nonuser"))
                {
                    LinkButtonLogin.Visible = true;
                    LinkButtonLogout.Visible = false;

                    LinkButtonActors.Visible = true;
                    LinkButtonDvd.Visible = true;
                    LinkButtonMembers.Visible = false;
                    LinkButtonDvdDetails.Visible = false;
                    LinkButtonLoan.Visible = false;
                    LinkButtonMembersDvd.Visible = false;
                    LinkButtonInactiveMembers.Visible = false;
                    LinkButton6.Visible = false;
                    LinkButtonDvdReturn.Visible = false;
                    LinkButtonIssueDvd.Visible = false;
                    LinkButtonUnloanedDvds.Visible = false;
                    LinkButtonLoanOnDay.Visible = false;
                    LinkButtonUnsoldDvds.Visible = false;
                    LinkButtonAssistantSettings.Visible = false;
                    LinkButtonManagerSettings.Visible = false;
                }
                else if (Session["role"].Equals("Assistant"))
                {
                    LinkButtonLogin.Visible = false;
                    LinkButtonLogout.Visible = true;

                    LinkButtonActors.Visible = true;
                    LinkButtonDvd.Visible = true;
                    LinkButtonMembers.Visible = true;
                    LinkButtonDvdDetails.Visible = true;
                    LinkButtonLoan.Visible = true;
                    LinkButtonMembersDvd.Visible = true;
                    LinkButtonInactiveMembers.Visible = true;
                    LinkButton6.Visible = true;
                    LinkButtonDvdReturn.Visible = true;
                    LinkButtonIssueDvd.Visible = true;
                    LinkButtonUnloanedDvds.Visible = true;
                    LinkButtonLoanOnDay.Visible = true;
                    LinkButtonUnsoldDvds.Visible = true;
                    LinkButtonAssistantSettings.Visible = false;
                    LinkButtonManagerSettings.Visible = true;
                }
                else if (Session["role"].Equals("Manager"))
                {
                    LinkButtonLogin.Visible = false;
                    LinkButtonLogout.Visible = true;

                    LinkButtonActors.Visible = true;
                    LinkButtonDvd.Visible = true;
                    LinkButtonMembers.Visible = true;
                    LinkButtonDvdDetails.Visible = true;
                    LinkButtonLoan.Visible = true;
                    LinkButtonMembersDvd.Visible = true;
                    LinkButtonInactiveMembers.Visible = true;
                    LinkButton6.Visible = true;
                    LinkButtonDvdReturn.Visible = true;
                    LinkButtonIssueDvd.Visible = true;
                    LinkButtonUnloanedDvds.Visible = true;
                    LinkButtonLoanOnDay.Visible = true;
                    LinkButtonUnsoldDvds.Visible = true;
                    LinkButtonAssistantSettings.Visible = false;
                    LinkButtonManagerSettings.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<p>Something went wrong. Check master page</p>");
            }
        }

        protected void LinkButtonLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }

        protected void LinkButtonSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserRegistration/RegistrationForm.aspx");
        }

        protected void LinkButtonLogout_Click(object sender, EventArgs e)
        {

            Response.Redirect("LoginPage.aspx");
            Session.Clear();

            /*
            //Manage logout user' Page Access
            //Manage logout user' Page Access
            LinkButtonActors.Visible = true;
            LinkButtonDvd.Visible = true;

            LinkButtonMembers.Visible = false;
            LinkButtonDvdDetails.Visible = false;
            LinkButtonLoan.Visible = false;
            LinkButton6.Visible = false;
            LinkButtonDvdReturn.Visible = false;
            LinkButtonMembersDvd.Visible = false;
            LinkButtonIssueDvd.Visible = false;
            LinkButtonUnloanedDvds.Visible = false;
            LinkButtonUnsoldDvds.Visible = false;
            Response.Redirect("LoginPage.aspx");
            Session.Clear();
            */
        }

        //function 1
        protected void LinkButtonActors_Click(object sender, EventArgs e)
        {
            Response.Redirect("ActorsDvd.aspx");
        }

        //function 2
        protected void LinkButtonDvd_Click(object sender, EventArgs e)
        {
            Response.Redirect("DvdCopies.aspx");
        }

        //function 3
        protected void LinkButtonMembers_Click(object sender, EventArgs e)
        {
            Response.Redirect("DvdOnLoan.aspx");
        }

        //function 4
        protected void LinkButtonDvdDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("DvdDetails.aspx");
        }

        //function 5
        protected void LinkButtonLoan_Click(object sender, EventArgs e)
        {
            Response.Redirect("CopyLoan.aspx");
        }
        
        //function 6
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("IssueCopy.aspx");
        }

        //function 7
        protected void LinkButtonDvdReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("DvdReturn.aspx");
        }
        
        //function 8
        protected void LinkButtonMembersDvd_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberDvds.aspx");
        }

        //function 9
        protected void LinkButtonIssueDvd_Click(object sender, EventArgs e)
        {
            Response.Redirect("EntryDvd.aspx");
        }

        // function 10
        protected void LinkButtonUnloanedDvds_Click(object sender, EventArgs e)
        {
            Response.Redirect("UnloanedDvds.aspx");
        }

        // function 11
        protected void LinkButtonDvdOnLoan_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoanOnDay.aspx");
        }

        // function 12
        protected void LinkButtonInactiveMembers_Click(object sender, EventArgs e)
        {
            Response.Redirect("InactiveMembers.aspx");
        }

        // function 13
        protected void LinkButtonUnsoldDvds_Click(object sender, EventArgs e)
        {
            Response.Redirect("UnsoldDvds.aspx");
        }

        //function 14- assistant
        protected void LinkButtonAssistantSettings_Click(object sender, EventArgs e)
        {
            Response.Redirect("AssistantSettings.aspx");
        }

        //function 14- manager
        protected void LinkButtonManagerSettings_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagerSettings.aspx");
        }

    }
}