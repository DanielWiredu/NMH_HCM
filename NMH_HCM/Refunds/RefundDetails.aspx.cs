using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;
using MySql.Data.MySqlClient;

namespace NMH_HCM.Refunds
{
    public partial class RefundDetails : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["rxConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string refund_id = Request.QueryString["refund_id"].ToString();
                string query = "select member_no, receipt_no, mm_name, mm_number, update_time, refund_id from refund where refund_id = @refund_id";
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        command.Parameters.Add("@refund_id", MySqlDbType.Int32).Value = refund_id;
                        try
                        {
                            connection.Open();
                            MySqlDataReader reader = command.ExecuteReader();
                            if (reader.Read())
                            {
                                txtMemberNo.Text = reader["member_no"].ToString();
                                txtReceiptNo.Text = reader["receipt_no"].ToString();
                                txtMMName.Text = reader["mm_name"].ToString();
                                txtMMNumber.Text = reader["mm_number"].ToString();
                                txtUpdateTime.Text = reader["update_time"].ToString();
                                txtRefundId.Text = reader["refund_id"].ToString();                                
                            }
                            reader.Close();
                        }
                        catch (Exception ex)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "','Error');", true);
                        }
                    }
                }
            }
        }
    }
}