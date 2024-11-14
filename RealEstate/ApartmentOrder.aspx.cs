using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                string crit;
                crit = @"SELECT 
                        apt.id_apt,
                        apt.Price,
                        apt.Floor,
                        apt.Rooms,
                        apt.Area,
                        apt.ImageAptPlan,
                        at.NameAptType,
                        b.BuildingNumber,
                        bt.NameBuildingType,
                        d.NameDistrict,
                        st.NameStage,
                        stapt.NameStatusApt,
                        o.NameOverhaul
                    FROM 
                        dbo.Apartment apt
                    LEFT JOIN 
                        dbo.AptType at ON apt.id_AptType = at.id_AptType
                    LEFT JOIN 
                        dbo.Building b ON apt.id_building = b.id_building
                    LEFT JOIN 
                        dbo.BuildingType bt ON b.id_BuildingType = bt.id_BuildingType
                    LEFT JOIN 
                        dbo.District d ON b.id_district = d.id_District
                    LEFT JOIN 
                        dbo.Stage st ON b.id_stage = st.id_stage
                    LEFT JOIN 
                        dbo.StatusApt stapt ON apt.id_StatusApt = stapt.id_StatusApt
                    LEFT JOIN 
                        dbo.Overhaul o ON apt.id_Overhaul = o.id_Overhaul
                    WHERE id_Apt =" + Session["id_Apt"];

                DetailsViewDataSource.SelectCommand = crit;
                DetailsView1.DataBind();
                DetailsView1.Visible = true;
            }
            catch (Exception ex2)
            {
                LabelError.Text = ex2.Message;
                return;
            }
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void ButtonConfirmRequest_Click(object sender, EventArgs e)
        {
            string connectionString = "Provider=SQLOLEDB;Data Source=ACID-PC;Initial Catalog=agency;Integrated Security=SSPI;TrustServerCertificate=True";
            var connection = new OleDbConnection(connectionString);

            int IDU = Convert.ToInt32(Session["IDU"]); 
            int idApt = Convert.ToInt32(Session["id_Apt"]);
            int price = Convert.ToInt32(DetailsView1.Rows[0].Cells[1].Text);

            try
            {
                connection.Open();
            }
            catch (Exception ex)
            {
                LabelError.Text = ex.Message;
                connection.Close();
                return;
            }


            OleDbTransaction transaction = connection.BeginTransaction();

            try
            {
                string insertRequestQuery = "INSERT INTO Request (id_Client, Value, id_Apt, id_StatusReq) VALUES (?, ?, ?, ?)";
                var insertCommand = new OleDbCommand(insertRequestQuery, connection);
                insertCommand.Transaction = transaction;

                insertCommand.Parameters.AddWithValue("?", IDU);
                insertCommand.Parameters.AddWithValue("?", price);
                insertCommand.Parameters.AddWithValue("?", idApt);
                insertCommand.Parameters.AddWithValue("?", 1);

                insertCommand.ExecuteNonQuery();

                string updateApartmentQuery = "UPDATE Apartment SET id_StatusApt = ? WHERE id_apt = ?";
                var updateCommand = new OleDbCommand(updateApartmentQuery, connection);
                updateCommand.Transaction = transaction;

                updateCommand.Parameters.AddWithValue("?", 3);
                updateCommand.Parameters.AddWithValue("?", idApt);

                updateCommand.ExecuteNonQuery();

                transaction.Commit();

                ButtonConfirmRequest.Visible = false;
                LabelError.Text = "Заявка успешно оформлена! Ожидайте ответа от агента";
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                LabelError.Text = "Error: " + ex.Message;
            }
            finally
            {
                if (connection.State == System.Data.ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }
    }
}