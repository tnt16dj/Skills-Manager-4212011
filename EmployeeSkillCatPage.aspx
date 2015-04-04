<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeSkillCatPage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<div>
    <h2>Employee Skill</h2>
    <table style="width: 100%; border: 2px solid #000000">
        <tr>
            <td width="100">
                <asp:Label ID="skillCatLabel" runat="server" Text="Category"></asp:Label>
            </td>
            <td width="400">
                <asp:DropDownList ID="skillCatDropDown" runat="server" 
                    DataSourceID="skillCatDataSource" DataTextField="CategoryName" 
                    DataValueField="CategoryName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="skillCatDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
                    SelectCommand="SELECT [CategoryName] FROM [Category]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="catNextButton" runat="server" onclick="catNextButton_Click" 
                    Text="Next -&gt;" CssClass="Button" />
            </td>
        </tr>
        </table>
    <table style="width: 100%">
        <tr>
            <td width="60%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
        </tr>
    </table>

</div>
</ContentTemplate>
</asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>Processing...</ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

