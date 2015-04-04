<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeSkillDataPage.aspx.cs" Inherits="Default2" %>

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
            <td>
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
                <asp:Label ID="skillDescDetLabel" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="skillDataLabel" runat="server" Text="Data"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="empSkilldataTextBox" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="skillDataCompareValidator" runat="server" 
                    ControlToValidate="empSkilldataTextBox" 
                    Operator="DataTypeCheck" Enabled="False" Visible="False"></asp:CompareValidator>
            &nbsp;<asp:RegularExpressionValidator ID="skillDataRegularExpressionValidator" 
                    runat="server" ControlToValidate="empSkilldataTextBox" Enabled="False" 
                    Visible="False"></asp:RegularExpressionValidator>
&nbsp;<asp:RequiredFieldValidator ID="skillDataRequiredFieldValidator" runat="server" 
                    ControlToValidate="empSkilldataTextBox" Enabled="False" ErrorMessage="Required" 
                    Visible="False"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
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
                    onclick="skillDetSubmitButton_Click" CssClass="Button" />
            </td>
        </tr>
    </table>

</div>
</ContentTemplate>
</asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>Processing...</ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

