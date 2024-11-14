<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageRequests.aspx.cs" Inherits="RealEstate.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="left" class="auto-style1">
        <tr>
            <td style="height: 308px">
                <asp:GridView ID="GridViewRequests" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id_Request" DataSourceID="RequestsDataSource" 
                    OnSelectedIndexChanged="GridViewRequests_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField SelectText="Выбрать" ShowSelectButton="True" />
                        <asp:BoundField DataField="id_Request" HeaderText="id Заявки" ReadOnly="True" SortExpression="id_Request" InsertVisible="False" />
                        <asp:BoundField DataField="Value" HeaderText="Сумма" SortExpression="Value" />
                        <asp:BoundField DataField="NameStatusReq" HeaderText="Статус заявки" SortExpression="NameStatusReq" />
                        <asp:BoundField DataField="id_Client" HeaderText="id Клиента" SortExpression="id_Client" />
                        <asp:BoundField DataField="LastNameC" HeaderText="Фамилия" SortExpression="LastNameC" />
                        <asp:BoundField DataField="FirstNameC" HeaderText="Имя" SortExpression="FirstNameC" />
                        <asp:BoundField DataField="PatronymC" HeaderText="Отчество" SortExpression="PatronymC" />
                        <asp:BoundField DataField="PhoneC" HeaderText="Телефон" SortExpression="PhoneC" />
                        <asp:BoundField DataField="EmailC" HeaderText="Почта" SortExpression="EmailC" />
                        <asp:BoundField DataField="id_Apt" HeaderText="id Квартиры" SortExpression="id_Apt" />
                        <asp:BoundField DataField="NameAptType" HeaderText="Тип квартиры" SortExpression="NameAptType" />
                        <asp:BoundField DataField="Area" HeaderText="Площадь" SortExpression="Area" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="RequestsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>"
                    SelectCommand="SELECT Request.id_Request, Request.id_Client, Request.Value, Request.id_Apt, Request.id_StatusReq, StatusRequest.NameStatusReq, Client.FirstNameC, Client.LastNameC, Client.PatronymC, Client.PhoneC, Client.EmailC, Apartment.Area, AptType.NameAptType FROM Request INNER JOIN StatusRequest ON Request.id_StatusReq = StatusRequest.id_StatusReq INNER JOIN Client ON Request.id_Client = Client.id_Client INNER JOIN Apartment ON Request.id_Apt = Apartment.id_apt INNER JOIN AptType ON Apartment.id_AptType = AptType.id_AptType">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="DropDownListUpdateStatus" runat="server" DataSourceID="ReqStatusDS" DataTextField="NameStatusReq" DataValueField="id_StatusReq" OnSelectedIndexChanged="DropDownListUpdateStatus_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="ReqStatusDS" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT * FROM [StatusRequest]"></asp:SqlDataSource>
                <asp:Label ID="LabelMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="ButtonUpdateStatus" runat="server" Text="Подтвердить" OnClick="ButtonUpdateStatus_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
