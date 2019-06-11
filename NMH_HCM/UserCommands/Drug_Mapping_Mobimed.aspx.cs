using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Configuration;
using System.Data.SqlClient;

namespace NMH_HCM.UserCommands
{
    public partial class Drug_Mapping_Mobimed : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(dlTariff.SelectedValue))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('No NMH Tariff selected. Please try again', 'Error');", true);
                return;
            }
            if (String.IsNullOrEmpty(dlDrug.SelectedValue))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('No Mobimed Drug selected. Please try again', 'Error');", true);
                return;
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("spAdd_NMH_DrugMap_Mobimed", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@TariffID", SqlDbType.Int).Value = dlTariff.SelectedValue;
                    command.Parameters.Add("@DrugID", SqlDbType.Int).Value = dlDrug.SelectedValue;
                    command.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        int retval = Convert.ToInt16(command.Parameters["@return_value"].Value);
                        if (retval == 0)
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "", "toastr.success('Drugs Mapped Successfully', 'Success');", true);
                            dlTariff.ClearSelection();
                            dlTariff.Text = "";
                            dlDrug.ClearSelection();
                            dlDrug.DataBind();
                            mapGrid.Rebind();
                        }
                        else if (retval == -4)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Sorry, this Tariff has already been mapped. Please try again', 'Error');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        string errormessage = ex.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + errormessage.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }
        protected void dlTariff_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
            e.Item.Text = ((DataRowView)e.Item.DataItem)["TariffName"].ToString();
            e.Item.Value = ((DataRowView)e.Item.DataItem)["TariffID"].ToString();
        }

        protected void dlTariff_DataBound(object sender, EventArgs e)
        {
            //set the initial footer label
            ((Literal)dlTariff.Footer.FindControl("tariffCount")).Text = Convert.ToString(dlTariff.Items.Count);
        }

        protected void dlTariff_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            String sql = "SELECT top(200) Tariff.TariffID, Tariff.TariffName FROM Tariff LEFT OUTER JOIN NMH_DrugMap ON Tariff.TariffID = NMH_DrugMap.NMH_TariffID WHERE (Tariff.ServiceID = 5) AND (NMH_DrugMap.NMH_TariffID IS NULL) AND Tariff.TariffName LIKE '%" + e.Text.ToUpper() + "%'";
            tariffSource.SelectCommand = sql;
            dlTariff.DataBind();
        }

        protected void dlDrug_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
            e.Item.Text = ((DataRowView)e.Item.DataItem)["DrugName"].ToString();
            e.Item.Value = ((DataRowView)e.Item.DataItem)["DrugID"].ToString();
        }

        protected void dlDrug_DataBound(object sender, EventArgs e)
        {
            //set the initial footer label
            ((Literal)dlDrug.Footer.FindControl("drugCount")).Text = Convert.ToString(dlDrug.Items.Count);
        }

        protected void dlDrug_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            String sql = "SELECT top (200) DrugID, DrugName, DrugPrice FROM [DrugPriceList_Mobimed] WHERE Mapped = 0 AND DrugName LIKE '%" + e.Text.ToUpper() + "%'";
            drugSource.SelectCommand = sql;
            dlDrug.DataBind();
        }

        protected void mapGrid_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = e.Item as GridDataItem;
            string deleteId = item["id"].Text;
            string drugId = item["DrugId"].Text;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("spDelete_NMH_DrugMap_Mobimed", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@MapID", SqlDbType.Int).Value = deleteId;
                    command.Parameters.Add("@DrugID", SqlDbType.Int).Value = drugId;
                    command.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        int retval = Convert.ToInt16(command.Parameters["@return_value"].Value);
                        if (retval == 0)
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "", "toastr.success('Deleted Successfully', 'Success');", true);
                            mapGrid.Rebind();
                            dlDrug.ClearSelection();
                            dlDrug.DataBind();
                        }
                    }
                    catch (Exception ex)
                    {
                        string errormessage = ex.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + errormessage.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }
    }
}