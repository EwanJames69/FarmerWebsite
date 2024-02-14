using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROGTestWebsite
{
    public partial class ChooseFarmer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Variables.username == "111")
            {
                Response.Redirect("/LoggedOutHome.aspx");
            }
            else
            {
                lblSearch.Text = Variables.farmerName;
            }            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/FarmerSearch.aspx");
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (dgvFarmer.SelectedValue == null)
            {
                lblMessage.Text = "*Please select a farmer";
            }
            else
            {
                Variables.selectedFarmerId = Convert.ToInt32(dgvFarmer.SelectedRow.Cells[1].Text);
                Response.Redirect("FarmerProductInformation.aspx");
            }            
        }
    }
}