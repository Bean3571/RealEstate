using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Suser, userType;
            long IDU;
            int userRole;

            IDU = Convert.ToInt32(Session["IDU"]);
            Suser = Convert.ToString(Session["SUser"]);
            userType = Convert.ToString(Session["UserType"]);
            userRole = Convert.ToInt32(Session["UserRole"]);

            if (IDU != 0)
            {
                ButtonLogin.Visible = false;
                ButtonLogout.Visible = true;
                TextBoxLogin.Visible = false;
                TextBoxPassword.Visible = false;
                LabelLogin.Visible = false;
                LabelPassword.Visible = false;
                LinkButtonRegister.Visible = false;
                LinkButtonEditProfile.Visible = true;
                LabelHello.Visible = true;

                LabelHello.Text = "Здравствуйте, " + Session["SUser"];


                if (userType == "Employee")
                {
                    if (userRole == 1)
                    {
                        LinkButtonManageReq.Visible = true;
                        LinkButtonAddApartment.Visible = true;
                        LinkButtonEditApartment.Visible = true;
                        LinkButtonRegEmp.Visible = true;
                    }
                    else if (userRole == 2)
                    {
                        LinkButtonManageReq.Visible = true;
                    }
                    else if (userRole == 3)
                    {
                        LinkButtonRegEmp.Visible = true;
                    }
                    else if (userRole == 3)
                    {
                        LinkButtonAddApartment.Visible = true;
                        LinkButtonEditApartment.Visible = true;
                    }
                    
                }
                else if (userType == "Client")
                {
                    LinkButtonMyReq.Visible = true;
                }

            }
            else
            {
                LabelHello.Visible = false;
                ButtonLogin.Visible = true;
                ButtonLogout.Visible = false;
                TextBoxLogin.Visible = true;
                TextBoxPassword.Visible = true;
                LabelLogin.Visible = true;
                LabelPassword.Visible = true;
                LinkButtonRegister.Visible = true;
                LinkButtonMyReq.Visible = false;
                LinkButtonEditProfile.Visible = false;

                LinkButtonAddApartment.Visible = false;
                LinkButtonEditApartment.Visible = false;
                LinkButtonManageReq.Visible = false;
                LinkButtonRegEmp.Visible = false;
            } 
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            string Suser, userType;
            long IDU;
            IDU = Convert.ToInt32(Session["IDU"]);
            Suser = Convert.ToString(Session["SUser"]);
            userType = Convert.ToString(Session["UserType"]);

            Session["IDU"] = 0;
            Session["Suser"] = "Logged out";
            if (IDU == 0)
            {
                LabelHello.Visible = false;
                ButtonLogin.Visible = true;
                ButtonLogout.Visible = false;
                TextBoxLogin.Visible = true;
                TextBoxPassword.Visible = true;
                LabelLogin.Visible = true;
                LabelPassword.Visible = true;
                LinkButtonRegister.Visible = true;
                LinkButtonMyReq.Visible = false;
                LinkButtonEditProfile.Visible = false;

                LinkButtonAddApartment.Visible = false;
                LinkButtonEditApartment.Visible = false;
                LinkButtonManageReq.Visible = false;
                LinkButtonRegEmp.Visible = false;

            }
            Response.Redirect("Main.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewsPage.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClientRegistration.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            LabelError.Text = "";
            string ConnectionString = "Provider=SQLOLEDB;Data Source=ACID-PC;Initial Catalog=agency;Integrated Security=SSPI;TrustServerCertificate=True";
            var Connection = new OleDbConnection(ConnectionString);
            try
            {
                Connection.Open();
            }
            catch (Exception ex)
            {
                LabelError.Text = ex.Message;
                Connection.Close();
                return;
            }
            string login, password;

            login = TextBoxLogin.Text.ToString();
            password = TextBoxPassword.Text.ToString();

            string query = "SELECT 'Client' AS UserType, id_Client AS UserId, FirstNameC AS FirstName, LastNameC AS LastName, 0 AS idRole " +
                           "FROM Client WHERE LoginC = ? AND PasswordC = ? " +
                           "UNION ALL " +
                           "SELECT 'Employee' AS UserType, id_Employee AS UserId, FirstNameE AS FirstName, LastNameE AS LastName, id_EmpRole AS idRole " +
                           "FROM Employee WHERE LoginE = ? AND PasswordE = ?";

            var command = new OleDbCommand(query, Connection);

            command.Parameters.AddWithValue("?", login);
            command.Parameters.AddWithValue("?", password);
            command.Parameters.AddWithValue("?", login);
            command.Parameters.AddWithValue("?", password);

            try
            {
                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    string userType = reader["UserType"].ToString();
                    string userId = reader["UserId"].ToString();
                    string firstName = reader["FirstName"].ToString();
                    //string lastName = reader["LastName"].ToString();
                    string role = reader["idRole"].ToString();

                    Session["UserType"] = userType;
                    Session["IDU"] = userId;
                    Session["Suser"] = firstName;
                    Session["UserRole"] = role;
                }
                else
                {
                    LabelError.Text = "Неверный логин или пароль.";
                }
            }
            catch (Exception ex)
            {
                LabelError.Text = ex.Message;
            }
            finally
            {
                if (Connection.State == System.Data.ConnectionState.Open)
                {
                    Connection.Close();
                }
            }

        }

        protected void LinkButton5_Click1(object sender, EventArgs e)
        {
            Response.Redirect("MyRequests.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditPersonalData.aspx");
        }

        protected void LinkButtonAddApartment_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddApartment.aspx");
        }

        protected void LinkButtonEditApartment_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditApartment.aspx");
        }

        protected void LinkButtonManageReq_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageRequests.aspx");
        }

        protected void LinkButtonRegEmp_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeRegistration.aspx");
        }
    }
}