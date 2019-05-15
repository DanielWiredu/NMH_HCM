using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace NMH_HCM.UserCommands
{
    public partial class BulkSMS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            string receiver = "";
            string header = txtHeader.Text.Trim();
            string message = "";
            string telephone;
            int sentsms = 0; int failedsms = 0;
            foreach (GridDataItem item in memberGrid.Items)
            {
                telephone = item["MPhone"].Text;
                if (telephone.Length == 10)
                    receiver = telephone.Substring(1, 9);
                message = "Dear " + item["Firstname"].Text + ", " + txtMessage.Text;
                try
                {
                    string url = "https://deywuro.com/api/sms?" + 
                        "username=nmhinsurance" + 
                        "&password=pss4nmh2019" + 
                        "&source=" + header + 
                        "&destination=233" + receiver + 
                        "&message=" + message;

                    WebClient client = new WebClient();
                    string text = client.DownloadString(url);
                    //successWriter.WriteLine(DateTime.UtcNow.ToString() + "  " + telephone);
                    sentsms++;
                }
                catch (Exception ex)
                {
                    //failedWriter.WriteLine(DateTime.UtcNow.ToString() + "  " + telephone);
                    failedsms++;
                }
            }
            //successWriter.Close();
            //successWriter.Dispose();
            //failedWriter.Close();
            //failedWriter.Dispose();

            if (sentsms > 0)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sent", "toastr.success('" + sentsms + " Message(s) Sent Successfully','Success');", true);
            if (failedsms > 0)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "failed", "toastr.error('" + failedsms + " Message(s) could not be sent','Failed');", true);

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "log", "toastr.info('Check messaging log','Log');", true);

            txtMsg.Text = sentsms + " Sent, " + failedsms + " NOT Sent";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewModal();", true);
        }
    }
}