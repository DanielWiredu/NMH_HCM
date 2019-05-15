using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace NMH_HCM.UserReports
{
    public partial class FindClaimWithItem : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //string pid = dlProvider.SelectedValue;
            //string item = txtItem.Text;
            hfAttendMonth.Value = dpMonth.SelectedDate.Value.Month.ToString();
            hfAttendYear.Value = dpMonth.SelectedDate.Value.Year.ToString();
            ItemsGrid.Rebind();
        }

        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            ItemsGrid.MasterTableView.ExportToExcel();
        }
        protected void dlProvider_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
            e.Item.Text = ((DataRowView)e.Item.DataItem)["facility_name"].ToString();
            e.Item.Value = ((DataRowView)e.Item.DataItem)["provider_id_master"].ToString();
        }

        protected void dlProvider_DataBound(object sender, EventArgs e)
        {
            //set the initial footer label
            ((Literal)dlProvider.Footer.FindControl("providerCount")).Text = Convert.ToString(dlProvider.Items.Count);
        }

        protected void dlProvider_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            String sql = "SELECT top(30) provider_id_master,facility_name FROM [ServiceProviders_RX] WHERE facility_name LIKE '%" + e.Text.ToUpper() + "%'";
            providerSource.SelectCommand = sql;
            dlProvider.DataBind();
        }

        protected void btnUpdateCode_Click(object sender, EventArgs e)
        {
            string query = "update ClaimsDetails_MySql set ins_item_code = @ins_item_code where RowID=@RowID";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        command.Parameters.Add("@ins_item_code", SqlDbType.VarChar).Value = txtCode.Text;
                        command.Parameters.Add("@RowID", SqlDbType.Int).Value = hfItemId.Value;
                        rows = command.ExecuteNonQuery();
                        if (rows == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Code Updated Successfully', 'Success');", true);
                            ItemsGrid.Rebind();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewModal();", true);
                            txtCode.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }

        protected void ItemsGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "SetCode")
            {
                GridDataItem item = e.Item as GridDataItem;
                hfItemId.Value = item["RowID"].Text;
                //lblCompany.InnerText = item["Company"].Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "newModal();", true);
                e.Canceled = true;
            }
        }
    }
}