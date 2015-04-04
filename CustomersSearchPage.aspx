<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomersSearchPage.aspx.cs" Inherits="CustomersSearchPage" EnableEventValidation="false" MaintainScrollPositionOnPostback ="true" %>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
        DeleteCommand="DELETE FROM [Customer] WHERE [CustomerID] = @original_CustomerID" 
        InsertCommand="INSERT INTO [Customer] ([CustomerName], [CustomerNameExcludedFromReports], [Address1], [Address2], [City], [StateProvince], [PostalCode], [CountryRegion], [Phone], [Fax], [WebSite], [Description]) VALUES (@CustomerName, @CustomerNameExcludedFromReports, @Address1, @Address2, @City, @StateProvince, @PostalCode, @CountryRegion, @Phone, @Fax, @WebSite, @Description)" 
        ProviderName="<%$ ConnectionStrings:SkillsManagerConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [CustomerID], [CustomerName], [CustomerNameExcludedFromReports], [Address1], [Address2], [City], [StateProvince], [PostalCode], [CountryRegion], [Phone], [Fax], [WebSite], [Description] FROM [Customer]" 
        
        UpdateCommand="UPDATE [Customer] SET [CustomerName] = @CustomerName, [CustomerNameExcludedFromReports] = @CustomerNameExcludedFromReports, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [StateProvince] = @StateProvince, [PostalCode] = @PostalCode, [CountryRegion] = @CountryRegion, [Phone] = @Phone, [Fax] = @Fax, [WebSite] = @WebSite, [Description] = @Description WHERE [CustomerID] = @original_CustomerID" 
        OldValuesParameterFormatString="original_{0}" 
        onselecting="SqlDataSource1_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="original_CustomerID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerName" Type="String" />
            <asp:Parameter Name="CustomerNameExcludedFromReports" Type="Boolean" DefaultValue ="FALSE" />
            <asp:Parameter Name="Address1" Type="String" />
            <asp:Parameter Name="Address2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="StateProvince" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="CountryRegion" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="WebSite" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustomerName" Type="String" />
            <asp:Parameter Name="CustomerNameExcludedFromReports" Type="Boolean" DefaultValue ="FALSE" />
            <asp:Parameter Name="Address1" Type="String" />
            <asp:Parameter Name="Address2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="StateProvince" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="CountryRegion" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="WebSite" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="original_CustomerID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
<h2>Search for a customer</h2>
            <table width ='100%'>
                <tr>
                    <td style="width: 142px">
                        Cutomer Name</td>
                    <td>
                        <asp:TextBox ID="txtCustomerName" runat="server" style="margin-left: 0px" 
                            Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="right">
                        <asp:Button ID="NewCusButton" runat="server" 
         Text="Add New Customer" 
                    Width="160px" style="text-align: center" onclick="NewCusButton_Click" 
                            EnableTheming="True" CssClass="Button" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 142px">
                        City</td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 142px">
                        State</td>
                    <td>
                        <asp:TextBox ID="txtState" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 142px">
                        Postal Code</td>
                    <td>
                        <asp:TextBox ID="txtPostalCode" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 142px">
                        &nbsp;</td>
                    <td align="left">
                        <asp:Button ID="FindCusButton" runat="server" Text="Find" Width="200px" 
                            onclick="Button1_Click" CssClass="Button"  />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
         GridLines="Horizontal" style="text-align: center" Width="100%" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        OnRowDataBound = "GridView1_RowDataBound" OnSelectedIndexChanging = "GridView1_SelectedIndexChanging"
        AllowSorting="True" DataKeyNames="CustomerID" DataMember="DefaultView">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                SortExpression="CustomerID" Visible="False" ReadOnly="True" />
            <asp:CheckBoxField DataField="CustomerNameExcludedFromReports" 
                HeaderText="CustomerNameExcludedFromReports" 
                SortExpression="CustomerNameExcludedFromReports" Text="False" Visible="False" />
            <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" 
                SortExpression="CustomerName" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="StateProvince" HeaderText="State/Province" 
                SortExpression="StateProvince" />
            <asp:BoundField DataField="PostalCode" HeaderText="Postal" 
                SortExpression="PostalCode" />
            <asp:BoundField DataField="CountryRegion" HeaderText="Country Region" 
                SortExpression="CountryRegion" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:CommandField HeaderText="update" ShowEditButton="True" ShowHeader="True" 
                ShowDeleteButton="True" Visible="false" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <table align="right" style="width: 100%">
        <tr>
            <td>
                &nbsp;</td>
            <td align =right>
    <asp:Button ID="Button2" runat="server" Text="Select" Width="160px" onclick="Button2_Click" 
                    CssClass="Button" onprerender="Button2_PreRender"  />
 
            </td>
        </tr>
    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>Processing...</ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

