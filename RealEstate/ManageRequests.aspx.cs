using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridViewRequests_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SelectedRequest"] = GridViewRequests.SelectedValue;
        }

        protected void ButtonUpdateStatus_Click(object sender, EventArgs e)
        {
            if (Session["SelectedRequest"] != null)
            {
                int selectedRequestId = Convert.ToInt32(Session["SelectedRequest"]);
                int newStatusId = int.Parse(DropDownListUpdateStatus.SelectedValue);

                string connectionString = "Provider=SQLOLEDB;Data Source=ACID-PC;Initial Catalog=agency;Integrated Security=SSPI;TrustServerCertificate=True";
                using (var connection = new OleDbConnection(connectionString))
                {
                    try
                    {
                        connection.Open();
                        string updateQuery = "UPDATE Request SET id_StatusReq = ? WHERE id_Request = ?";
                        var command = new OleDbCommand(updateQuery, connection);

                        command.Parameters.AddWithValue("?", newStatusId);
                        command.Parameters.AddWithValue("?", selectedRequestId);

                        command.ExecuteNonQuery();
                        LabelMessage.Text = "Статус заявки успешно обновлен!";
                    }
                    catch (Exception ex)
                    {
                        LabelMessage.Text = ex.Message;
                    }
                }
            }
            else
            {
                LabelMessage.Text = "Выберите заявку для обновления статуса";
            }
            GridViewRequests.DataBind();

        }

        protected void DropDownListUpdateStatus_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}