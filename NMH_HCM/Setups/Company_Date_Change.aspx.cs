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

namespace NMH_HCM.Setups
{
    public partial class Company_Date_Change : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void companyGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "ChangeDate")
            {
                GridDataItem item = e.Item as GridDataItem;
                hfCompanyId.Value = item["ID"].Text;
                lblCompany.InnerText = item["Company"].Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "newModal();", true);
                e.Canceled = true;
            }
            else if (e.CommandName == "ResetDate")
            {
                GridDataItem item = e.Item as GridDataItem;
                string query = "update companies set expirydate = NULL where ID=@companyId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        try
                        {
                            connection.Open();
                            command.Parameters.Add("@companyId", SqlDbType.Int).Value = int.Parse(item["ID"].Text);
                            rows = command.ExecuteNonQuery();
                            if (rows == 1)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Expiry Date Removed Successfully', 'Success');", true);
                                companyGrid.Rebind();
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

        protected void btnUpdateDate_Click(object sender, EventArgs e)
        {
            string query = "update companies set expirydate = @expirydate where ID=@companyId";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        command.Parameters.Add("@expirydate", SqlDbType.Date).Value = dpExpiryDate.SelectedDate;
                        command.Parameters.Add("@companyId", SqlDbType.Int).Value = hfCompanyId.Value;
                        rows = command.ExecuteNonQuery();
                        if (rows == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Expiry Date Updated Successfully', 'Success');", true);
                            companyGrid.Rebind();
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
            companyGrid.Rebind();
        }
    }
}