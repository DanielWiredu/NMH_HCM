using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NMH_HCM
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //txtMonthYear.Text += dpMonthYear.SelectedDate.Value.ToString("MMMM yyyy") + " ";
            //txtMonthYear.Text += dpMonthYear.SelectedDate.Value.ToString("MMM yyyy") + " ";

            //-> Check if url is valid 
            //string _url = txtMonthYear.Text;
            //WebRequest serverRequest = WebRequest.Create(_url);
            //WebResponse serverResponse;
            //try //Try to get response from server 
            //{
            //    serverResponse = serverRequest.GetResponse();
            //}
            //catch //If could not obtain any response 
            //{
            //    return 0;
            //}

            //WebClient _client = new WebClient();
            //_client.DownloadProgressChanged += new DownloadProgressChangedEventHandler(_client_DownloadProgressChanged);

            //_client.DownloadFileAsync(new Uri(_url), _destinationPath); //Download the file. 


            string memberid = "99999";
            string reference = txtMonthYear.Text;
            string referenceUrl = "";
            
            try
            {
                referenceUrl += "http://myhealth.nationwidemh.com/uploads/" + reference + "_1.jpg";
                WebRequest serverRequest = WebRequest.Create(referenceUrl);
                WebResponse serverResponse;
                using (var client = new WebClient())
                {
                    serverResponse = serverRequest.GetResponse();


                    //client.DownloadFile(referenceUrl, @"c:\myfile.txt");
                    client.DownloadFile(referenceUrl, @"M:\myHealthPics\" + memberid.ToString() + ".jpg");
                    byte[] imageData = client.DownloadData("file:///M:/myHealthPics/" + memberid + ".jpg");

                    txtMonthYear.Text = "Download and Save";
                    //string query = "insert into member_x_picture(onlinememberid,pic) values(@onlinememberid,@pic)";
                    //using (SqlConnection connection = new SqlConnection(connectionString))
                    //{
                    //    using (SqlCommand command = new SqlCommand(query, connection))
                    //    {
                    //        command.Parameters.Add("@onlinememberid", SqlDbType.Int).Value = memberid;
                    //        command.Parameters.Add("@pic", SqlDbType.Image).Value = imageData;
                    //        connection.Open();
                    //        command.ExecuteNonQuery();
                    //    }
                    //}
                }
            }
            catch (Exception ex)
            {
                txtMonthYear.Text = ex.Message.Replace("'", "").Replace("\r\n", "");
            }
        }
    }
}