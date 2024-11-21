using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        private string ConnectionString = "Provider=SQLOLEDB;Data Source=ACID-PC;Initial Catalog=agency;Integrated Security=SSPI;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SelectedApt"] != null)
                {
                    int selectedId = (int)Session["SelectedApt"];
                    FillFormWithSelectedData(selectedId);
                }
            }
        }

        protected void ButtonAddApartment_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (Session["SelectedApt"] != null)
                {
                    UpdateApartment();
                }
                else
                {
                    AddApartment();
                }
            }
            else
            {
                LabelError.Text = "Необходимо корректно заполнить все поля";
            }
        }

        private void AddApartment()
        {
            var Connection = new OleDbConnection(ConnectionString);

            try
            {
                Connection.Open();
                int idAptType = int.Parse(DropDownListAptType.SelectedValue);
                int idBuilding = int.Parse(DropDownListBuildingId.SelectedValue);
                int price = int.Parse(TextBoxPrice.Text);
                int floor = int.Parse(TextBoxFloor.Text);
                int rooms = int.Parse(TextBoxRooms.Text);
                decimal area = decimal.Parse(TextBoxArea.Text);
                int idStatusApt = int.Parse(DropDownListAptStatus.SelectedValue);
                int idOverhaul = int.Parse(DropDownListOverhaul.SelectedValue);
                string imageAptPlan = TextBoxImageAptPlan.Text;

                string query = "INSERT INTO Apartment (id_AptType, id_building, Price, Floor, Rooms, Area, id_StatusApt, id_Overhaul, ImageAptPlan) " +
                               "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

                var command = new OleDbCommand(query, Connection);

                command.Parameters.AddWithValue("?", idAptType);
                command.Parameters.AddWithValue("?", idBuilding);
                command.Parameters.AddWithValue("?", price);
                command.Parameters.AddWithValue("?", floor);
                command.Parameters.AddWithValue("?", rooms);
                command.Parameters.AddWithValue("?", area);
                command.Parameters.AddWithValue("?", idStatusApt);
                command.Parameters.AddWithValue("?", idOverhaul);
                command.Parameters.AddWithValue("?", imageAptPlan);

                command.ExecuteNonQuery();
                LabelError.Text = "Квартира успешно добавлена!";
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

        private void UpdateApartment()
        {
            var Connection = new OleDbConnection(ConnectionString);

            try
            {
                Connection.Open();
                int selectedId = (int)Session["SelectedApt"];
                int idAptType = int.Parse(DropDownListAptType.SelectedValue);
                int idBuilding = int.Parse(DropDownListBuildingId.SelectedValue);
                int price = int.Parse(TextBoxPrice.Text);
                int floor = int.Parse(TextBoxFloor.Text);
                int rooms = int.Parse(TextBoxRooms.Text);
                decimal area = decimal.Parse(TextBoxArea.Text);
                int idStatusApt = int.Parse(DropDownListAptStatus.SelectedValue);
                int idOverhaul = int.Parse(DropDownListOverhaul.SelectedValue);
                string imageAptPlan = TextBoxImageAptPlan.Text;

                string query = "UPDATE Apartment SET id_AptType = ?, id_building = ?, Price = ?, Floor = ?, Rooms = ?, Area = ?, " +
                               "id_StatusApt = ?, id_Overhaul = ?, ImageAptPlan = ? WHERE id_apt = ?";

                var command = new OleDbCommand(query, Connection);

                command.Parameters.AddWithValue("?", idAptType);
                command.Parameters.AddWithValue("?", idBuilding);
                command.Parameters.AddWithValue("?", price);
                command.Parameters.AddWithValue("?", floor);
                command.Parameters.AddWithValue("?", rooms);
                command.Parameters.AddWithValue("?", area);
                command.Parameters.AddWithValue("?", idStatusApt);
                command.Parameters.AddWithValue("?", idOverhaul);
                command.Parameters.AddWithValue("?", imageAptPlan);
                command.Parameters.AddWithValue("?", selectedId);

                command.ExecuteNonQuery();
                LabelError.Text = "Квартира успешно обновлена!";
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedId = (int)GridView1.SelectedValue;
            Session["SelectedApt"] = selectedId;
            FillFormWithSelectedData(selectedId);
        }

        private void FillFormWithSelectedData(int idApt)
        {
            var Connection = new OleDbConnection(ConnectionString);

            try
            {
                Connection.Open();

                string query = "SELECT * FROM Apartment WHERE id_apt = ?";
                var command = new OleDbCommand(query, Connection);
                command.Parameters.AddWithValue("?", idApt);

                var reader = command.ExecuteReader();
                if (reader.Read())
                {
                    DropDownListAptType.SelectedValue = reader["id_AptType"].ToString();
                    DropDownListBuildingId.SelectedValue = reader["id_building"].ToString();
                    TextBoxPrice.Text = reader["Price"].ToString();
                    TextBoxFloor.Text = reader["Floor"].ToString();
                    TextBoxRooms.Text = reader["Rooms"].ToString();
                    TextBoxArea.Text = reader["Area"].ToString();
                    DropDownListAptStatus.SelectedValue = reader["id_StatusApt"].ToString();
                    DropDownListOverhaul.SelectedValue = reader["id_Overhaul"].ToString();
                    TextBoxImageAptPlan.Text = reader["ImageAptPlan"].ToString();
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
}
