<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="RealEstate.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <table class="auto-style1" style="width: 1010px">
        <tr>
            <td style="vertical-align: top;" colspan="2">Задайте необходимые фильтры:<br />
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style20" colspan="2">Цена</td>
                        <td class="auto-style20">Тип квартиры</td>
                        <td style="width: 299px; height: 23px">Отделка</td>
                        <td class="auto-style20" colspan="2">Площадь</td>
                    </tr>
                    <tr>
                        <td style="height: 30px; width: 28px">От:</td>
                        <td style="height: 30px; width: 157px">
                            <asp:TextBox ID="TextBoxPriceMin" runat="server" AutoPostBack="True" OnTextChanged="TextBoxPriceMin_TextChanged" Width="68px"></asp:TextBox>
                        </td>
                        <td style="height: 30px">
                <asp:DropDownList ID="DropDownListAptType" runat="server" AutoPostBack="True" DataSourceID="AptTypeSource" DataTextField="NameAptType" DataValueField="id_AptType" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
                </asp:DropDownList>
                <asp:SqlDataSource ID="AptTypeSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" OnSelecting="AptTypeSource_Selecting" SelectCommand="SELECT [NameAptType], [id_AptType] FROM [AptType]"></asp:SqlDataSource>
                        </td>
                        <td style="height: 30px; width: 299px">
                <asp:DropDownList ID="DropDownListOverhaul" runat="server" AutoPostBack="True" DataSourceID="OverHaulDataSource" DataTextField="NameOverhaul" DataValueField="id_Overhaul" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="OverHaulDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT [NameOverhaul], [id_Overhaul] FROM [Overhaul]"></asp:SqlDataSource>
                        </td>
                        <td style="height: 30px; width: 28px">От:
                            <br />
                        </td>
                        <td style="height: 30px">
                            <asp:TextBox ID="TextBoxAreaMin" runat="server" AutoPostBack="True" Width="68px" OnTextChanged="TextBoxAreaMin_TextChanged"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9" style="width: 28px; height: 26px">До:</td>
                        <td class="auto-style16" style="width: 157px; height: 26px">
                            <asp:TextBox ID="TextBoxPriceMax" runat="server" AutoPostBack="True" OnTextChanged="TextBoxPriceMax_TextChanged" Width="68px"></asp:TextBox>
                        </td>
                        <td class="auto-style19">&nbsp;</td>
                        <td style="width: 299px; height: 26px"></td>
                        <td style="width: 28px; height: 26px">До:</td>
                        <td class="auto-style19">
                            <asp:TextBox ID="TextBoxAreaMax" runat="server" AutoPostBack="True" Width="68px" OnTextChanged="TextBoxAreaMax_TextChanged"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 496px; height: 30px;">
                <asp:Button ID="ButtonClearFilters" runat="server" OnClick="ButtonClearFilters_Click1" Text="Сбросить фильтры" />
            </td>
            <td style="height: 30px;">
                <asp:Label ID="LabelDigitError" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 169px; vertical-align: top; width: 496px;">
                Список доступных квартир:<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ApartmentShortDataSource" AllowPaging="True" DataKeyNames="id_apt" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Width="457px">
        <Columns>
            <asp:CommandField SelectText="Подробно" ShowSelectButton="True" />
<asp:BoundField DataField="Price" HeaderText="Цена, руб" SortExpression="Price"></asp:BoundField>
            <asp:BoundField DataField="Floor" HeaderText="Этаж" SortExpression="Floor" />
            <asp:BoundField DataField="Rooms" HeaderText="Кол-во комнат" SortExpression="Rooms" />
            <asp:BoundField DataField="Area" HeaderText="Площадь, м2" SortExpression="Area" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ApartmentShortDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT * FROM [Apartment] WHERE ([id_StatusApt] = @id_StatusApt)" OnSelecting="ApartmentShortDataSource_Selecting">
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="id_StatusApt" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <br />
            </td>
            <td style="height: 169px; vertical-align: top;" dir="ltr">
                <asp:Label ID="LabelMore" runat="server" Text="Подробная информация:" Visible="False"></asp:Label>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id_apt" DataSourceID="DetailsViewDataSource" Height="50px" Width="411px" OnPageIndexChanging="DetailsView1_PageIndexChanging" Visible="False">
        <Fields>
            <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
            <asp:BoundField DataField="Floor" HeaderText="Этаж" SortExpression="Floor" />
            <asp:BoundField DataField="Rooms" HeaderText="Кол-во комнат" SortExpression="Rooms" />
            <asp:BoundField DataField="Area" HeaderText="Площадь" SortExpression="Area" />
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
                <asp:Button ID="ButtonPlaceRequest" runat="server" OnClick="ButtonPlaceRequest_Click" Text="Оформить заявку" Visible="False" />
                <br />
                <asp:Label ID="LabelRequestError" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 170px;" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
    <br />
    </asp:Content>
