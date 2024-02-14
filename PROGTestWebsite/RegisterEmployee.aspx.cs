using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROGTestWebsite
{
    public partial class RegisterEmployee : Page
    {
        private string cs = Properties.Settings.Default.DBCONNECTSTRING;
        private SqlConnection con;
        private SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting the panels properties
            pnlBackground.Style["border-radius"] = "15px";
            pnlBackground.Style["overflow"] = "hidden";
        }

        public void ClearAllData()
        {
            //Clears all textbox values
            txtName.Text = "";
            txtEmail.Text = "";
            txtNumber.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }

        public void loginPage(object sender, EventArgs e)
        {
            Response.Redirect("/LoginEmployee.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //Adds a user to the database
            //Checking if any textbox is null
            if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtNumber.Text) ||
                string.IsNullOrEmpty(txtUsername.Text) || string.IsNullOrEmpty(txtPassword.Text) || string.IsNullOrEmpty(txtConfirmPassword.Text))
            {
                lblMessage.Text = "&nbsp;&nbsp;*Please fill in all the information above before registering";
            }
            //Checking if the passwords match
            else if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "&nbsp;&nbsp;*Your two passwords do not match";
            }
            //Checking if the username is already in use
            else
            {
                int count;

                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("SELECT COUNT(*) FROM EMPLOYEE WHERE USERNAME = @USERNAME", con);
                    cmd.Parameters.AddWithValue("@USERNAME", txtUsername.Text);
                    count = Convert.ToInt32(cmd.ExecuteScalar());
                }

                if (count >= 1 || txtUsername.Text == "111")
                {
                    lblMessage.Text = "&nbsp;&nbsp;*Username is already taken, please enter a new one";
                }
                else
                {
                    using (con = new SqlConnection(cs))
                    {
                        con.Open();
                        cmd = new SqlCommand("SELECT COUNT(*) FROM EMPLOYEE WHERE USERNAME = @USERNAME", con);
                        cmd.Parameters.AddWithValue("@USERNAME", txtUsername.Text);
                        count = Convert.ToInt32(cmd.ExecuteScalar());
                    }

                    if (count >= 1 || txtUsername.Text == "111")
                    {
                        lblMessage.Text = "&nbsp;&nbsp;*Username is already taken, please enter a new one";
                    }
                    else
                    {
                        //Adding the user to the database
                        LoginCheck check = new LoginCheck(txtUsername.Text, txtPassword.Text);
                        string hashedPassword = check.PasswordHashing();

                        using (con = new SqlConnection(cs))
                        {
                            con.Open();
                            cmd = new SqlCommand("INSERT INTO EMPLOYEE (EMPLOYEE_FULLNAME, EMAIL, PHONE_NUMBER, USERNAME, PASSWORD)" +
                                                 "VALUES (@EMPLOYEE_FULLNAME, @EMAIL, @PHONE_NUMBER, @USERNAME, @PASSWORD)", con);
                            cmd.Parameters.AddWithValue("@EMPLOYEE_FULLNAME", txtName.Text);
                            cmd.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
                            cmd.Parameters.AddWithValue("@PHONE_NUMBER", txtNumber.Text);
                            cmd.Parameters.AddWithValue("@USERNAME", txtUsername.Text);
                            cmd.Parameters.AddWithValue("@PASSWORD", hashedPassword);
                            cmd.ExecuteNonQuery();
                            con.Close();
                            Response.Redirect("/LoginEmployee.aspx");
                        }
                    }
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearAllData();
        }
    }
}