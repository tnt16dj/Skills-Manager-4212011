<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PrevEmployeeDetailPage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div>
    <h2>Previous Employer</h2>
    <table style="width: 100%; border: 2px solid #000000">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Company Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PEDCompanyName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="peCompNameRequiredFieldValidator" 
                    runat="server" ControlToValidate="PEDCompanyName" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Title:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PEDTitle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="peTitleRequiredFieldValidator" runat="server" 
                    ControlToValidate="PEDTitle" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Address1:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PEDAdd1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="peAdd1RequiredFieldValidator" runat="server" 
                    ControlToValidate="PEDAdd1" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Address2:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PEDAdd2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="City:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PEDCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="peCityRequiredFieldValidator" runat="server" 
                    ControlToValidate="PEDCity" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="State Province:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PEDState" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="peStRequiredFieldValidator" runat="server" 
                    ControlToValidate="PEDState" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Postal Code:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PEDZip" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="peZipRequiredFieldValidator" runat="server" 
                    ControlToValidate="PEDZip" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Country Region:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PEDCountry" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Phone:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PEDPhone" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="pePhoneRegularExpressionValidator" 
                    runat="server" ControlToValidate="PEDPhone" ErrorMessage="(###) ###-###" 
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
&nbsp;
                <asp:RequiredFieldValidator ID="pePhoneRequiredFieldValidator" runat="server" 
                    ControlToValidate="PEDPhone" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 26px">
                <asp:Label ID="Label10" runat="server" Text="Start Date:"></asp:Label>
            </td>
            <td style="height: 26px">
                <asp:TextBox ID="PEDSD" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="peSDCompareValidator" runat="server" 
                    ControlToValidate="PEDSD" ErrorMessage="MM/DD/YYYY" Operator="DataTypeCheck" 
                    Type="Date"></asp:CompareValidator>
&nbsp;<asp:RequiredFieldValidator ID="peSDRequiredFieldValidator" runat="server" 
                    ControlToValidate="PEDSD" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="End Date:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PEDED" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="peEDCompareValidator" runat="server" 
                    ControlToValidate="PEDED" ErrorMessage="MM/DD/YYYY" Operator="DataTypeCheck" 
                    Type="Date"></asp:CompareValidator>
&nbsp;<asp:RequiredFieldValidator ID="peEDRequiredFieldValidator" runat="server" 
                    ControlToValidate="PEDED" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="Contact Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PEDSuper" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td width="60%">
                &nbsp;</td>
            <td width="20%">
                <asp:Button ID="peSubmitButton" runat="server" onclick="peSubmitButton_Click" 
                    Text="Submit" Width="100%" CssClass="Button" />
            </td>
            <td width="20%">
                <asp:Button ID="prevEmpDeleteButton" runat="server" 
                    Text="Delete" Width="100%" 
                    onclick="prevEmpDeleteButton_Click" 
                    onclientclick="return confirm('Are you certain you want to delete this item?')" 
                    CssClass="Button"/>
            </td>
        </tr>
    </table>

</div>
</asp:Content>

