<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewProject.aspx.cs" Inherits="NewProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate> 
        <table class="style1">
            <tr>
                <td width="10%">
                    <asp:Label ID="projectTitleLabel" runat="server" Text="Title:"></asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox ID="projectTitleTextBox" runat="server" Width="160px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="projectTitleTextBox" Display="Dynamic" 
                        ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" 
                        Visible="False">*</asp:RequiredFieldValidator>
                </td>
                <td width="10%">
                    <asp:Label ID="customerLabel" runat="server" Text="Customer:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="customerDropDownList" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="CustomerName" 
                        DataValueField="CustomerID" Width="320px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="height: 5px" width="10%">
                    <asp:Label ID="startDateLabel" runat="server" Text="Start Date:"></asp:Label>
                </td>
                <td style="height: 5px" width="25%">
                    <asp:TextBox ID="startDateTextBox" runat="server" Width="160px"></asp:TextBox>
                </td>
                <td style="height: 5px" width="10%">
                    <asp:Label ID="contactLabel" runat="server" Text="Contact:"></asp:Label>
                </td>
                <td style="height: 5px">
                    <asp:DropDownList ID="contactDropDownList" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="FirstName" 
                        DataValueField="CustomerContactID" Width="160px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td width="10%">
                    <asp:Label ID="endDateLabel" runat="server" Text="End Date:"></asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox ID="endDateTextBox" runat="server" Width="160px"></asp:TextBox>
                </td>
                <td width="10%">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
        
        
        SelectCommand="SELECT [CustomerName], [CustomerID] FROM [Customer]">
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
            SelectCommand="SELECT FirstName, CustomerContactID FROM CustomerContact WHERE (CustomerID = ISNULL(@CustomerID, CustomerID))" >
        <SelectParameters>
            <asp:ControlParameter ControlID="customerDropDownList" DefaultValue="" 
                Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        Description:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
    <asp:Button ID="SubmitButton" runat="server" Text="Submit" 
        onclick="SubmitButton_Click" CssClass="Button" Width="160px" />
    &nbsp;&nbsp;
    <asp:Button ID="cancelButton" runat="server" onclick="cancelButton_Click" 
        Text="Cancel" CssClass="Button" Width="160px" CausesValidation="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;<asp:TextBox ID="descriptionTextBox" runat="server" Height="150px" 
        Width="100%"></asp:TextBox>
&nbsp;
   </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>Processing...</ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

