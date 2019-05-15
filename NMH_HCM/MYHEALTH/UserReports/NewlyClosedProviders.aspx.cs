using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NMH_HCM.MYHEALTH.UserReports
{
    public partial class NewlyClosedProviders : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["myHealthDBConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            newlyClosedGrid.ExportSettings.FileName = "MYHEALTH NEWLY CLOSED_" + DateTime.Now.ToString("dd-MMM-yyyy");
            newlyClosedGrid.MasterTableView.ExportToExcel();
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            string query = "update payment_table_rx set nmhpull = 1 where nmhpull = 0";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        rows = command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}