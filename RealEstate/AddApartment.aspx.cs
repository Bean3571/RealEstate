using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAddApartment_Click(object sender, EventArgs e)
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
                string mypath, myfile, filename, myimg;
                myimg = "images\\";
                mypath = Request.PhysicalApplicationPath;
                myfile = FileUpload1.FileName;
                filename = mypath + myimg + myfile;
                if (FileUpload1.HasFile == true)
                {
                    FileUpload1.SaveAs(filename);
                }
                int idAptType = int.Parse(DropDownListAptType.SelectedValue);
                int idBuilding = int.Parse(DropDownListBuildingId.SelectedValue);
                int price = int.Parse(TextBoxPrice.Text);
                int floor = int.Parse(TextBoxFloor.Text);
                int rooms = int.Parse(TextBoxRooms.Text);
                decimal area = decimal.Parse(TextBoxArea.Text);
                int idStatusApt = int.Parse(DropDownListAptStatus.SelectedValue);
                int idOverhaul = int.Parse(DropDownListOverhaul.SelectedValue);
                //string imageAptPlan = TextBoxImageAptPlan.Text;
                string imageAptPlan = myimg + myfile;

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

                try
                {
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
            else
            {
                LabelError.Text = "Необходимо корректно заполнить все поля";
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SelectedDistrict"] = ListBox1.SelectedValue;
        }

        protected void ListBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SelectedStreet"] = ListBox2.SelectedValue;
        }
    }
}