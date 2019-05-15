using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace NMH_HCM.Refunds
{
    public partial class Refunds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            refundGrid.Rebind();
        }

        protected void refundGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                GridDataItem item = e.Item as GridDataItem;
                Response.Redirect("/Refunds/RefundDetails.aspx?refund_id=" + item["refund_id"].Text);
                e.Canceled = true;
            }
        }
    }
}