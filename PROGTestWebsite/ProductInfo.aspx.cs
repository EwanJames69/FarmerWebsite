using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Xml.Linq;

namespace PROGTestWebsite
{
    public partial class ProductInfo : Page
    {
        //This class's code was developed with the help of youtube VIDEO TITLE: CRUD operation in ASP.NET webform
        //https://youtu.be/9ZLPv5X0DH4

        private string cs = Properties.Settings.Default.DBCONNECTSTRING;
        private SqlConnection con;
        private SqlCommand cmd;

        private void DataLoad()
        {
            //This method updates the gridview whenever the database information is altered
            if (Page.IsPostBack)
            {                
                dgvProduct.DataBind();
            }
        }

        private void ClearAllData()
        {
            //Clears all values inside textbox
            ddlProducts.SelectedValue = ddlProducts.Items[0].ToString();
            txtAmount.Text = "";
            txtDate.Text = DateTime.Now.ToString();
            chkBoxCorrect.Checked = false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Variables.username == "111")
            {
                Response.Redirect("/LoggedOutHome.aspx");
            }
            else
            {
                //Sets the panels properties
                lblUsername.Text = Variables.username;
                pnlBackground.Style["border-radius"] = "15px";
                pnlBackground.Style["overflow"] = "hidden";
            }            
        }

        protected void dgvProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Adds the values from the gridview into the textboxes whenever a row is selected
            ddlProducts.Text = dgvProduct.SelectedRow.Cells[2].Text;
            txtAmount.Text = dgvProduct.SelectedRow.Cells[3].Text;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //Adds product information into the database
            //Checking for any null textboxes
            if (ddlProducts.SelectedIndex == 0 || string.IsNullOrEmpty(txtAmount.Text) || string.IsNullOrEmpty(txtDate.Text))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "&nbsp;&nbsp;*Please fill in all the information above before submitting";
            }
            //Checking if the check box is ticked
            else if (!chkBoxCorrect.Checked)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "&nbsp;&nbsp;*Please check the checkbox above before submitting";
            }
            //Adding the values to the database
            else
            {
                lblMessage.Text = "";
                int farmerID;
                string fullName;

                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("SELECT FARMER_ID FROM FARMER WHERE USERNAME = @USERNAME", con);
                    cmd.Parameters.AddWithValue("@USERNAME", Variables.username);
                    farmerID = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }

                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("SELECT FARMER_FULLNAME FROM FARMER WHERE USERNAME = @USERNAME", con);
                    cmd.Parameters.AddWithValue("@USERNAME", Variables.username);
                    fullName = cmd.ExecuteScalar().ToString();
                    con.Close();
                }

                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("INSERT INTO PRODUCT (PRODUCT_TYPE, AMOUNT, DATE_DELIVERED, FARMER_ID, FARMER_FULLNAME, USERNAME)" +
                                         "VALUES (@PRODUCT_TYPE, @AMOUNT, @DATE_DELIVERED, @FARMER_ID, @FARMER_FULLNAME, @USERNAME)", con);
                    cmd.Parameters.AddWithValue("@PRODUCT_TYPE", ddlProducts.SelectedValue);
                    cmd.Parameters.AddWithValue("@AMOUNT", txtAmount.Text);
                    cmd.Parameters.AddWithValue("@DATE_DELIVERED", txtDate.Text);
                    cmd.Parameters.AddWithValue("@FARMER_ID", farmerID);
                    cmd.Parameters.AddWithValue("@FARMER_FULLNAME", fullName);
                    cmd.Parameters.AddWithValue("@USERNAME", Variables.username);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    DataLoad();
                    ClearAllData();
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "&nbsp;&nbsp;The product information has been added successfully";
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //Updates the values in the database
            //Checking for null textbox values
            if (ddlProducts.SelectedIndex == 0 || string.IsNullOrEmpty(txtAmount.Text) || string.IsNullOrEmpty(txtDate.Text))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "&nbsp;&nbsp;*Please fill in all the information above before submitting";
            }
            //Checking if the checkbox is ticked
            else if (!chkBoxCorrect.Checked)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "&nbsp;&nbsp;*Please check the checkbox above before submitting";
            }
            //Updating the selected information
            else
            {
                lblMessage.Text = "";

                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("UPDATE PRODUCT SET PRODUCT_TYPE = @PRODUCT_TYPE, AMOUNT = @AMOUNT, DATE_DELIVERED = @DATE_DELIVERED WHERE PRODUCT_ID = @PRODUCT_ID", con);
                    cmd.Parameters.AddWithValue("@PRODUCT_ID", dgvProduct.SelectedRow.Cells[1].Text);
                    cmd.Parameters.AddWithValue("@PRODUCT_TYPE", ddlProducts.SelectedValue);
                    cmd.Parameters.AddWithValue("@AMOUNT", txtAmount.Text);
                    cmd.Parameters.AddWithValue("@DATE_DELIVERED", txtDate.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    DataLoad();
                    ClearAllData();
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //Deletes any product in the database
            try
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("DELETE FROM PRODUCT WHERE PRODUCT_ID = @PRODUCT_ID", con);

                    cmd.Parameters.AddWithValue("@PRODUCT_ID", dgvProduct.SelectedRow.Cells[1].Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    DataLoad();
                    ClearAllData();
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "&nbsp;&nbsp;The product information has been deleted successfully";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearAllData();
        }
    }
}