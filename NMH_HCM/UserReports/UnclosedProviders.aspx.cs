using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NMH_HCM.UserReports
{
    public partial class UnclosedProviders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            hfYearofClaim.Value = dpMonth.SelectedDate.Value.Year.ToString();
            hfMonthOfClaim.Value = dpMonth.SelectedDate.Value.Month.ToString();

            providerGrid.Rebind();
        }

        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            providerGrid.MasterTableView.ExportToExcel();
        }
    }
}