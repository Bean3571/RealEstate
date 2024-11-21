
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
            <td class="auto-style16" style="width: 161px; height: 23px;">Район</td>
            <td class="auto-style16" style="width: 129px; height: 23px;">
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" CssClass="auto-style11" DataSourceID="DistrictDataSource" DataTextField="NameDistrict" DataValueField="id_District" Height="164px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="186px"></asp:ListBox>
                <asp:SqlDataSource ID="DistrictDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT * FROM [District]"></asp:SqlDataSource>
            </td>
            <td class="auto-style20">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ListBox1" EnableClientScript="False" ErrorMessage="Необходимо выбрать"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 16px;">Улица</td>
            <td class="auto-style16" style="width: 129px; height: 16px;">
                <asp:ListBox ID="ListBox2" runat="server" AutoPostBack="True" DataSourceID="StreetDataSource" DataTextField="NameStreet" DataValueField="id_Street" Height="164px" OnSelectedIndexChanged="ListBox2_SelectedIndexChanged" Width="199px"></asp:ListBox>
                <asp:SqlDataSource ID="StreetDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT * FROM [Street] WHERE ([id_District] = @id_District)">
                    <SelectParameters>
                        <asp:SessionParameter Name="id_District" SessionField="SelectedDistrict" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style20" style="height: 16px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ListBox2" EnableClientScript="False" ErrorMessage="Необходимо выбрать"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 23px;">Номер здания</td>
            <td class="auto-style16" style="width: 129px; height: 23px;">
                <asp:DropDownList ID="DropDownListBuildingId" runat="server" DataSourceID="BuildingIdDataSource" DataTextField="BuildingNumber" DataValueField="id_building">
                </asp:DropDownList>
                <asp:SqlDataSource ID="BuildingIdDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT [BuildingNumber], [id_building], [id_Street] FROM [Building] WHERE ([id_Street] = @id_Street)">
                    <SelectParameters>
                        <asp:SessionParameter Name="id_Street" SessionField="SelectedStreet" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
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
            <td class="auto-style16" style="width: 161px; height: 26px;">Планировка</td>
            <td class="auto-style16" style="width: 129px; height: 26px;">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td class="auto-style19">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Необходимо выбрать" ControlToValidate="FileUpload1" EnableClientScript="False"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 26px;">&nbsp;</td>
            <td class="auto-style16" style="width: 129px; height: 26px;">
                &nbsp;</td>
            <td class="auto-style19">
                &nbsp;</td>
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
