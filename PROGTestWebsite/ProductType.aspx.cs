using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROGTestWebsite
{
    public partial class ProductType : System.Web.UI.Page
    {
        private string cs = Properties.Settings.Default.DBCONNECTSTRING;
        private SqlConnection con;
        private SqlCommand cmd;

        /// <summary>
        /// Place holder to store the full name of the farmer
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
                //Getting the full name of the farmer
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("SELECT FARMER_FULLNAME FROM FARMER WHERE FARMER_ID = @FARMER_ID", con);
                    cmd.Parameters.AddWithValue("@FARMER_ID", Variables.selectedFarmerId);
                    fullName = cmd.ExecuteScalar().ToString();
                    con.Close();

                    lblName.Text = fullName;
                    lblID.Text = Variables.selectedFarmerId.ToString();
                    lblProductType.Text = Variables.productType;
                }
            }            
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/FarmerProductInformation");
        }
    }
}