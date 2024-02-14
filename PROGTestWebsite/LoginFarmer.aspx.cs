using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROGTestWebsite
{
    public partial class LoginFarmer : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting the panels properties
            pnlBackground.Style["border-radius"] = "15px";
            pnlBackground.Style["overflow"] = "hidden";
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            //Logs the user in
            //Checking for null textbox values
            if (string.IsNullOrEmpty(txtUsername.Text) || string.IsNullOrEmpty(txtPassword.Text))
            {
                lblMessage.Text = "&nbsp;&nbsp;&nbsp;&nbsp;*Please fill in all your credentials above before logging in";
            }
            //Logs the user in if the information entered is matching
            else
            {
                LoginCheck check = new LoginCheck(txtUsername.Text, txtPassword.Text);
                string hashedPassword = check.PasswordHashing();
                check.CheckForRegisteredFarmer(hashedPassword);

                if (check.count == 1)
                {
                    Variables.username = txtUsername.Text;
                    Response.Redirect("/FarmerHome.aspx");
                }
                else
                {
                    lblMessage.Text = "&nbsp;&nbsp;&nbsp;&nbsp;*Username or password is incorrect";
                }
            }
        }        
    }
}