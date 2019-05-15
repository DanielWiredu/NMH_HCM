using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace NMH_HCM.UserReports
{
    public partial class OnlineMemberRegistration : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["rxConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void memberGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Complete")
            {
                GridDataItem item = e.Item as GridDataItem;
                string Id = item["id"].Text;

                string query = "update patient_info_registration set pull_status = 1 where id = @id";
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        command.Parameters.Add("@id", MySqlDbType.Int32).Value = Id;
                        try
                        {
                            connection.Open();
                            rows = command.ExecuteNonQuery();
                            if (rows == 1)
                            {
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "", "toastr.success('Completed Successfully', 'Success');", true);
                                memberGrid.Rebind();
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

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            memberGrid.Rebind();
        }

        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            memberGrid.MasterTableView.ExportToExcel();
        }

        protected void memberGrid_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                if (item["pull_status"].Text == "2")
                {
                    item.BackColor = Color.LightPink;
                }
            }
        }
    }
}