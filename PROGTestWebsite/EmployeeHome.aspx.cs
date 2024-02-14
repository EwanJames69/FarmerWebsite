using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROGTestWebsite
{
    public partial class EmployeeHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Variables.username == "111")
            {
                Response.Redirect("/LoggedOutHome.aspx");
            }
            else
            {
                //Setting the panels properties
                lblUsername.Text = Variables.username;
                pnlBackground.Style["border-radius"] = "15px";
                pnlBackground.Style["overflow"] = "hidden";
            }            
        }

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("/LoggedOutHome.aspx");
        }
    }
}