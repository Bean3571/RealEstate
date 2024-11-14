<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewsPage.aspx.cs" Inherits="RealEstate.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="NewsSource" runat="server" ConnectionString="<%$ ConnectionStrings:agencyConnectionString2 %>" SelectCommand="SELECT [NameArticle], [BodyArticle], [DateTimeArticle] FROM [News]"></asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="NewsSource" EnableTheming="True">
        <AlternatingItemTemplate>
            <li style="background-color: #FFFFFF;color: #284775;">
                <strong><asp:Label ID="NameArticleLabel" runat="server" Text='<%# Eval("NameArticle") %>' /></strong>
                <br />
                <asp:Label ID="BodyArticleLabel" runat="server" Text='<%# Eval("BodyArticle") %>' />
                <br />
                <asp:Label ID="DateTimeArticleLabel" runat="server" Text='<%# Eval("DateTimeArticle") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #999999;">NameArticle:
                <asp:TextBox ID="NameArticleTextBox" runat="server" Text='<%# Bind("NameArticle") %>' />
                <br />
                BodyArticle:
                <asp:TextBox ID="BodyArticleTextBox" runat="server" Text='<%# Bind("BodyArticle") %>' />
                <br />
                DateTimeArticle:
                <asp:TextBox ID="DateTimeArticleTextBox" runat="server" Text='<%# Bind("DateTimeArticle") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">NameArticle:
                <asp:TextBox ID="NameArticleTextBox" runat="server" Text='<%# Bind("NameArticle") %>' />
                <br />
                BodyArticle:
                <asp:TextBox ID="BodyArticleTextBox" runat="server" Text='<%# Bind("BodyArticle") %>' />
                <br />
                DateTimeArticle:
                <asp:TextBox ID="DateTimeArticleTextBox" runat="server" Text='<%# Bind("DateTimeArticle") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
            <br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="background-color: #E0FFFF;color: #333333;">
                <strong><asp:Label ID="NameArticleLabel" runat="server" Text='<%# Eval("NameArticle") %>' /></strong>
                <br />
                <asp:Label ID="BodyArticleLabel" runat="server" Text='<%# Eval("BodyArticle") %>' />
                <br />
                <asp:Label ID="DateTimeArticleLabel" runat="server" Text='<%# Eval("DateTimeArticle") %>' />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #E2DED6;font-weight: bold;color: #333333;">NameArticle:
                <asp:Label ID="NameArticleLabel" runat="server" Text='<%# Eval("NameArticle") %>' />
                <br />
                BodyArticle:
                <asp:Label ID="BodyArticleLabel" runat="server" Text='<%# Eval("BodyArticle") %>' />
                <br />
                DateTimeArticle:
                <asp:Label ID="DateTimeArticleLabel" runat="server" Text='<%# Eval("DateTimeArticle") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
