
<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddApartment.aspx.cs" Inherits="RealEstate.WebForm10" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="left" class="auto-style1">
        <tr>
            <td class="auto-style16" style="width: 161px">Тип квартиры</td>
            <td class="auto-style16" style="width: 129px">
                <asp:DropDownList ID="DropDownListAptType" runat="server" DataSourceID="AptTypeDDLDataSource" DataTextField="NameAptType" DataValueField="id_AptType">
                </asp:DropDownList>
                <asp:SqlDataSource ID="AptTypeDDLDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT * FROM [AptType]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownListAptType" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 23px;">ID здания</td>
            <td class="auto-style16" style="width: 129px; height: 23px;">
                <asp:DropDownList ID="DropDownListBuildingId" runat="server" DataSourceID="BuildingIdDataSource" DataTextField="BuildingNumber" DataValueField="id_building">
                </asp:DropDownList>
                <asp:SqlDataSource ID="BuildingIdDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT [BuildingNumber], [id_building] FROM [Building]"></asp:SqlDataSource>
            </td>
            <td class="auto-style20">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownListBuildingId" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px">Цена</td>
            <td class="auto-style16" style="width: 129px">
                <asp:TextBox ID="TextBoxPrice" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPrice" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px">Этаж</td>
            <td class="auto-style16" style="width: 129px">
                <asp:TextBox ID="TextBoxFloor" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxFloor" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px">Количество комнат</td>
            <td class="auto-style16" style="width: 129px">
                <asp:TextBox ID="TextBoxRooms" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxRooms" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px">Площадь</td>
            <td class="auto-style16" style="width: 129px">
                <asp:TextBox ID="TextBoxArea" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxArea" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 59px;">Статус квартиры</td>
            <td class="auto-style16" style="width: 129px; height: 59px;">
                <asp:DropDownList ID="DropDownListAptStatus" runat="server" DataSourceID="AptStatusBuildingId" DataTextField="NameStatusApt" DataValueField="id_StatusApt">
                </asp:DropDownList>
                <asp:SqlDataSource ID="AptStatusBuildingId" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT * FROM [StatusApt]"></asp:SqlDataSource>
            </td>
            <td style="height: 59px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownListAptStatus" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 42px;">Отделка</td>
            <td class="auto-style16" style="width: 129px; height: 42px;">
                <asp:DropDownList ID="DropDownListOverhaul" runat="server" DataSourceID="OverhaulDataSource" DataTextField="NameOverhaul" DataValueField="id_Overhaul">
                </asp:DropDownList>
                <asp:SqlDataSource ID="OverhaulDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT * FROM [Overhaul]"></asp:SqlDataSource>
            </td>
            <td style="height: 42px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownListOverhaul" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 26px;">Ссылка на планировку</td>
            <td class="auto-style16" style="width: 129px; height: 26px;">
                <asp:TextBox ID="TextBoxImageAptPlan" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style19">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBoxImageAptPlan" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 25px">
                <asp:Button ID="ButtonAddApartment" runat="server" Text="Добавить квартиру" OnClick="ButtonAddApartment_Click" />
            </td>
            <td style="width: 129px; height: 25px"></td>
            <td style="height: 25px">
                <asp:Label ID="LabelError" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
