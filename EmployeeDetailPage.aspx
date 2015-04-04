<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeDetailPage.aspx.cs" Inherits="Default2" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<div>
    <h2>General</h2>
    <p>
        <asp:Label ID="empIdLabel" runat="server" Visible="False"></asp:Label>
    </p>
    <table style="width: 100%; border: 2px solid #000000">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="empFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="firstNameRequiredFieldValidator" runat="server" 
                    ControlToValidate="empFirstName" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="empLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="lastNameRequiredFieldValidator" runat="server" 
                    ControlToValidate="empLastName" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Title:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="empTitle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="titleRequiredFieldValidator" runat="server" 
                    ControlToValidate="empTitle" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Phone:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="empPhone" runat="server"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="phoneRegularExpressionValidator" 
                    runat="server" ControlToValidate="empPhone" ErrorMessage="(###) ###-####" 
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
&nbsp;<asp:RequiredFieldValidator ID="phoneRequiredFieldValidator" runat="server" 
                    ControlToValidate="empPhone" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Fax:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="empFax" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Email:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="empEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2>Projects</h2>
    <table style="width: 100%; border: 2px solid #000000">
        <tr>
            <td width="100%">
                <asp:GridView ID="projEmpGrid" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ProjectID" DataSourceID="projEmpSqlDataSource" 
                    EmptyDataText="There are no data records to display."
                    ForeColor="#333333" AllowSorting="True" GridLines="Horizontal" Width="100%" 
                    OnRowDataBound="projEmpGrid_RowDataBound"
                    onselectedindexchanging="projEmpGrid_SelectedIndexChanging">
                    <RowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" ReadOnly="True" 
                            SortExpression="ProjectID" InsertVisible="False" visible="false" />
                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                            SortExpression="EmployeeID" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />    
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                            SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" 
                            SortExpression="LastName" />
                        <asp:BoundField DataField="Title" HeaderText="Title" 
                            SortExpression="Title" />
                        <asp:BoundField DataField="DateStarted" HeaderText="DateStarted" 
                            SortExpression="DateStarted" />
                        <asp:BoundField DataField="DateCompleted" HeaderText="DateCompleted" 
                            SortExpression="DateCompleted" />
                        <asp:BoundField DataField="projDesc" HeaderText="projDesc" 
                            SortExpression="projDesc" />    
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="projEmpSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Project] WHERE [ProjectID] = @ProjectID" 
                    InsertCommand="INSERT INTO [Project] ([Title], [CustomerID], [ContactID], [DateStarted], [DateCompleted], [Description], [IsProjectOfPreviousEmployer]) VALUES (@Title, @CustomerID, @ContactID, @DateStarted, @DateCompleted, @Description, @IsProjectOfPreviousEmployer)" 
                    ProviderName="<%$ ConnectionStrings:SkillsManagerConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Project.ProjectID, ProjectEmployee.EmployeeID, ProjectEmployee.Description, Employee.FirstName, Employee.LastName, Project.Title, Project.DateStarted, Project.DateCompleted, Project.Description AS projDesc FROM Project INNER JOIN ProjectEmployee ON Project.ProjectID = ProjectEmployee.ProjectID AND ProjectEmployee.EmployeeID = @empid INNER JOIN Employee ON ProjectEmployee.EmployeeID = Employee.EmployeeID WHERE (Project.IsProjectOfPreviousEmployer = 0)"      
                    UpdateCommand="UPDATE [Project] SET [Title] = @Title, [CustomerID] = @CustomerID, [ContactID] = @ContactID, [DateStarted] = @DateStarted, [DateCompleted] = @DateCompleted, [Description] = @Description, [IsProjectOfPreviousEmployer] = @IsProjectOfPreviousEmployer WHERE [ProjectID] = @ProjectID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="empIdLabel" Name="empid" PropertyName="Text" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="ProjectID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="ContactID" Type="Int32" />
                        <asp:Parameter Name="DateStarted" Type="DateTime" />
                        <asp:Parameter Name="DateCompleted" Type="DateTime" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="IsProjectOfPreviousEmployer" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="ContactID" Type="Int32" />
                        <asp:Parameter Name="DateStarted" Type="DateTime" />
                        <asp:Parameter Name="DateCompleted" Type="DateTime" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="IsProjectOfPreviousEmployer" Type="Boolean" />
                        <asp:Parameter Name="ProjectID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td width=80%>
                            &nbsp;</td>
                        <td width=20%>
                            <asp:Button ID="projEmpGridButton" runat="server" 
                                Text="Edit" Width="100%" 
                                onclick="projEmpGridButton_Click"
                                onprerender="projEmpGridButton_PreRender" CssClass="Button" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <h2>Previous Employers</h2>
    <table style="width: 100%; border: 2px solid #000000">
        <tr>
            <td>
                <asp:GridView ID="prevEmpGrid" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="EmployeePreviousEmployersID" DataSourceID="SqlDataSource1" 
                    EmptyDataText="There are no data records to display."
                    ForeColor="#333333" AllowSorting="True" GridLines="Horizontal" Width="100%" 
                    OnRowDataBound="prevEmpGrid_RowDataBound"
                    onselectedindexchanging="prevEmpGrid_SelectedIndexChanging">
                    <RowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="EmployeePreviousEmployersID" 
                            HeaderText="EmployeePreviousEmployersID" ReadOnly="True" 
                            SortExpression="EmployeePreviousEmployersID" visible="false" />
                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                            SortExpression="EmployeeID" visible="false" />
                        <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" 
                            SortExpression="CompanyName" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Address1" HeaderText="Address1" 
                            SortExpression="Address1" />
                        <asp:BoundField DataField="Address2" HeaderText="Address2" 
                            SortExpression="Address2" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="StateProvince" HeaderText="StateProvince" 
                            SortExpression="StateProvince" />
                        <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" 
                            SortExpression="PostalCode" />
                        <asp:BoundField DataField="CountryRegion" HeaderText="CountryRegion" 
                            SortExpression="CountryRegion" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                        <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                            SortExpression="StartDate" />
                        <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                            SortExpression="EndDate" />
                        <asp:BoundField DataField="ContactName" HeaderText="ContactName" 
                            SortExpression="ContactName" />
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
                    DeleteCommand="DELETE FROM [EmployeePreviousEmployers] WHERE [EmployeePreviousEmployersID] = @EmployeePreviousEmployersID" 
                    InsertCommand="INSERT INTO [EmployeePreviousEmployers] ([EmployeeID], [CompanyName], [Title], [Address1], [Address2], [City], [StateProvince], [PostalCode], [CountryRegion], [Phone], [StartDate], [EndDate], [ContactName]) VALUES (@EmployeeID, @CompanyName, @Title, @Address1, @Address2, @City, @StateProvince, @PostalCode, @CountryRegion, @Phone, @StartDate, @EndDate, @ContactName)" 
                    ProviderName="<%$ ConnectionStrings:SkillsManagerConnectionString1.ProviderName %>" 
                    SelectCommand="GetEmployeePreviousEmployersByEmployeeID" 
                    
                    UpdateCommand="UPDATE [EmployeePreviousEmployers] SET [EmployeeID] = @EmployeeID, [CompanyName] = @CompanyName, [Title] = @Title, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [StateProvince] = @StateProvince, [PostalCode] = @PostalCode, [CountryRegion] = @CountryRegion, [Phone] = @Phone, [StartDate] = @StartDate, [EndDate] = @EndDate, [ContactName] = @ContactName WHERE [EmployeePreviousEmployersID] = @EmployeePreviousEmployersID" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="empIdLabel" Name="EmployeeID" 
                            PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="EmployeePreviousEmployersID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                        <asp:Parameter Name="CompanyName" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Address1" Type="String" />
                        <asp:Parameter Name="Address2" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="StateProvince" Type="String" />
                        <asp:Parameter Name="PostalCode" Type="String" />
                        <asp:Parameter Name="CountryRegion" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="StartDate" Type="DateTime" />
                        <asp:Parameter Name="EndDate" Type="DateTime" />
                        <asp:Parameter Name="ContactName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                        <asp:Parameter Name="CompanyName" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Address1" Type="String" />
                        <asp:Parameter Name="Address2" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="StateProvince" Type="String" />
                        <asp:Parameter Name="PostalCode" Type="String" />
                        <asp:Parameter Name="CountryRegion" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="StartDate" Type="DateTime" />
                        <asp:Parameter Name="EndDate" Type="DateTime" />
                        <asp:Parameter Name="ContactName" Type="String" />
                        <asp:Parameter Name="EmployeePreviousEmployersID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td width="60%">
                            &nbsp;</td>
                        <td width="20%">
                            <asp:Button ID="NewPrevEmpButton" runat="server" Text="New" Width="100%" 
                                onclick="NewPrevEmpButton_Click" CssClass="Button" />
                        </td>
                        <td>
                            <asp:Button ID="EditPrevEmpButton" runat="server" Text="Edit" 
                                Width="100%" onclick="EditPrevEmpButton_Click" 
                                onprerender="EditPrevEmpButton_PreRender" CssClass="Button" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <h2>Skill</h2>
    <table style="width: 100%; border: 2px solid #000000">
        <tr>
            <td width="100%">
                <asp:GridView ID="SkillGrid" runat="server" AutoGenerateColumns="False" DataSourceID="SkillGridSqlDataSource" 
                    EmptyDataText="There are no data records to display."
                    DataKeyNames="SkillDetailID"
                    ForeColor="#333333" AllowSorting="True" GridLines="Horizontal" Width="100%" 
                    OnRowDataBound="SkillGrid_RowDataBound"
                    onselectedindexchanging="SkillGrid_SelectedIndexChanging" >
                    <RowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Category" HeaderText="Category" 
                            SortExpression="Category"/>
                        <asp:BoundField DataField="Skill" HeaderText="Skill" 
                            SortExpression="Skill" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" />
                        <asp:BoundField DataField="SkillDetailID" HeaderText="SkillDetailID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="SkillDetailID"
                            visible="false" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SkillGridSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
                    ProviderName="<%$ ConnectionStrings:SkillsManagerConnectionString1.ProviderName %>" 
                    
                    
                    SelectCommand="SELECT [Category], [Skill], [Description], [Data], [SkillDetailID] FROM [SkillDetail] WHERE ([EmployeeID] = @EmployeeID)" >
                    <SelectParameters>
                        <asp:ControlParameter ControlID="empIdLabel" Name="EmployeeID" 
                            PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td width=60%>
                        </td>
                        <td width=20%>
                            <asp:Button ID="AddSkillButton" runat="server" 
                                Text="Add Skill" Width="100%" CssClass="Button" 
                                onclick="AddSkillButton_Click" />
                        </td>
                        <td width=20%>
                            <asp:Button ID="deleteSkillDetailButton" runat="server"
                                onprerender="deleteSkillDetailButton_PreRender"
                                Text="Delete Skill" Width="100%" 
                                onclick="deleteSkillDetailButton_Click" CssClass="Button" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <h2>Previous Projects</h2>
    <table style="width: 100%; border: 2px solid #000000">
        <tr>
            <td width="100%">
                <asp:GridView ID="prevProjEmpGrid" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ProjectID" DataSourceID="prevProjEmpSqlDataSource" 
                    EmptyDataText="There are no data records to display."
                    ForeColor="#333333" AllowSorting="True" GridLines="Horizontal" Width="100%" 
                    OnRowDataBound="prevProjEmpGrid_RowDataBound"
                    onselectedindexchanging="prevProjEmpGrid_SelectedIndexChanging">
                    <RowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" ReadOnly="True" 
                            SortExpression="ProjectID" InsertVisible="False" visible="false" />
                        <asp:BoundField DataField="Title" HeaderText="Title" 
                            SortExpression="Title" />
                        <asp:BoundField DataField="DateStarted" HeaderText="DateStarted" 
                            SortExpression="DateStarted" />    
                        <asp:BoundField DataField="DateCompleted" HeaderText="DateCompleted" 
                            SortExpression="DateCompleted" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="Role" HeaderText="Role" 
                            SortExpression="Role" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="prevProjEmpSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Project] WHERE [ProjectID] = @ProjectID" 
                    InsertCommand="INSERT INTO [Project] ([Title], [CustomerID], [ContactID], [DateStarted], [DateCompleted], [Description], [IsProjectOfPreviousEmployer]) VALUES (@Title, @CustomerID, @ContactID, @DateStarted, @DateCompleted, @Description, @IsProjectOfPreviousEmployer)" 
                    ProviderName="<%$ ConnectionStrings:SkillsManagerConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Project.ProjectID, Project.Title, Project.DateStarted, Project.DateCompleted, Project.Description, ProjectEmployee.Description AS Role FROM Project INNER JOIN ProjectEmployee ON Project.ProjectID = ProjectEmployee.ProjectID AND ProjectEmployee.EmployeeID = @empid WHERE (Project.IsProjectOfPreviousEmployer != 0)"      
                    
                    
                    UpdateCommand="UPDATE [Project] SET [Title] = @Title, [CustomerID] = @CustomerID, [ContactID] = @ContactID, [DateStarted] = @DateStarted, [DateCompleted] = @DateCompleted, [Description] = @Description, [IsProjectOfPreviousEmployer] = @IsProjectOfPreviousEmployer WHERE [ProjectID] = @ProjectID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="empIdLabel" Name="empid" PropertyName="Text" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="ProjectID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="ContactID" Type="Int32" />
                        <asp:Parameter Name="DateStarted" Type="DateTime" />
                        <asp:Parameter Name="DateCompleted" Type="DateTime" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="IsProjectOfPreviousEmployer" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="ContactID" Type="Int32" />
                        <asp:Parameter Name="DateStarted" Type="DateTime" />
                        <asp:Parameter Name="DateCompleted" Type="DateTime" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="IsProjectOfPreviousEmployer" Type="Boolean" />
                        <asp:Parameter Name="ProjectID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td width=80%>
                            &nbsp;</td>
                        <td width=20%>
                            <asp:Button ID="prevProjEmpButton" runat="server" 
                                Text="Edit" Width="100%" 
                                onclick="prevProjEmpButton_Click" 
                                onprerender="prevProjEmpButton_PreRender" CssClass="Button"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <table style="width: 100%">
        <tr>
            <td width="60%">
                <asp:Label ID="deleteWarningLabel" runat="server" Font-Bold="True" 
                    ForeColor="#CC0000" Width="100%"></asp:Label>
            </td>
            <td width="20%">
                <asp:Button ID="AddEmpSubmitButton" runat="server" onclick="AddEmpSubmitButton_Click" 
                    Text="Submit" Width="100%" CssClass="Button" />
            </td>
            <td>
                <asp:Button ID="DelEmpButton" runat="server" Text="Delete" 
                    onclientclick="return confirm('Are you certain you want to delete this item?')"
                    Width="100%" onclick="DelEmpButton_Click" CssClass="Button" />
            </td>
        </tr>
    </table>

</div>
    <%-- Java Script Popup Warning on No Selection Code--%>   
    <script type="text/javascript" id="Java Script Popup">
        function prevEmpSelectAlert() {
            alert("Please select an existing Previous Employer first...");
        }
        function empSkillSelectAlert() {
            alert("Please select an existing Skill first...");
        }
        function empProjAlert() {
            alert("Please select and existing project first...");
        }
    </script>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>Processing...</ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

