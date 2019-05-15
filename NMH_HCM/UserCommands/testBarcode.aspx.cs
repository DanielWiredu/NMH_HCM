using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace NMH_HCM.UserCommands
{
    public partial class testBarcode : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            string barCode = txtNumber.Text;
            System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
            using (Bitmap bitMap = new Bitmap(barCode.Length * 40, 80))
            {
                using (Graphics graphics = Graphics.FromImage(bitMap))
                {
                    Font oFont = new Font("IDAutomationHC39M", 16);
                    PointF point = new PointF(2f, 2f);
                    SolidBrush blackBrush = new SolidBrush(Color.Black);
                    SolidBrush whiteBrush = new SolidBrush(Color.White);
                    graphics.FillRectangle(whiteBrush, 0, 0, bitMap.Width, bitMap.Height);
                    graphics.DrawString("*" + barCode + "*", oFont, blackBrush, point);
                }
                byte[] byteImage;
                using (MemoryStream ms = new MemoryStream())
                {
                    bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    byteImage = ms.ToArray();

                    Convert.ToBase64String(byteImage);
                    imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                }
                plBarCode.Controls.Add(imgBarCode);

                SaveBarcode(barCode, byteImage);
            }
        }
        protected void SaveBarcode(string number, byte[] barcodeImage)
        {
            string query = "insert into tblBarcode(barcodeNo, barcodeImg) values(@barcodeNo, @barcodeImg)";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@barcodeNo", SqlDbType.VarChar).Value = number;
                    command.Parameters.Add("@barcodeImg", SqlDbType.Image).Value = barcodeImage;
                    try
                    {
                        connection.Open();
                        rows = command.ExecuteNonQuery();
                        if (rows > 0)
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "", "toastr.success('Barcode Saved Successfully', 'Success');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        string errormessage = ex.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + errormessage.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }

        protected void dlSNo_ItemSelected(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            string query = "select barcodeImg from tblBarcode where barcodeNo=@barcodeNo";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@barcodeNo", SqlDbType.VarChar).Value = dlSNo.SelectedValue;
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            byte[] byteImg = new byte[0];
                            if (!Convert.IsDBNull(reader["barcodeImg"]))
                                byteImg = (byte[])reader["barcodeImg"];
                            image.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImg);
                        }
                    }
                    catch (Exception ex)
                    {
                        string errormessage = ex.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + errormessage.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }
    }
}