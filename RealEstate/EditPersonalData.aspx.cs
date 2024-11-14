using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

                string query = "";
                string userType = Session["UserType"]?.ToString();
                int userID = Convert.ToInt32(Session["IDU"]);

                if (userType == "Client")
                {
                    query = "SELECT FirstNameC, LastNameC, PatronymC, PhoneC, EmailC, LoginC, PasswordC FROM Client WHERE id_Client = ?";
                }
                else if (userType == "Employee")
                {
                    query = "SELECT FirstNameE, LastNameE, PatronymE, PhoneE, EmailE, LoginE, PasswordE FROM Employee WHERE id_Employee = ?";
                }
                else
                {
                    LabelError.Text = "Invalid user type!";
                    Connection.Close();
                    return;
                }

                var command = new OleDbCommand(query, Connection);
                command.Parameters.AddWithValue("?", userID);

                try
                {
                    // Execute the command and read the data
                    using (var reader = command.ExecuteReader())
                    {
                        if (reader != null && reader.Read())
                        {
                            // Fill textboxes with the retrieved data
                            TextBoxName.Text = reader[0]?.ToString();     // FirstName
                            TextBoxSurname.Text = reader[1]?.ToString();  // LastName
                            TextBoxPatronym.Text = reader[2]?.ToString(); // Patronym
                            TextBoxPhone.Text = reader[3]?.ToString();    // Phone
                            TextBoxEmail.Text = reader[4]?.ToString();    // Email
                            TextBoxLogin.Text = reader[5]?.ToString();    // Login
                            TextBoxPassword.Text = reader[6]?.ToString(); // Password
                        }
                        else
                        {
                            LabelError.Text = "No data found for the specified user.";
                        }
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
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
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

                string userType = Session["UserType"]?.ToString();
                int userID = Convert.ToInt32(Session["IDU"]);

                string name = TextBoxName.Text.ToString();
                string surname = TextBoxSurname.Text.ToString();
                string patronym = TextBoxPatronym.Text.ToString();
                string phone = TextBoxPhone.Text.ToString();
                string email = TextBoxEmail.Text.ToString();
                string login = TextBoxLogin.Text.ToString();
                string password = TextBoxPassword.Text.ToString();

                string query = "";

                if (userType == "Client")
                {
                    query = "UPDATE Client SET FirstNameC = ?, LastNameC = ?, PatronymC = ?, PhoneC = ?, EmailC = ?, LoginC = ?, PasswordC = ? WHERE id_Client = ?";
                }
                else if (userType == "Employee")
                {
                    query = "UPDATE Employee SET FirstNameE = ?, LastNameE = ?, PatronymE = ?, PhoneE = ?, EmailE = ?, LoginE = ?, PasswordE = ? WHERE id_Employee = ?";
                }
                else
                {
                    LabelError.Text = "Invalid user type!";
                    Connection.Close();
                    return;
                }

                var command = new OleDbCommand(query, Connection);

                command.Parameters.AddWithValue("?", name);
                command.Parameters.AddWithValue("?", surname);
                command.Parameters.AddWithValue("?", patronym);
                command.Parameters.AddWithValue("?", phone);
                command.Parameters.AddWithValue("?", email);
                command.Parameters.AddWithValue("?", login);
                command.Parameters.AddWithValue("?", password);
                command.Parameters.AddWithValue("?", userID);

                try
                {
                    command.ExecuteNonQuery();
                    LabelError.Text = "Изменения успешно внесены!";
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
            else
            {
                LabelError.Text = "Необходимо корректно заполнить все поля";
            }
        }
    }
}
