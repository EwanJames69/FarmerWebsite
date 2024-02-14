using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROGTestWebsite
{
    public partial class FarmerProductInformation : System.Web.UI.Page
    {
        private string cs = Properties.Settings.Default.DBCONNECTSTRING;
        private SqlConnection con;
        private SqlCommand cmd;

        /// <summary>
        /// Place holder to store the farmers full name
        /// </summary>
        private string fullName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Variables.username == "111")
            {
                Response.Redirect("/LoggedOutHome.aspx");
            }
            else
            {
                //Getting the farmers full name
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("SELECT FARMER_FULLNAME FROM FARMER WHERE FARMER_ID = @FARMER_ID", con);
                    cmd.Parameters.AddWithValue("@FARMER_ID", Variables.selectedFarmerId);
                    fullName = cmd.ExecuteScalar().ToString();
                    con.Close();

                    lblName.Text = fullName;
                    lblID.Text = Variables.selectedFarmerId.ToString();
                }
            }            
        }

        protected void btnSingleDateChoose_Click(object sender, EventArgs e)
        {
            //Provides all the information from the chosen date
            if (string.IsNullOrEmpty(txtSingleDate.Text))
            {
                lblMessage.Text = "*&nbsp;&nbsp;Please enter a date before continuing";
            }
            else
            {
                Variables.singleDate = txtSingleDate.Text;
                Response.Redirect("/SingleDateProduct.aspx");
            }
        }

        protected void btnChooseTwoDates_Click(object sender, EventArgs e)
        {
            //Provides all the information between the chosen two dates
            if (string.IsNullOrEmpty(txtDateOne.Text) || string.IsNullOrEmpty(txtDateTwo.Text))
            {
                lblMessage.Text = "*&nbsp;&nbsp;Please fill in both dates before continuing";
            }
            else
            {
                Variables.dateOne = txtDateOne.Text;
                Variables.dateTwo = txtDateTwo.Text;
                Response.Redirect("/TwoDatesProduct.aspx");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ChooseFarmer.aspx");
        }

        protected void btnChooseProduct_Click(object sender, EventArgs e)
        {
            //Provides all the information from the chosen product type
            if (ddlProducts.SelectedIndex == 0)
            {
                lblMessage.Text = "&nbsp;&nbsp;*Please choose an option before";
            }
            else
            {
                Variables.productType = ddlProducts.SelectedValue;
                Response.Redirect("/ProductType.aspx");
            }
        }
    }
}