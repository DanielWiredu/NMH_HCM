using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using CrystalDecisions.Shared;


namespace NMH_HCM.Reports.MyHealth
{
    public partial class vwAdviceSlip : System.Web.UI.Page
    {
        rptAdviceSlip rpt = new rptAdviceSlip();
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AdviceSlipReport_Load(object sender, EventArgs e)
        {
            string hsp = Session["adviceProvider"].ToString();

            adapter = new SqlDataAdapter("select * from AdviceMyHealth where hsp = '" + hsp + "'", connection);
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            adapter.Fill(ds, "AdviceMyHealth");
            rpt.SetDataSource(ds);

            AdviceSlipReport.ReportSource = rpt;
        }
    }
}