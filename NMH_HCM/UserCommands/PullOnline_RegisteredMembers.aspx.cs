using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NMH_HCM.UserCommands
{
    public partial class PullOnline_RegisteredMembers : System.Web.UI.Page
    {
        //static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        static string destinationConnectionstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        static string sourceConnectionstring = ConfigurationManager.ConnectionStrings["onlineRegistrationConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPull_Click(object sender, EventArgs e)
        {
            bool hasInternet = CheckForInternetConnection();
            if (!hasInternet)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('No Internet Connection. Please try again later', 'Error');", true);
                return;
            }

            int lastRecord = 0;
            using (SqlConnection sourceConnection = new SqlConnection(sourceConnectionstring))
            {
                string sourceQuery = "select * from vwMembers_Pull";
                using (SqlCommand sourceCommand = new SqlCommand(sourceQuery, sourceConnection))
                {
                    try
                    {
                        SqlCommand command = new SqlCommand("select isnull(max(RowId),0) as lastrecord from Members_Pull", sourceConnection);
                        sourceConnection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            lastRecord = int.Parse(reader["lastrecord"].ToString());
                        }
                        reader.Close();
                        if (lastRecord == 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('No Member(s) Available', 'Error');", true);
                            return;
                        }

                        SqlDataReader sourceReader = sourceCommand.ExecuteReader();
                        //if (!sourceReader.HasRows)
                        //{
                        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('No Member(s) Available', 'Error');", true);
                        //    sourceReader.Close();
                        //    return;
                        //}

                        using (SqlConnection destinationConnection = new SqlConnection(destinationConnectionstring))
                        {
                            destinationConnection.Open();

                            using (SqlTransaction transaction = destinationConnection.BeginTransaction())
                            {
                                using (SqlBulkCopy bulkCopy = new SqlBulkCopy(destinationConnection, SqlBulkCopyOptions.KeepIdentity, transaction))
                                {
                                    bulkCopy.BulkCopyTimeout = 3600;
                                    bulkCopy.BatchSize = 10;
                                    bulkCopy.DestinationTableName = "dbo.Members_PulledOnline";

                                    // Write from the source to the destination. 
                                    // This should fail with a duplicate key error. 
                                    try
                                    {
                                        bulkCopy.WriteToServer(sourceReader);
                                        transaction.Commit();
                                        sourceReader.Close();

                                        //reset pulled members
                                        command = new SqlCommand("delete from Members_Pull where rowId <= @lastrecord", sourceConnection);
                                        command.Parameters.Add("@lastrecord", SqlDbType.Int).Value = lastRecord;
                                        command.CommandTimeout = 3600;
                                        int rows = command.ExecuteNonQuery();
                                        if (rows > 0)
                                        {
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Member(s) Pulled Successfully', 'Success');", true);
                                        }
                                        command.Dispose();
                                    }
                                    catch (Exception ex)
                                    {
                                        //Console.WriteLine(ex.Message);
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                                        transaction.Rollback();
                                    }
                                    finally
                                    {
                                        sourceReader.Close();
                                    }
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                    
                }
            }
        }
        public static bool CheckForInternetConnection()
        {
            try
            {
                using (var client = new WebClient())
                {
                    using (client.OpenRead("http://clients3.google.com/generate_204"))
                    {
                        return true;
                    }
                }
            }
            catch
            {
                return false;
            }
        }
    }
}