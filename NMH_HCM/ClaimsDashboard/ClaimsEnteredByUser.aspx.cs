using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NMH_HCM.ClaimsDashboard
{
    public partial class ClaimsEnteredByUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //hfStartDate.Value = dpStartDate.SelectedDate.Value.ToString();
            //hfEndDate.Value = dpEndDate.SelectedDate.Value.ToShortDateString() + " 11:59:59 PM";

            //claimsGrid.Rebind();
        }

        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            //hfStartDate.Value = dpStartDate.SelectedDate.Value.ToString();
            //hfEndDate.Value = dpEndDate.SelectedDate.Value.ToShortDateString() + " 11:59:59 PM";

            claimsGrid.MasterTableView.ExportToExcel();
        }

        protected void claimSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }
    }
}