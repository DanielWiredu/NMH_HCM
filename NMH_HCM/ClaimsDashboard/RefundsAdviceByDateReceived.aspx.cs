using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NMH_HCM.ClaimsDashboard
{
    public partial class RefundsAdviceByDateReceived : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //refundAdviceGrid.Rebind();
        }

        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            refundAdviceGrid.MasterTableView.ExportToExcel();
        }

        protected void refundAdviceSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }
    }
}