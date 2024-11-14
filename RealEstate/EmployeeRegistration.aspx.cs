using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                string name, surname, patronym, phone, email, login, password, roleID;
                
                name = TextBoxName.Text.ToString();
                surname = TextBoxSurname.Text.ToString();
                patronym = TextBoxPatronym.Text.ToString();
                phone = TextBoxPhone.Text.ToString();
                email = TextBoxEmail.Text.ToString();
                login = TextBoxLogin.Text.ToString();
                password = TextBoxPassword.Text.ToString();
                roleID = DropDownListRole.SelectedValue.ToString();

                string query = "INSERT INTO Employee (FirstNameE, LastNameE, PatronymE, PhoneE, EmailE, LoginE, PasswordE, id_EmpRole) " +
                               "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

                //LabelQuery.Text = query;

                var command = new OleDbCommand(query, Connection);

                command.Parameters.AddWithValue("?", name);
                command.Parameters.AddWithValue("?", surname);
                command.Parameters.AddWithValue("?", patronym);
                command.Parameters.AddWithValue("?", phone);
                command.Parameters.AddWithValue("?", email);
                command.Parameters.AddWithValue("?", login);
                command.Parameters.AddWithValue("?", password);
                command.Parameters.AddWithValue("?", roleID);

                try
                {
                    command.ExecuteNonQuery();
                    LabelError.Text = "Сотрудник успешно зарегистрирован!";
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