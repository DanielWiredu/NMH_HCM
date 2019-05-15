using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace NMH_HCM.UserReports
{
    public partial class Member_Claim_History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            claimGrid.Rebind();
        }

        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            claimGrid.MasterTableView.ExportToExcel();
        }
        protected void dlPrincipal_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
            e.Item.Text = ((DataRowView)e.Item.DataItem)["FullName"].ToString();
            e.Item.Value = ((DataRowView)e.Item.DataItem)["ID"].ToString();
        }

        protected void dlPrincipal_DataBound(object sender, EventArgs e)
        {
            //set the initial footer label
            ((Literal)dlPrincipal.Footer.FindControl("principalCount")).Text = Convert.ToString(dlPrincipal.Items.Count);
        }

        protected void dlPrincipal_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            String sql = "SELECT top(200) ID, MemberNo, FullName FROM [Vw_Members] WHERE FullName LIKE '%" + e.Text.ToUpper() + "%' OR MemberNo LIKE '%" + e.Text.ToUpper() + "%'";
            principalSource.SelectCommand = sql;
            dlPrincipal.DataBind();
        }
    }
}