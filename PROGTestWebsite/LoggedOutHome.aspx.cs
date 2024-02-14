using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace PROGTestWebsite
{
    public partial class LoggedOutHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting all the panels properties
            pnlFarmer.Style["border-radius"] = "15px 50px";
            pnlFarmer.Style["overflow"] = "hidden";

            pnlEmployee.Style["border-radius"] = "15px 50px";
            pnlEmployee.Style["overflow"] = "hidden";

            pnlBackground.Style["border-radius"] = "15px";
            pnlBackground.Style["overflow"] = "hidden";

            Variables.username = "111"; //This username is used to determine if the user is logged in or not
        }

        protected void lnkFarmer_Click(object sender, EventArgs e)
        {
            Response.Redirect("/LoginFarmer.aspx");
        }

        protected void lnkEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("/LoginEmployee.aspx");
        }
    }
}