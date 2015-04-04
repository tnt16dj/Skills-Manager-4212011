<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeSkillDetPage.aspx.cs" Inherits="Default2" %>

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
                <asp:Label ID="skillCatDetLabel" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="skillSkillLabel" runat="server" Text="Skill"></asp:Label>
            </td>
            <td>
                <asp:Label ID="skillSkillDetLabel" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="skillDescLabel" runat="server" Text="Description"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="skillDescDropDown" runat="server" 
                    DataSourceID="skillDescDataSource" DataTextField="Description" 
                    DataValueField="Description" Height="16px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="skillDescDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
                    SelectCommand="SELECT CategoryProperty.Description FROM CategoryProperty INNER JOIN Category ON CategoryProperty.CategoryID = Category.CategoryID WHERE (Category.CategoryName = @catName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="skillCatDetLabel" Name="catName" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="skilldetNextButton" runat="server" CssClass="Button" 
                    onclick="skilldetNextButton_Click" Text="Next -&gt;" />
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
                <asp:Button ID="skillDetSubmitButton" runat="server" 
                    Text="Submit" Width="100%" 
                    onclick="skillDetSubmitButton_Click" CssClass="Button" Visible="False" />
            </td>
        </tr>
    </table>

</div>
</ContentTemplate>
</asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>Progress...</ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

