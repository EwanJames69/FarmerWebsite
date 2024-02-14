using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace PROGTestWebsite
{
    public partial class LoginEmployee : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //Sets the panels properties
            pnlBackground.Style["border-radius"] = "15px";
            pnlBackground.Style["overflow"] = "hidden";
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            //Checking for null textbox values
            if (string.IsNullOrEmpty(txtUsername.Text) || string.IsNullOrEmpty(txtPassword.Text))
            {
                lblMessage.Text = "&nbsp;&nbsp;&nbsp;&nbsp;*Please fill in all your credentials above before logging in";
            }
            //Checking if the the information entered matches the information in the database
            else
            {
                LoginCheck check = new LoginCheck(txtUsername.Text, txtPassword.Text);
                string hashedPassword = check.PasswordHashing();
                check.CheckForRegisteredEmployee(hashedPassword);

                if (check.count == 1)
                {
                    Variables.username = txtUsername.Text;
                    Response.Redirect("/EmployeeHome.aspx");
                }
                else
                {
                    lblMessage.Text = "&nbsp;&nbsp;&nbsp;&nbsp;*Username or password is incorrect";
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("/RegisterEmployee.aspx");
        }
    }
}