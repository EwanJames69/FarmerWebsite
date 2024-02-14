using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROGTestWebsite
{
    public partial class RegisterFarmer : System.Web.UI.Page
    {
        private string cs = Properties.Settings.Default.DBCONNECTSTRING;
        private SqlConnection con;
        private SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Variables.username == "111")
            {
                Response.Redirect("/LoggedOutHome.aspx");
            }
            else
            {
                //Setting the panels properties
                pnlBackground.Style["border-radius"] = "15px";
                pnlBackground.Style["overflow"] = "hidden";
            }            
        }

        private void DataLoad()
        {
            //This method runs to display the accurate database information after it has been altered
            if (Page.IsPostBack)
            {
                dgvFarmer.DataBind();
            }
        }        

        public void ClearAllData()
        {
            //Clears all textboxes
            txtName.Text = "";
            txtEmail.Text = "";
            txtNumber.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //Adds a user to the database
            //Checking for empty textboxes
            if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtNumber.Text) ||
                string.IsNullOrEmpty(txtUsername.Text) || string.IsNullOrEmpty(txtPassword.Text) || string.IsNullOrEmpty(txtConfirmPassword.Text))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "&nbsp;&nbsp;*Please fill in all the information above before registering";
            }
            //Checking if passwords match
            else if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "&nbsp;&nbsp;*Your two passwords do not match";
            }
            //Checking if username is already being used
            else
            {
                int count;

                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("SELECT COUNT(*) FROM FARMER WHERE USERNAME = @USERNAME", con);
                    cmd.Parameters.AddWithValue("@USERNAME", txtUsername.Text);
                    count = Convert.ToInt32(cmd.ExecuteScalar());
                }

                if (count >= 1 || txtUsername.Text == "111")
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
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
                        lblMessage.ForeColor = System.Drawing.Color.Red;
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
                            cmd = new SqlCommand("INSERT INTO FARMER (FARMER_FULLNAME, EMAIL, PHONE_NUMBER, USERNAME, PASSWORD)" +
                                                 "VALUES (@FARMER_FULLNAME, @EMAIL, @PHONE_NUMBER, @USERNAME, @PASSWORD)", con);
                            cmd.Parameters.AddWithValue("@FARMER_FULLNAME", txtName.Text);
                            cmd.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
                            cmd.Parameters.AddWithValue("@PHONE_NUMBER", txtNumber.Text);
                            cmd.Parameters.AddWithValue("@USERNAME", txtUsername.Text);
                            cmd.Parameters.AddWithValue("@PASSWORD", hashedPassword);
                            cmd.ExecuteNonQuery();
                            con.Close();
                            DataLoad();
                            ClearAllData();
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            lblMessage.Text = "&nbsp;&nbsp;*The farmer was added successfully";
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