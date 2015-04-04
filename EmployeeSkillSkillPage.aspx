<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeSkillSkillPage.aspx.cs" Inherits="Default2" %>

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
                <asp:Label ID="empSkillCatLabel" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="skillSkillLabel" runat="server" Text="Skill"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="skillSkillDropDown" runat="server" 
                    DataSourceID="empSkillSkillDataSource" DataTextField="SkillName" 
                    DataValueField="SkillName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="empSkillSkillDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
                    SelectCommand="SELECT Skill.SkillName FROM Skill INNER JOIN Category ON Skill.CategoryID = Category.CategoryID WHERE (Category.CategoryName = @catName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="empSkillCatLabel" Name="catName" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="empSkillSkillNextButton" runat="server" 
                    onclick="empSkillSkillNextButton_Click" Text="Next -&gt;" 
                    CssClass="Button" />
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