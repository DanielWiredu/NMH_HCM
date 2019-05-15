using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace NMH_HCM
{
    public class Global : System.Web.HttpApplication
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        static string RXconnectionString = ConfigurationManager.ConnectionStrings["rxConnectionString"].ConnectionString;
        protected void Application_Start(object sender, EventArgs e)
        {
            //Thread thread = new Thread(CronThread);
            //thread.IsBackground = true;
            //thread.Start();

            //Thread thread2 = new Thread(CronThread2);
            //thread2.IsBackground = true;
            //thread2.Start();
        }
        private void CronThread()
        {
            while (true)
            {
                Thread.Sleep(TimeSpan.FromMinutes(15));
                // Do something every half hour
                WebRequest request = HttpWebRequest.Create("http://nmhsvr1:85/rxclaim_insurance/syncall/pull_payment_table.php");
                WebResponse response = request.GetResponse();

                WebRequest request2 = HttpWebRequest.Create("http://nmhsvr1:85/rxclaim_insurance/syncall/pull_payment_detail_table.php");
                WebResponse response2 = request2.GetResponse();

                WebRequest request3 = HttpWebRequest.Create("http://nmhsvr1:85/rxclaim_insurance/syncall/composite_push.php");
                WebResponse response3 = request3.GetResponse();

                WebRequest request4 = HttpWebRequest.Create("http://nmhsvr1:85/rxclaim_insurance/syncall/composite_update.php");
                WebResponse response4 = request4.GetResponse();

                using (MySqlConnection sourceConnection = new MySqlConnection(RXconnectionString))
                {
                    //string sourceQuery = "select * from member_payment_logs where id > @maxMemberId order by id";
                    string sourceQuery = "select * from payment_table where nmhpull = 0";
                    using (MySqlCommand sourceCommand = new MySqlCommand(sourceQuery, sourceConnection))
                    {
                        sourceConnection.Open();
                        MySqlDataReader sourceReader = sourceCommand.ExecuteReader();
                        if (!sourceReader.HasRows)
                        {
                            sourceReader.Close();
                            return;
                        }
                        using (SqlConnection destinationConnection = new SqlConnection(connectionString))
                        {
                            destinationConnection.Open();

                            using (SqlTransaction transaction = destinationConnection.BeginTransaction())
                            {
                                using (SqlBulkCopy bulkCopy = new SqlBulkCopy(destinationConnection, SqlBulkCopyOptions.KeepIdentity, transaction))
                                {
                                    bulkCopy.BatchSize = 100;
                                    bulkCopy.DestinationTableName = "dbo.payment_table_rx";

                                    // Write from the source to the destination. 
                                    // This should fail with a duplicate key error. 
                                    try
                                    {
                                        bulkCopy.WriteToServer(sourceReader);
                                        transaction.Commit();

                                        MySqlConnection connection = new MySqlConnection(RXconnectionString);
                                        MySqlCommand command = new MySqlCommand("update payment_table set nmhpull = 1 where nmhpull = 0", connection);
                                        connection.Open();
                                        command.ExecuteNonQuery();
                                        command.Dispose();
                                        connection.Dispose();
                                    }
                                    catch (Exception ex)
                                    {
                                        //Console.WriteLine(ex.Message);
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
                }
            }
        }
        //private void CronThread2()
        //{
        //    while (true)
        //    {
        //        Thread.Sleep(TimeSpan.FromMinutes(60));
        //        // Do something every half hour
        //        WebRequest request = HttpWebRequest.Create("http://nmhsvr1:85/rxclaim_insurance/syncall/composite_push.php");
        //        WebResponse response = request.GetResponse();

        //        WebRequest request2 = HttpWebRequest.Create("http://nmhsvr1:85/rxclaim_insurance/syncall/composite_update.php");
        //        WebResponse response2 = request2.GetResponse();
        //    }
        //}
    }
}