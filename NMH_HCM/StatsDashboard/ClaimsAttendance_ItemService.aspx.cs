﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace NMH_HCM.StatsDashboard
{
    public partial class ClaimsAttendance_ItemService : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dpStartDate.SelectedDate = DateTime.Now;
                dpEndDate.SelectedDate = DateTime.Now;
                loadDashboard(0);
            }
        }
        protected void loadDashboard(int serviceId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("StatsDashboard_ClaimsAttendance_ByItemService", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    //command.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = DateTime.Now.AddDays(-1);
                    //command.Parameters.Add("@EndDate", SqlDbType.DateTime).Value = DateTime.Now;
                    command.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = dpStartDate.SelectedDate.Value.ToString();
                    command.Parameters.Add("@EndDate", SqlDbType.DateTime).Value = dpEndDate.SelectedDate.Value.ToShortDateString() + " 11:59:59 PM";
                    command.Parameters.Add("@ServiceId", SqlDbType.Int).Value = serviceId;
                    command.Parameters.Add("@ClaimsTotal", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsAmountTotal", SqlDbType.Float).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@AwardedAmountTotal", SqlDbType.Float).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@FacilitiesTotal", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsElectronic", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsAmountElectronic", SqlDbType.Float).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsPaper", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsAmountPaper", SqlDbType.Float).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsMale", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsAmountMale", SqlDbType.Float).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsFemale", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsAmountFemale", SqlDbType.Float).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsPrincipal", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsAmountPrincipal", SqlDbType.Float).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsDependent", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ClaimsAmountDependent", SqlDbType.Float).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ItemsMale", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ItemsFemale", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ItemsPrincipal", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@ItemsDependent", SqlDbType.Int).Direction = ParameterDirection.Output;
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
                        ClaimsMale.InnerText = Convert.ToInt32(command.Parameters["@ClaimsMale"].Value).ToString("N0");
                        ClaimsAmountMale.InnerText = Convert.ToDouble(command.Parameters["@ClaimsAmountMale"].Value).ToString("N02");
                        ClaimsFemale.InnerText = Convert.ToInt32(command.Parameters["@ClaimsFemale"].Value).ToString("N0");
                        ClaimsAmountFemale.InnerText = Convert.ToDouble(command.Parameters["@ClaimsAmountFemale"].Value).ToString("N02");
                        ClaimsPrincipal.InnerText = Convert.ToInt32(command.Parameters["@ClaimsPrincipal"].Value).ToString("N0");
                        ClaimsAmountPrincipal.InnerText = Convert.ToDouble(command.Parameters["@ClaimsAmountPrincipal"].Value).ToString("N02");
                        ClaimsDependent.InnerText = Convert.ToInt32(command.Parameters["@ClaimsDependent"].Value).ToString("N0");
                        ClaimsAmountDependent.InnerText = Convert.ToDouble(command.Parameters["@ClaimsAmountDependent"].Value).ToString("N02");
                        ItemsMale.InnerText = Convert.ToInt32(command.Parameters["@ItemsMale"].Value).ToString("N0");
                        ItemsFemale.InnerText = Convert.ToInt32(command.Parameters["@ItemsFemale"].Value).ToString("N0");
                        ItemsPrincipal.InnerText = Convert.ToInt32(command.Parameters["@ItemsPrincipal"].Value).ToString("N0");
                        ItemsDependent.InnerText = Convert.ToInt32(command.Parameters["@ItemsDependent"].Value).ToString("N0");
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
            loadDashboard(int.Parse(dlService.SelectedValue));
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

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void SqlDataSource4_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void chartSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSource5_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
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

        protected void SqlDataSource8_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void SqlDataSource9_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
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
    }
}