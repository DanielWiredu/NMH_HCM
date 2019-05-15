using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace NMH_HCM.Setups
{
    public partial class Plan_Benefit_Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            planGrid.Rebind();
        }

        protected void planGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Benefits")
            {
                GridDataItem item = e.Item as GridDataItem;
                Response.Redirect("/Setups/Plan_Benefit.aspx?pid=" + item["PlanId"].Text);
            }
        }
    }
}