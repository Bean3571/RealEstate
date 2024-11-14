using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["id_AptType"] = null;
                Session["id_Overhaul"] = null;
                Session["AreaMin"] = null;
                Session["AreaMax"] = null;
                Session["PriceMin"] = null;
                Session["PriceMax"] = null;
            }
        }

        private void ApplyFilters()
        {
            try
            {
                List<string> filters = new List<string>();

                if (Session["id_AptType"] != null)
                    filters.Add("id_AptType = @id_AptType");

                if (Session["id_Overhaul"] != null)
                    filters.Add("id_Overhaul = @id_Overhaul");

                if (Session["AreaMin"] != null)
                    filters.Add("Area >= @AreaMin");

                if (Session["AreaMax"] != null)
                    filters.Add("Area <= @AreaMax");

                if (Session["PriceMin"] != null)
                    filters.Add("Price >= @PriceMin");

                if (Session["PriceMax"] != null)
                    filters.Add("Price <= @PriceMax");

                string whereClause = filters.Count > 0 ? " WHERE " + string.Join(" AND ", filters) : "";
                string query = "SELECT * FROM Apartment" + whereClause;

                ApartmentShortDataSource.SelectCommand = query;
                ApartmentShortDataSource.SelectParameters.Clear();

                if (Session["id_AptType"] != null)
                    ApartmentShortDataSource.SelectParameters.Add("id_AptType", Session["id_AptType"].ToString());

                if (Session["id_Overhaul"] != null)
                    ApartmentShortDataSource.SelectParameters.Add("id_Overhaul", Session["id_Overhaul"].ToString());

                if (Session["AreaMin"] != null)
                    ApartmentShortDataSource.SelectParameters.Add("AreaMin", Session["AreaMin"].ToString());

                if (Session["AreaMax"] != null)
                    ApartmentShortDataSource.SelectParameters.Add("AreaMax", Session["AreaMax"].ToString());

                if (Session["PriceMin"] != null)
                    ApartmentShortDataSource.SelectParameters.Add("PriceMin", Session["PriceMin"].ToString());

                if (Session["PriceMax"] != null)
                    ApartmentShortDataSource.SelectParameters.Add("PriceMax", Session["PriceMax"].ToString());

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                LabelDigitError.Text = ex.Message;
            }
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(DropDownListAptType.SelectedValue))
            {
                Session["id_AptType"] = null;
            }
            else
            {
                Session["id_AptType"] = DropDownListAptType.SelectedValue;
            }
            ApplyFilters();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(DropDownListOverhaul.SelectedValue))
            {
                Session["id_Overhaul"] = null;
            }
            else
            {
                Session["id_Overhaul"] = DropDownListOverhaul.SelectedValue;
            }
            ApplyFilters();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void AptTypeSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void ApartmentShortDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Session["id_Apt"] = GridView1.SelectedValue;

            DetailsView1.Visible = true;
            LabelMore.Visible = true;
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
                
                ButtonPlaceRequest.Visible = true;
            }
            catch (Exception ex2)
            {
                Label1.Text = ex2.Message;
                return;
            }

        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void TextBoxAreaMin_TextChanged(object sender, EventArgs e)
        {
            if (int.TryParse(TextBoxAreaMin.Text, out int areaMin))
            {
                Session["AreaMin"] = areaMin;
            }
            else
            {
                Session["AreaMin"] = null;
            }
            ApplyFilters();
        }

        protected void TextBoxAreaMax_TextChanged(object sender, EventArgs e)
        {
            if (int.TryParse(TextBoxAreaMax.Text, out int areaMax))
            {
                Session["AreaMax"] = areaMax;
            }
            else
            {
                Session["AreaMax"] = null;
            }
            ApplyFilters();
        }

        protected void TextBoxPriceMin_TextChanged(object sender, EventArgs e)
        {
            if (int.TryParse(TextBoxPriceMin.Text, out int priceMin))
            {
                Session["PriceMin"] = priceMin;
            }
            else
            {
                Session["PriceMin"] = null;
            }
            ApplyFilters();
        }

        protected void TextBoxPriceMax_TextChanged(object sender, EventArgs e)
        {
            if (int.TryParse(TextBoxPriceMax.Text, out int priceMax))
            {
                Session["PriceMax"] = priceMax;
            }
            else
            {
                Session["PriceMax"] = null;
            }
            ApplyFilters();
        }


        protected void ButtonClearFilters_Click1(object sender, EventArgs e)
        {
            TextBoxPriceMin.Text = "";
            TextBoxPriceMax.Text = "";
            TextBoxAreaMin.Text = "";
            TextBoxAreaMax.Text = "";
            DropDownListAptType.ClearSelection();
            DropDownListOverhaul.ClearSelection();

            Session["id_AptType"] = null;
            Session["id_Overhaul"] = null;
            Session["AreaMin"] = null;
            Session["AreaMax"] = null;
            Session["PriceMin"] = null;
            Session["PriceMax"] = null;

            ApartmentShortDataSource.SelectCommand = "SELECT * FROM Apartment WHERE id_StatusApt = 2";
            GridView1.DataBind();
        }

        protected void ButtonPlaceRequest_Click(object sender, EventArgs e)
        {
            string Suser;
            long IDU;
            IDU = Convert.ToInt32(Session["IDU"]);
            Suser = Convert.ToString(Session["SUser"]);

            if (IDU != 0){
                if (Session["id_Apt"] != null)
                {
                    Response.Redirect("ApartmentOrder.aspx");
                }
                else
                {
                    LabelRequestError.Text = "Квартира не выбрана";
                }
            }
            else
            {
                LabelRequestError.Text = "Для оформления необходимо войти в аккаунт";
            }

        }
    }
}