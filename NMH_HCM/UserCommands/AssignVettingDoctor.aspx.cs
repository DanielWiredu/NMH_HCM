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
    public partial class AssignVettingDoctor : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void providerGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Assign")
            {
                GridDataItem item = e.Item as GridDataItem;
                hfProviderId.Value = item["Id"].Text;
                lblServiceProvider.InnerText = item["ServiceProvider"].Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "newModal();", true);
                e.Canceled = true;
            }
            else if (e.CommandName == "Remove")
            {
                GridDataItem item = e.Item as GridDataItem;
                int providerId = Convert.ToInt32(item["Id"].Text);
                string query = "update ServiceProviders set DocID_OnlineVetting = 0 where ID=@Id";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        try
                        {
                            connection.Open();
                            command.Parameters.Add("@Id", SqlDbType.Int).Value = providerId;
                            int rows = command.ExecuteNonQuery();
                            if (rows == 1)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Doctor Removed Successfully', 'Success');", true);
                                providerGrid.Rebind();
                            }
                        }
                        catch (Exception ex)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                        }
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string query = "update ServiceProviders set DocID_OnlineVetting = @DocID_OnlineVetting where ID=@Id";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        command.Parameters.Add("@DocID_OnlineVetting", SqlDbType.Int).Value = dlDoctor.SelectedValue;
                        command.Parameters.Add("@Id", SqlDbType.Int).Value = hfProviderId.Value;
                        int rows = command.ExecuteNonQuery();
                        if (rows == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Doctor Assigend Successfully', 'Success');", true);
                            providerGrid.Rebind();
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

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            providerGrid.Rebind();
        }
    }
}