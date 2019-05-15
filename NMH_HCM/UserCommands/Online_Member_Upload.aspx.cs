using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.Data;

namespace NMH_HCM.UserCommands
{
    public partial class Online_Member_Upload : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        static string rxConnectionString  = ConfigurationManager.ConnectionStrings["rxConnectionString"].ConnectionString;
        int rows = 0;
        int success = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProcess_Click(object sender, EventArgs e)
        {
            string ins_company = "NMH";
            string MemberID = "";
            string member_no = "";
            string member_plan = "";
            string surname = "";
            string othernames = "";
            string sex = "";
            DateTime date_of_birth = DateTime.Now;
            string telephone_no = "";
            string email = "";
            string employer = "";
            DateTime expiry_date = DateTime.Now;
            string status = "";
            string member_id = "";
            string rx_member_id = "";
            string insert_delete_status = "";
            string employer_id = "";
            string member_plan_id = "";

            string card_pin = "";
            string member_type = "";
            string relationship_type = "";
            string principal_id = "";

            foreach (GridDataItem item in memberGrid.Items)
            {
                MemberID = item["member_id"].Text;
                member_no = item["member_no"].Text;
                member_plan = item["member_plan"].Text;
                surname = item["surname"].Text;
                othernames = item["othernames"].Text;
                sex = item["sex"].Text;
                date_of_birth = Convert.ToDateTime(item["date_of_birth"].Text);
                telephone_no = item["telephone_no"].Text;
                email = item["email"].Text;
                employer = item["employer"].Text;
                expiry_date = Convert.ToDateTime(item["expiry_date"].Text);
                status = item["status"].Text;
                member_id = item["member_id"].Text;
                rx_member_id = item["rx_member_id"].Text;
                insert_delete_status = item["insert_delete_status"].Text;
                employer_id = item["CompanyID"].Text;
                member_plan_id = item["PlanID"].Text;

                card_pin = item["cardPin"].Text;
                member_type = item["MemberType"].Text;
                relationship_type = item["Relationship"].Text;
                principal_id = item["PrincipalID"].Text;

                string query = "";
                bool member_exists = Check_Online_Member_Exist(member_id);
                using (MySqlConnection mySqlConnection = new MySqlConnection(rxConnectionString))
                {
                    using (MySqlCommand mySqlCommand = new MySqlCommand())
                    {
                        if (member_exists == false)
                        {
                            //insert new member
                            query = "INSERT INTO patient_info(`ins_company`,`member_no`,`member_plan`,`surname`,`othernames`,`sex`,`date_of_birth`,`telephone_no`,`email`,`employer`,";
                            query += "`expiry_date`,`status`,`member_id`,`rx_member_id`,`insert_delete_status`,`employer_id`,`member_plan_id`,`card_pin`,`principal_id`,`member_type`,`relationship_type`) ";
                            query += "VALUES(@ins_company,@member_no,@member_plan,@surname,@othernames,@sex,@date_of_birth,@telephone_no,@email,@employer,";
                            query += "@expiry_date,@status,@member_id,@rx_member_id,@insert_delete_status,@employer_id,@member_plan_id,@card_pin,@principal_id,@member_type,@relationship_type)";

                            mySqlCommand.Parameters.Add("@ins_company", MySqlDbType.VarChar).Value = ins_company;
                            mySqlCommand.Parameters.Add("@member_no", MySqlDbType.VarChar).Value = member_no;
                            mySqlCommand.Parameters.Add("@member_plan", MySqlDbType.VarChar).Value = member_plan;
                            mySqlCommand.Parameters.Add("@surname", MySqlDbType.VarChar).Value = surname;
                            mySqlCommand.Parameters.Add("@othernames", MySqlDbType.VarChar).Value = othernames;
                            mySqlCommand.Parameters.Add("@sex", MySqlDbType.VarChar).Value = sex;
                            mySqlCommand.Parameters.Add("@date_of_birth", MySqlDbType.DateTime).Value = date_of_birth.ToString("yyyy-MM-dd");
                            mySqlCommand.Parameters.Add("@telephone_no", MySqlDbType.VarChar).Value = telephone_no;
                            mySqlCommand.Parameters.Add("@email", MySqlDbType.VarChar).Value = email;
                            mySqlCommand.Parameters.Add("@employer", MySqlDbType.VarChar).Value = employer;
                            mySqlCommand.Parameters.Add("@expiry_date", MySqlDbType.DateTime).Value = expiry_date.ToString("yyyy-MM-dd");
                            mySqlCommand.Parameters.Add("@status", MySqlDbType.VarChar).Value = "Active";
                            mySqlCommand.Parameters.Add("@member_id", MySqlDbType.VarChar).Value = member_id;
                            mySqlCommand.Parameters.Add("@rx_member_id", MySqlDbType.VarChar).Value = rx_member_id;
                            mySqlCommand.Parameters.Add("@insert_delete_status", MySqlDbType.VarChar).Value = insert_delete_status;
                            mySqlCommand.Parameters.Add("@employer_id", MySqlDbType.VarChar).Value = employer_id;
                            mySqlCommand.Parameters.Add("@member_plan_id", MySqlDbType.VarChar).Value = member_plan_id;
                            mySqlCommand.Parameters.Add("@card_pin", MySqlDbType.VarChar).Value = card_pin;
                            mySqlCommand.Parameters.Add("@principal_id", MySqlDbType.VarChar).Value = principal_id;
                            mySqlCommand.Parameters.Add("@member_type", MySqlDbType.VarChar).Value = member_type;
                            mySqlCommand.Parameters.Add("@relationship_type", MySqlDbType.VarChar).Value = relationship_type;
                        }
                        else
                        {
                            query = "Update patient_info set `ins_company`=@ins_company,`member_no`=@member_no,`member_plan`=@member_plan,`surname`=@surname,`othernames`=@othernames,`sex`=@sex,";
                            query += "`date_of_birth`=@date_of_birth,`telephone_no`=@telephone_no,`email`=@email,`employer`=@employer,`expiry_date`=@expiry_date,`status`=@status,";
                            query += "`rx_member_id`=@rx_member_id,`update_status`=@update_status',`employer_id`=@employer_id,`member_plan_id`=@member_plan_id,`principal_id`=@principal_id,";
                            query += "`member_type`=@member_type,`relationship_type`=@relationship_type WHERE member_id=@member_id";

                            mySqlCommand.Parameters.Add("@ins_company", MySqlDbType.VarChar).Value = ins_company;
                            mySqlCommand.Parameters.Add("@member_no", MySqlDbType.VarChar).Value = member_no;
                            mySqlCommand.Parameters.Add("@member_plan", MySqlDbType.VarChar).Value = member_plan;
                            mySqlCommand.Parameters.Add("@surname", MySqlDbType.VarChar).Value = surname;
                            mySqlCommand.Parameters.Add("@othernames", MySqlDbType.VarChar).Value = othernames;
                            mySqlCommand.Parameters.Add("@sex", MySqlDbType.VarChar).Value = sex;
                            mySqlCommand.Parameters.Add("@date_of_birth", MySqlDbType.DateTime).Value = date_of_birth.ToString("yyyy-MM-dd");
                            mySqlCommand.Parameters.Add("@telephone_no", MySqlDbType.VarChar).Value = telephone_no;
                            mySqlCommand.Parameters.Add("@email", MySqlDbType.VarChar).Value = email;
                            mySqlCommand.Parameters.Add("@employer", MySqlDbType.VarChar).Value = employer;
                            mySqlCommand.Parameters.Add("@expiry_date", MySqlDbType.DateTime).Value = expiry_date.ToString("yyyy-MM-dd");
                            mySqlCommand.Parameters.Add("@status", MySqlDbType.VarChar).Value = "Active";
                            mySqlCommand.Parameters.Add("@rx_member_id", MySqlDbType.VarChar).Value = rx_member_id;
                            mySqlCommand.Parameters.Add("@update_status", MySqlDbType.VarChar).Value = "yes";
                            mySqlCommand.Parameters.Add("@employer_id", MySqlDbType.VarChar).Value = employer_id;
                            mySqlCommand.Parameters.Add("@member_plan_id", MySqlDbType.VarChar).Value = member_plan_id;
                            //mySqlCommand.Parameters.Add("@card_pin", MySqlDbType.VarChar).Value = card_pin;
                            mySqlCommand.Parameters.Add("@principal_id", MySqlDbType.VarChar).Value = principal_id;
                            mySqlCommand.Parameters.Add("@member_type", MySqlDbType.VarChar).Value = member_type;
                            mySqlCommand.Parameters.Add("@relationship_type", MySqlDbType.VarChar).Value = relationship_type;
                            mySqlCommand.Parameters.Add("@member_id", MySqlDbType.VarChar).Value = member_id;
                        }

                        try
                        {
                            mySqlCommand.Connection = mySqlConnection;
                            mySqlCommand.CommandText = query;
                            mySqlConnection.Open();
                            success = mySqlCommand.ExecuteNonQuery();
                            if (success == 1)
                            {
                                rows++;
                                using (SqlConnection connection = new SqlConnection(connectionString))
                                {
                                    using (SqlCommand command = new SqlCommand("Update_Member_Upload", connection))
                                    {
                                        command.CommandType = CommandType.StoredProcedure;
                                        command.Parameters.Add("@ID", SqlDbType.VarChar).Value = member_id;
                                        connection.Open();
                                        success += command.ExecuteNonQuery();
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

            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('"+ rows + " Members Uploaded Successfully', 'Success');", true);
            memberGrid.Rebind();
        }
        
        protected bool Check_Online_Member_Exist(string member_id)
        {
            bool exist = false;
            string query = "SELECT member_id  FROM `patient_info` WHERE `member_id` ='" + member_id + "'";
            using (MySqlConnection mySqlConnection = new MySqlConnection(rxConnectionString))
            {
                using (MySqlCommand mySqlCommand = new MySqlCommand(query, mySqlConnection))
                {
                    try
                    {
                        mySqlConnection.Open();
                        MySqlDataReader reader = mySqlCommand.ExecuteReader();
                        if (reader.Read())
                        {
                            exist = true;
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
            return exist;
        }
    }
}