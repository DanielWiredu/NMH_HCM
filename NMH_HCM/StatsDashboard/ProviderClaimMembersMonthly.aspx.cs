using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NMH_HCM.StatsDashboard
{
    public partial class ProviderClaimMembersMonthly : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            claimsGrid.MasterTableView.ExportToExcel();
        }

        protected void btnRun_Click(object sender, EventArgs e)
        {
            //claimsGrid.Rebind();
        }

        protected void btnExcelExportClaimNumbers_Click(object sender, EventArgs e)
        {
            claimNumbersGrid.MasterTableView.ExportToExcel();
        }

        protected void btnExcelExportClaimAmount_Click(object sender, EventArgs e)
        {
            claimAmountGrid.MasterTableView.ExportToExcel();
        }

        protected void claimSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void claimNumberSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void claimAmountSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }
    }
}