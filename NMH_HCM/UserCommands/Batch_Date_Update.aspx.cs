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

namespace NMH_HCM.UserCommands
{
    public partial class Batch_Date_Update : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdateDate_Click(object sender, EventArgs e)
        {
            string dateOfClaim = dpDateOfClaim.SelectedDate.Value.ToShortDateString() + " 12:00:00 AM";
            string query = "update ClaimsBatch set DateOfClaim=@DateOfClaim where ID=@BatchNo";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        command.Parameters.Add("@DateOfClaim", SqlDbType.DateTime).Value = dateOfClaim;
                        command.Parameters.Add("@BatchNo", SqlDbType.Int).Value = hfBatchNo.Value;
                        rows = command.ExecuteNonQuery();
                        if (rows == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Date Updated Successfully', 'Success');", true);
                            BatchGrid.Rebind();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewModal();", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BatchGrid.Rebind();
        }

        protected void BatchGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "ChangeDate")
            {
                GridDataItem item = e.Item as GridDataItem;
                hfBatchNo.Value = item["ID"].Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "newModal();", true);
                e.Canceled = true;
            }
        }
    }
}