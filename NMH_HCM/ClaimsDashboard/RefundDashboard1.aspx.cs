using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NMH_HCM.ClaimsDashboard
{
    public partial class RefundDashboard1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void refundCountSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void refundClaimAmtSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void btnRunReport_Click(object sender, EventArgs e)
        {

        }
    }
}