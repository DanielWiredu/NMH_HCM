﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace NMH_HCM.UserReports
{
    public partial class Provider_Claims_Details_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dpStartDate.SelectedDate = DateTime.Now;
                dpEndDate.SelectedDate = DateTime.Now;
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            claimsGrid.Rebind();
        }

        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            claimsGrid.MasterTableView.ExportToExcel();
        }
        protected void dlProvider_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
            e.Item.Text = ((DataRowView)e.Item.DataItem)["ServiceProvider"].ToString();
            e.Item.Value = ((DataRowView)e.Item.DataItem)["ID"].ToString();
        }

        protected void dlProvider_DataBound(object sender, EventArgs e)
        {
            //set the initial footer label
            ((Literal)dlProvider.Footer.FindControl("providerCount")).Text = Convert.ToString(dlProvider.Items.Count);
        }

        protected void dlProvider_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            String sql = "SELECT top(30) ID, ServiceProvider FROM [ServiceProviders] WHERE ServiceProvider LIKE '%" + e.Text.ToUpper() + "%'";
            providerSource.SelectCommand = sql;
            dlProvider.DataBind();
        }
    }
}