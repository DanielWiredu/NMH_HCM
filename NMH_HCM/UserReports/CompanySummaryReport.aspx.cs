using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NMH_HCM.UserReports
{
    public partial class CompanySummaryReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            RadGrid1.ExportSettings.FileName = "Company Summary - " + DateTime.Now;
            RadGrid1.MasterTableView.ExportToExcel();
        }
    }
}