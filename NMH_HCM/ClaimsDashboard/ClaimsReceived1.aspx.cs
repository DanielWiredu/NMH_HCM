using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace NMH_HCM.ClaimsDashboard
{
    public partial class ClaimsReceived1 : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dpStartDate.SelectedDate = DateTime.Now;
                dpEndDate.SelectedDate = DateTime.Now;
                loadDashboard();
            }
        }
        protected void loadDashboard()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("ClaimsDashboard_ClaimsReceived", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = dpStartDate.SelectedDate.Value.ToString();
                    command.Parameters.Add("@EndDate", SqlDbType.DateTime).Value = dpEndDate.SelectedDate.Value.ToShortDateString() + " 11:59:59 PM";
                    command.Parameters.Add("@ClaimsTotal", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsAmountTotal", SqlDbType.Float).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@AwardedAmountTotal", SqlDbType.Float).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@FacilitiesTotal", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsElectronic", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsAmountElectronic", SqlDbType.Float).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsPaper", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsAmountPaper", SqlDbType.Float).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
                    try
                    {
                        command.CommandTimeout = 0;
                        connection.Open();
                        command.ExecuteNonQuery();
                        int retVal = Convert.ToInt16(command.Parameters["@return_value"].Value);
                        ClaimsTotal.InnerText = Convert.ToInt32(command.Parameters["@ClaimsTotal"].Value).ToString("N0");
                        ClaimsAmountTotal.InnerText = Convert.ToDouble(command.Parameters["@ClaimsAmountTotal"].Value).ToString("N02");
                        AwardedAmountTotal.InnerText = Convert.ToDouble(command.Parameters["@AwardedAmountTotal"].Value).ToString("N02");
                        FacilitiesTotal.InnerText = Convert.ToInt32(command.Parameters["@FacilitiesTotal"].Value).ToString("N0");
                        ClaimsElectronic.InnerText = Convert.ToInt32(command.Parameters["@ClaimsElectronic"].Value).ToString("N0");
                        ClaimsAmountElectronic.InnerText = Convert.ToDouble(command.Parameters["@ClaimsAmountElectronic"].Value).ToString("N02");
                        ClaimsPaper.InnerText = Convert.ToInt32(command.Parameters["@ClaimsPaper"].Value).ToString("N0");
                        ClaimsAmountPaper.InnerText = Convert.ToDouble(command.Parameters["@ClaimsAmountPaper"].Value).ToString("N02");
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }

        protected void btnRunReport_Click(object sender, EventArgs e)
        {
            loadDashboard();
            //grdTopClaimsSubmitted.Rebind();
            //grdTopClaimAmountSubmitted.Rebind();
        }

        protected void topClmSubmitSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void topClmAmountSubmitSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }


        protected void SqlDataSource6_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void SqlDataSource7_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void SqlDataSource10_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void SqlDataSource11_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void clmByStatusSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void amountByStatusSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }
    }
}