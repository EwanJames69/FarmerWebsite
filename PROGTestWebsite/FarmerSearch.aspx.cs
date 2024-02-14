using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROGTestWebsite
{
    public partial class FarmerSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Variables.username == "111")
            {
                Response.Redirect("/LoggedOutHome.aspx");
            }
            else
            {
                //Sets the panels properties values
                lblUsername.Text = Variables.username;
                pnlBackground.Style["border-radius"] = "15px";
                pnlBackground.Style["overflow"] = "hidden";
            }            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //Searches for all the farmers that match the value entered
            //Checks for null values in textbox
            if (string.IsNullOrEmpty(txtName.Text))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "&nbsp;&nbsp;*Please enter a name before searching";
            }
            else
            {
                Variables.farmerName = txtName.Text;
                Response.Redirect("/ChooseFarmer.aspx");
            }            
        }
    }
}