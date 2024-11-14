<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MyRequests.aspx.cs" Inherits="RealEstate.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_Request" DataSourceID="MyRequestsDataSource">
    <Columns>
        <asp:BoundField DataField="id_Request" HeaderText="Номер заявки" InsertVisible="False" ReadOnly="True" SortExpression="id_Request" />
        <asp:BoundField DataField="id_Client" HeaderText="Номер клиента" SortExpression="id_Client" />
        <asp:BoundField DataField="Value" HeaderText="Стоимость" SortExpression="Value" />
        <asp:BoundField DataField="NameStatusReq" HeaderText="Статус заявки" SortExpression="NameStatusReq" />
        <asp:BoundField DataField="NameAptType" HeaderText="Тип  квартиры" SortExpression="NameAptType" />
        <asp:BoundField DataField="Area" HeaderText="Площадь, м2" SortExpression="Area" />
        <asp:BoundField DataField="Rooms" HeaderText="Кол-во комнат" SortExpression="Rooms" />
        <asp:TemplateField HeaderText="Планировка" SortExpression="ImageAptPlan">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ImageAptPlan") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageAptPlan") %>' Width="500px" Height="300px" />
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="MyRequestsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT Request.id_Request, Request.id_Client, Request.Value, Request.id_Apt, Request.id_StatusReq, StatusRequest.NameStatusReq, AptType.NameAptType, Apartment.ImageAptPlan, Apartment.Area, Apartment.Rooms FROM Request INNER JOIN StatusRequest ON Request.id_StatusReq = StatusRequest.id_StatusReq INNER JOIN Apartment ON Request.id_Apt = Apartment.id_apt INNER JOIN AptType ON Apartment.id_AptType = AptType.id_AptType WHERE (Request.id_Client = @id_Client)">
    <SelectParameters>
        <asp:SessionParameter Name="id_Client" SessionField="IDU" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
