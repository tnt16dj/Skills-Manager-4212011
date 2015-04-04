<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeSearchPage.aspx.cs" Inherits="Default2" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<div>

<h2>Search for an employee</h2>
    <table style="width: 100%">
        <tr>
            <td style="width: 22%">
                <asp:Label ID="FNameLabel" runat="server" Text="First Name"></asp:Label>
            </td>
            <td style="width: 27%">
                <asp:TextBox ID="FNameTextBox" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="width: 31%">
                &nbsp;</td>
            <td align=right>
                <asp:Button ID="NewEmpButton" runat="server" onclick="NewEmpButton_Click" Text="Add New Employee" 
                    Width="160px" CssClass="Button" />
            </td>
        </tr>
        <tr>
            <td style="width: 22%">
                <asp:Label ID="LNameLabel" runat="server" Text="Last Name"></asp:Label>
            </td>
            <td style="width: 27%">
                <asp:TextBox ID="LNameTextBox" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="width: 31%">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 22%">
                &nbsp;</td>
            <td style="width: 27%" align="left">
                <asp:Button ID="EmpFindButton" runat="server" Text="Find" 
                    onclick="EmpFindButton_Click" Width="200px" CssClass="Button" />
            </td>
            <td style="width: 31%">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <table style="border: thin #000000 solid; width: 100%">
        <tr>
            <td>
                <asp:GridView ID="empGrid" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" 
                    EmptyDataText="There are no data records to display."
                    ForeColor="#333333" AllowSorting="True" GridLines="Horizontal" Width="100%" 
                    OnRowDataBound="empGrid_RowDataBound"
                    onselectedindexchanging="empGrid_SelectedIndexChanging" >
                    <RowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" ReadOnly="True"
                            InsertVisible=false Visible=false
                            SortExpression="EmployeeID" />
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                            SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" 
                            SortExpression="LastName" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                        <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Employee] WHERE [EmployeeID] = @EmployeeID" 
                    InsertCommand="INSERT INTO [Employee] ([FirstName], [LastName], [Title], [Phone], [Fax], [Email]) VALUES (@FirstName, @LastName, @Title, @Phone, @Fax, @Email)" 
                    ProviderName="<%$ ConnectionStrings:SkillsManagerConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Title], [Phone], [Fax], [Email], [SkillXML] FROM [Employee]" 
                    UpdateCommand="UPDATE [Employee] SET [FirstName] = @FirstName, [LastName] = @LastName, [Title] = @Title, [Phone] = @Phone, [Fax] = @Fax, [Email] = @Email WHERE [EmployeeID] = @EmployeeID">
                    <DeleteParameters>
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <br />
            </td>
        </tr>
        </table>
</div>

    <table style="width: 100%">
        <tr>
            <td width="80%">
                &nbsp;</td>
            <td align=right>
                <asp:Button ID="EmpSelectButton" runat="server" onclick="EmpSelectButton_Click" Text="Select" 
                    Width="160px" CssClass="Button" onprerender="EmpSelectButton_PreRender"/>
            </td>
        </tr>
    </table>
    <%-- Java Script Popup Warning on No Selection Code--%>   
    <script type="text/javascript" id="Java Script Popup">
        function empSelectAlert() {
            alert("Please select an existing Employee first...");
        }
    </script>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>Processing...</ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

