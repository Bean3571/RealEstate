<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmployeeRegistration.aspx.cs" Inherits="RealEstate.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="left" class="auto-style1">
        <tr>
            <td class="auto-style16" style="width: 161px; height: 23px;">Должность</td>
            <td class="auto-style16" style="width: 129px; height: 23px;">
                <asp:DropDownList ID="DropDownListRole" runat="server" DataSourceID="EmpRoleDataSource" DataTextField="NameEmpRole" DataValueField="id_EmpRole">
                </asp:DropDownList>
                <asp:SqlDataSource ID="EmpRoleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT * FROM [EmployeeRole]"></asp:SqlDataSource>
            </td>
            <td style="height: 23px">
                <asp:CustomValidator ID="CustomValidatorRole" runat="server" ControlToValidate="DropDownListRole" EnableClientScript="False" ErrorMessage="Необходимо выбрать"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px">Имя</td>
            <td class="auto-style16" style="width: 129px">
                <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxName" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 26px">Фамилия</td>
            <td class="auto-style16" style="width: 129px; height: 26px">
                <asp:TextBox ID="TextBoxSurname" runat="server"></asp:TextBox>
            </td>
            <td style="height: 26px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxSurname" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 26px">Отчество</td>
            <td class="auto-style16" style="width: 129px; height: 26px">
                <asp:TextBox ID="TextBoxPatronym" runat="server"></asp:TextBox>
            </td>
            <td style="height: 26px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPatronym" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 26px;">Номер телефона</td>
            <td class="auto-style16" style="width: 129px; height: 26px;">
                <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style19">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxPhone" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 26px;">Email</td>
            <td class="auto-style16" style="width: 129px; height: 26px;">
                <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style19">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxEmail" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" EnableClientScript="False" ErrorMessage="Неверный формат email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px">Логин</td>
            <td class="auto-style16" style="width: 129px">
                <asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxLogin" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="height: 26px; width: 161px">Пароль</td>
            <td style="height: 26px; width: 129px">
                <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
            </td>
            <td style="height: 26px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxPassword" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 25px">Подтверждение пароля</td>
            <td style="width: 129px; height: 25px">
                <asp:TextBox ID="TextBoxConfirmPassword" runat="server"></asp:TextBox>
            </td>
            <td style="height: 25px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxConfirmPassword" EnableClientScript="False" ErrorMessage="Поле обязательно для заполнения"></asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConfirmPassword" EnableClientScript="False" ErrorMessage="Пароль не совпадает"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="width: 161px; height: 25px">
                <asp:Button ID="ButtonRegister" runat="server" Text="Зарегистрировать сотрудника" OnClick="Button4_Click" />
            </td>
            <td style="width: 129px; height: 25px"></td>
            <td style="height: 25px">
                <asp:Label ID="LabelError" runat="server"></asp:Label>
                <br />
                <asp:Label ID="LabelQuery" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
