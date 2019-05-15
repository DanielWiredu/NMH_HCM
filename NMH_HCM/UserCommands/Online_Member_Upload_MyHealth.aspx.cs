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
    public partial class Online_Member_Upload_MyHealth : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["myHealthDBConnectionString"].ConnectionString;
        static string rxConnectionString = ConfigurationManager.ConnectionStrings["rxMyHealthConnectionString"].ConnectionString;
        int rows = 0;
        int success = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProcess_Click(object sender, EventArgs e)
        {
            string ins_company = "MYH";
            //string MemberID = "";
            string member_no = "";
            string member_plan = "";
            string surname = "";
            string othernames = "";
            string sex = "";
            DateTime date_of_birth = DateTime.Now;
            string telephone_no = "";
            string email = "";
            string employer = "";
            string employer_id = "";
            //DateTime expiry_date = DateTime.Now;
            string status = "";
            string card_serialno = "";
            string card_pin = "";
            string member_id = "";
            string rx_member_id = "";
            string principal_id = "";
            string member_type = "";
            string relationship_type = "";
            string insert_delete_status = "";
            string member_plan_id = "";
            double outpatient_limit = 0.0;
            double inpatient_limit = 0.0;
            //DateTime join_date = DateTime.Now;
            string primary_provider_id = "";


            foreach (GridDataItem item in memberGrid.Items)
            {
                //MemberID = item["autoid"].Text;
                member_no = item["membershipno"].Text;
                member_plan = item["InsurancePackage"].Text;
                surname = item["surname"].Text;
                othernames = item["firstname"].Text + " " + item["othername"].Text;
                sex = item["gender"].Text;
                date_of_birth = Convert.ToDateTime(item["dob"].Text);
                telephone_no = item["primary_mobile_no"].Text;
                email = item["email_address"].Text;
                employer = "MY HEALTH";
                employer_id = "1";
                //expiry_date = Convert.ToDateTime(item["expiry_date"].Text);
                status = item["ActiveStatus"].Text;
                card_serialno = item["card_serialno"].Text;
                card_pin = item["card_pin"].Text;
                member_id = item["autoid"].Text;
                rx_member_id = "MYH" + member_no;
                principal_id = item["PrincipalId"].Text;
                member_type = item["MemberType"].Text;
                relationship_type = item["Relationship"].Text;
                insert_delete_status = "new";
                member_plan_id = "0" + item["insurance_package_id"].Text;
                outpatient_limit = Convert.ToDouble(item["opd_limit"].Text);
                inpatient_limit = Convert.ToDouble(item["ip_limit"].Text);
                //join_date = Convert.ToDateTime(item["start_date"].Text);
                primary_provider_id = "1";

                string query = "";
                bool member_exists = Check_Online_Member_Exist(member_id);
                using (MySqlConnection mySqlConnection = new MySqlConnection(rxConnectionString))
                {
                    using (MySqlCommand mySqlCommand = new MySqlCommand())
                    {
                        if (member_exists == false)
                        {
                            //insert new member
                            query = "INSERT INTO patient_info (ins_company, member_no, member_plan, surname, othernames, sex, date_of_birth, telephone_no, email, employer, employer_id,";
                            query += "company_id, status, card_serial_num, card_pin, member_id, rx_member_id, principal_id, member_type, relationship_type,";
                            query += "insert_delete_status, member_plan_id, outpatient_limit, inpatient_limit, primary_provider_id) ";
                            query += "VALUES (@ins_company,@member_no,@member_plan,@surname,@othernames,@sex,@date_of_birth,@telephone_no,@email,@employer,@employer_id,";
                            query += "@company_id,@status,@card_serial_num,@card_pin,@member_id,@rx_member_id,@principal_id,@member_type,@relationship_type,";
                            query += "@insert_delete_status,@member_plan_id,@outpatient_limit,@inpatient_limit,@primary_provider_id)";

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
                            mySqlCommand.Parameters.Add("@employer_id", MySqlDbType.VarChar).Value = employer_id;
                            mySqlCommand.Parameters.Add("@company_id", MySqlDbType.VarChar).Value = employer_id;
                            //mySqlCommand.Parameters.Add("@expiry_date", MySqlDbType.DateTime).Value = expiry_date.ToString("yyyy-MM-dd");
                            mySqlCommand.Parameters.Add("@status", MySqlDbType.VarChar).Value = status;
                            mySqlCommand.Parameters.Add("@card_serial_num", MySqlDbType.VarChar).Value = card_serialno;
                            mySqlCommand.Parameters.Add("@card_pin", MySqlDbType.VarChar).Value = card_pin;
                            mySqlCommand.Parameters.Add("@member_id", MySqlDbType.VarChar).Value = member_id;
                            mySqlCommand.Parameters.Add("@rx_member_id", MySqlDbType.VarChar).Value = rx_member_id;
                            mySqlCommand.Parameters.Add("@principal_id", MySqlDbType.VarChar).Value = principal_id;
                            mySqlCommand.Parameters.Add("@member_type", MySqlDbType.VarChar).Value = member_type;
                            mySqlCommand.Parameters.Add("@relationship_type", MySqlDbType.VarChar).Value = relationship_type;
                            mySqlCommand.Parameters.Add("@insert_delete_status", MySqlDbType.VarChar).Value = insert_delete_status;
                            mySqlCommand.Parameters.Add("@member_plan_id", MySqlDbType.VarChar).Value = member_plan_id;
                            mySqlCommand.Parameters.Add("@outpatient_limit", MySqlDbType.Double).Value = outpatient_limit;
                            mySqlCommand.Parameters.Add("@inpatient_limit", MySqlDbType.Double).Value = inpatient_limit;
                            //mySqlCommand.Parameters.Add("@join_date", MySqlDbType.DateTime).Value = join_date;
                            mySqlCommand.Parameters.Add("@primary_provider_id", MySqlDbType.VarChar).Value = primary_provider_id;
                        }
                        else
                        {
                            //update existing member
                            query = "UPDATE patient_info SET ins_company=@ins_company, member_no=@member_no, member_plan=@member_plan, surname=@surname, othernames=@othernames, sex=@sex, date_of_birth=@date_of_birth, telephone_no=@telephone_no, email=@email, employer=@employer, employer_id=@employer_id,";
                            query += "company_id=@company_id, status=@status, card_serial_num=@card_serial_num, card_pin=@card_pin, rx_member_id=@rx_member_id, principal_id=@principal_id, member_type=@member_type, relationship_type=@relationship_type,";
                            query += "update_status=@update_status, member_plan_id=@member_plan_id, outpatient_limit=@outpatient_limit, inpatient_limit=@inpatient_limit, primary_provider_id=@primary_provider_id WHERE  member_id=@member_id";

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
                            mySqlCommand.Parameters.Add("@employer_id", MySqlDbType.VarChar).Value = employer_id;
                            mySqlCommand.Parameters.Add("@company_id", MySqlDbType.VarChar).Value = employer_id;
                            //mySqlCommand.Parameters.Add("@expiry_date", MySqlDbType.DateTime).Value = expiry_date.ToString("yyyy-MM-dd");
                            mySqlCommand.Parameters.Add("@status", MySqlDbType.VarChar).Value = status;
                            mySqlCommand.Parameters.Add("@card_serial_num", MySqlDbType.VarChar).Value = card_serialno;
                            mySqlCommand.Parameters.Add("@card_pin", MySqlDbType.VarChar).Value = card_pin;
                            mySqlCommand.Parameters.Add("@rx_member_id", MySqlDbType.VarChar).Value = rx_member_id;
                            mySqlCommand.Parameters.Add("@principal_id", MySqlDbType.VarChar).Value = principal_id;
                            mySqlCommand.Parameters.Add("@member_type", MySqlDbType.VarChar).Value = member_type;
                            mySqlCommand.Parameters.Add("@relationship_type", MySqlDbType.VarChar).Value = relationship_type;
                            //mySqlCommand.Parameters.Add("@insert_delete_status", MySqlDbType.VarChar).Value = insert_delete_status;
                            mySqlCommand.Parameters.Add("@update_status", MySqlDbType.VarChar).Value = "yes";
                            mySqlCommand.Parameters.Add("@member_plan_id", MySqlDbType.VarChar).Value = member_plan_id;
                            mySqlCommand.Parameters.Add("@outpatient_limit", MySqlDbType.Double).Value = outpatient_limit;
                            mySqlCommand.Parameters.Add("@inpatient_limit", MySqlDbType.Double).Value = inpatient_limit;
                            //mySqlCommand.Parameters.Add("@join_date", MySqlDbType.DateTime).Value = join_date;
                            mySqlCommand.Parameters.Add("@primary_provider_id", MySqlDbType.VarChar).Value = primary_provider_id;
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
                                        command.Parameters.Add("@ID", SqlDbType.Int).Value = member_id;
                                        connection.Open();
                                        success += command.ExecuteNonQuery();
                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                            return;
                        }
                    }
                }
            }

            if (rows > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "toastr.success('" + rows + " Member(s) Uploaded Successfully', 'Success');", true);
                memberGrid.Rebind();
            }
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