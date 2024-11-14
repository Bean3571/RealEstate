<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ApartmentOrder.aspx.cs" Inherits="RealEstate.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id_apt" DataSourceID="DetailsViewDataSource" Height="50px" Width="411px" OnPageIndexChanging="DetailsView1_PageIndexChanging" Visible="False">
        <Fields>
            <asp:BoundField DataField="Price" HeaderText="Цена, руб" SortExpression="Price" />
            <asp:BoundField DataField="Floor" HeaderText="Этаж" SortExpression="Floor" />
            <asp:BoundField DataField="Rooms" HeaderText="Кол-во комнат" SortExpression="Rooms" />
            <asp:BoundField DataField="Area" HeaderText="Площадь, м2" SortExpression="Area" />
            <asp:BoundField DataField="NameAptType" HeaderText="Тип квартиры" SortExpression="NameAptType" />
            <asp:BoundField DataField="NameOverhaul" HeaderText="Отделка" SortExpression="NameOverhaul" />
            <asp:BoundField DataField="NameDistrict" HeaderText="Район" SortExpression="NameDistrict" />
            <asp:BoundField DataField="BuildingNumber" HeaderText="Номер дома" SortExpression="BuildingNumber" />
            <asp:BoundField DataField="NameBuildingType" HeaderText="Тип дома" SortExpression="NameBuildingType" />
            <asp:BoundField DataField="NameStage" HeaderText="Этап дома" SortExpression="NameStage" />
            <asp:BoundField DataField="NameStatusApt" HeaderText="Статус квартиры" SortExpression="NameStatusApt" />
            <asp:TemplateField HeaderText="Планировка">
                <ItemTemplate>
                    <img src='<%# Eval("ImageAptPlan") %>' alt="Планировка" style="width:200px;height:auto;" />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="DetailsViewDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT 
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
ORDER BY 
    apt.id_apt;
"></asp:SqlDataSource>
    <asp:Button ID="ButtonConfirmRequest" runat="server" OnClick="ButtonConfirmRequest_Click" Text="Подтвердить оформление" />
<br />
    <asp:Label ID="LabelError" runat="server"></asp:Label>
    <br />
</asp:Content>
