using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NMH_HCM.ClaimsDashboard
{
    public partial class ClaimsAdviceByDateReceived : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //adviceGrid.Rebind();
            

        }

        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            adviceGrid.MasterTableView.ExportToExcel();
        }

        protected void adviceSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }
    }
}