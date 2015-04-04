<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SkillContentPage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <div>
    <h2>Category Management</h2>
    <table id="Category" style="border: thin #000000 solid; width: 100%" width="100%">
    <tr>
        <td colspan="2">
            Seleted Category Name:&nbsp;
            <asp:Label ID="SkillAddConfirm" runat="server" Font-Bold="True" ForeColor="Green"></asp:Label>
            &nbsp;<asp:Label ID="SkillDeleteConfirm" runat="server" Font-Bold="True" 
                ForeColor="Red"></asp:Label>
            <asp:GridView ID="GridView3" runat="server" CellPadding="4" 
            DataSourceID="SqlDataSourceSkillCategory" ForeColor="#333333" 
            Width="100%" AutoGenerateColumns="False" DataKeyNames="CategoryID" 
            ShowHeader="False" onrowcommand="GridView3_RowCommand" >
            <RowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Category Name" SortExpression="CategoryName">
                    <EditItemTemplate>
                        <asp:TextBox ID="CategoryNameEditBox" runat="server" Text='<%# Bind("CategoryName") %>' 
                            Width="99%"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" 
                    ControlStyle-CssClass="Button" ShowDeleteButton="True" >
                    <ControlStyle Width="48%" />
                    <ItemStyle Width="25%" HorizontalAlign="Center" Wrap="False" />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <EmptyDataTemplate>
                <table style="width: 100%">
                    <tr>
                        <td width="75%">
                            <asp:TextBox ID="NewSkillTextBox" runat="server" Width="100%"></asp:TextBox>
                        </td>
                        <td align="right" width="25%">
                            <asp:Button ID="NewSkillButton" runat="server" CssClass="Button" 
                                Text="Add Skill" Width="96%" CommandName="NewSkillInsert" />
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceSkillCategory" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
                SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Category] WHERE ([CategoryID] = @CategoryID)"  
                UpdateCommand="UPDATE [Category] SET [CategoryName] = @CategoryName WHERE [CategoryID] = @CategoryID" 
                DeleteCommand="DELETE FROM [Category] WHERE [CategoryID] = @CategoryID" 
                
                
                
                InsertCommand="INSERT INTO [Category] ([CategoryName]) VALUES (@CategoryName)" ondeleted="SqlDataSourceSkillCategory_Deleted" 
                 >
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="CategoryID" 
                    SessionField="searchKey" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td width="75%" style="height: 18px">
            <br />
            Selected Category Definitions:
            <asp:Label ID="SkillDefAddConfirm" runat="server" Font-Bold="True" 
                ForeColor="Green"></asp:Label>
            <asp:Label ID="SkillDefDeleteConfirm" runat="server" Font-Bold="True" 
                ForeColor="Red"></asp:Label>
        </td>
        <td width="25%" align="center" style="height: 18px">
            <br />
            <asp:Button ID="AddNewCategoryDefinition" runat="server" CssClass="Button" 
                Text="Add Category Definition" Width="95%" 
                onclick="AddNewCategoryDefinition_Click" />
        </td>
    </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="CategoryPropertyID,CategoryID" 
                    DataSourceID="SqlDataSourceSkillCategoryDefinitions" 
                    EmptyDataText="No Existing Records to Display." ForeColor="#333333" 
                    Width="100%" onrowcommand="GridView1_RowCommand">
                    <RowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="CategoryPropertyID" HeaderText="CategoryPropertyID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="CategoryPropertyID" 
                            Visible="false" />
                        <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" 
                            SortExpression="CategoryID" Visible="false" />
                        <asp:TemplateField HeaderText="Category" SortExpression="Category">
                            <EditItemTemplate>
                                <asp:TextBox ID="CategoryTextBox" runat="server" 
                                    Text='<%# Bind("Description") %>' Width="98%" Wrap="False"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="NewCategoryTextBox" runat="server" Width="99%"></asp:TextBox>
                                <br /> <br /> <br />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle Width="25%" />
                            <ItemStyle Width="25%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="DataTypeID" HeaderText="DataTypeID" 
                            SortExpression="DataTypeID" Visible="false" />
                        <asp:TemplateField HeaderText="Data Type" SortExpression="Data Type">
                            <EditItemTemplate>
                                <asp:DropDownList ID="EditSkillCategoryDropDown" runat="server" 
                                    DataSourceID="SqlDataSourceDropDownMenu" DataTextField="Description" 
                                    DataValueField="DataTypeID" 
                                    SelectedValue='<%# Bind("DataTypeID", "{0}") %>' Width="98%">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceDropDownMenu" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
                                    SelectCommand="SELECT DISTINCT [DataTypeID], [Description] FROM [DataType]">
                                </asp:SqlDataSource>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="NewSkillCategoryDropDown" runat="server" 
                                    DataSourceID="SqlDataSourceDropDownMenu" DataTextField="Description" 
                                    DataValueField="DataTypeID" 
                                    SelectedValue='<%# Bind("DataTypeID", "{0}") %>' Width="99%">
                                </asp:DropDownList>
                                <br /> <br /> <br />
                                <asp:SqlDataSource ID="SqlDataSourceDropDownMenu" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
                                    SelectCommand="SELECT DISTINCT [DataTypeID], [Description] FROM [DataType]">
                                </asp:SqlDataSource>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Data_Type") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle Width="25%" />
                            <ItemStyle Width="25%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Required Indicator" 
                            SortExpression="Required Indicator">
                            <EditItemTemplate>
                                <table style="width: 100%">
                                    <tr>
                                        <td align="center">
                                            <asp:CheckBox ID="RequiredCheckBox" runat="server" 
                                                Checked='<%# Bind("IsRequired") %>' Text="Check if Required Skill" 
                                                Width="98%" />
                                        </td>
                                    </tr>
                                </table>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <table style="width: 100%">
                                    <tr>
                                        <td align="center">
                                            <asp:CheckBox ID="NewRequiredCheckBox" runat="server" 
                                                Text="Check if Required Skill" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Button ID="InsertCatDefintion" runat="server" CssClass="Button" 
                                                Text="Save Definition" Width="45%" CommandName="NewCatInsert"/>
                                            &nbsp;
                                            <asp:Button ID="CancelCatDefinition" runat="server" CssClass="Button" 
                                                Text="Cancel Addition" Width="45%" CommandName="Cancel"/>
                                        </td>
                                    </tr>
                                </table>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsRequired") %>' 
                                    Enabled="false" />
                            </ItemTemplate>
                            <FooterStyle Width="25%" />
                            <ItemStyle Width="25%" />
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" ControlStyle-CssClass="Button" 
                            ShowEditButton="True" ShowDeleteButton="True">
                            <ControlStyle Width="48%" />
                            <ItemStyle HorizontalAlign="Center" Width="25%" />
                        </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        <table align="right" style="width: 100%">
                            <tr>
                                <td width="25%">
                                    <asp:TextBox ID="EmptyCatDefinition" runat="server" Width="95%"></asp:TextBox>
                                </td>
                                <td width="25%">
                                    <asp:DropDownList ID="EmptyDataTypeDropDown" runat="server" 
                                        DataSourceID="SqlDataSourceDropDownMenu" DataTextField="Description" 
                                        DataValueField="DataTypeID" Width="95%">
                                    </asp:DropDownList>
                                </td>
                                <td width="25%">
                                    <asp:CheckBox ID="EmptyReqInd" runat="server" Text="Check if Required Skill" 
                                        Width="95%" />
                                </td>
                                <td align="right" width="25%">
                                    <asp:Button ID="EmptyCatInsert" runat="server" CommandName="EmptyCatInsert" 
                                        CssClass="Button" Text="Save Definition" Width="95%" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSourceDropDownMenu" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
                            SelectCommand="SELECT DISTINCT [DataTypeID], [Description] FROM [DataType]">
                        </asp:SqlDataSource>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table> 
        <asp:SqlDataSource ID="SqlDataSourceSkillCategoryDefinitions" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
            SelectCommand="SELECT c.CategoryPropertyID, c.CategoryID, c.Description, c.DataTypeID, c.IsRequired, d.Description as Data_Type FROM [CategoryProperty] AS c, [DataType] AS d WHERE ([CategoryID] = @CategoryID) AND c.DataTypeID = d.DataTypeID" 
            UpdateCommand="UPDATE [CategoryProperty] SET [CategoryID] = @CategoryID, [Description] = @Description, [DataTypeID] = @DataTypeID, [IsRequired] = @IsRequired WHERE [CategoryPropertyID] = @CategoryPropertyID" 
            DeleteCommand="DELETE FROM [CategoryProperty] WHERE [CategoryPropertyID] = @CategoryPropertyID" 
            
            InsertCommand="INSERT INTO [CategoryProperty] ([CategoryID], [Description], [DataTypeID], [IsRequired]) VALUES (@CategoryID, @Description, @DataTypeID, @IsRequired)" 
            ondeleted="SqlDataSourceSkillCategoryDefinitions_Deleted" >
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="CategoryID" SessionField="searchKey" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="CategoryPropertyID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="DataTypeID" Type="Int32" />
                <asp:Parameter Name="IsRequired" Type="Boolean" />
                <asp:Parameter Name="CategoryPropertyID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="DataTypeID" Type="Int32" />
                <asp:Parameter Name="IsRequired" Type="Boolean" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <div>
    <br />
    <h2>Skill Management </h2>
    <table id="SkillsAddRow" width="50%">
    <tr>
        <td style= "width:60%">
            Selected
            Category Skills:
            <br />
            <asp:Label ID="SkillCatAddConfirm" runat="server" Font-Bold="True" 
                ForeColor="Green"></asp:Label>
            <asp:Label ID="SkillCatDeleteConfirm" runat="server" Font-Bold="True" 
                ForeColor="Red"></asp:Label>
        </td>
        <td style= "width:40%" align="center">
            <asp:Button ID="AddNewSkillCategory" runat="server" Text="Add Category Skill" 
                Width="95%" CssClass="Button" onclick="AddNewSkillCategory_Click"/>
            <br />
            <br />
        </td>
    </tr>
    </table>
    <table id="SkillsList" style="border: thin #000000 solid; width: 50%" width="50%">
    <tr>
        <td style= "width:100%">
            <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" DataKeyNames="SkillID" 
                DataSourceID="SqlDataSourceSkillCategorySkills" CellPadding="4" 
                ForeColor="#333333" Width="100%" 
                EmptyDataText="No Existing Records to Display" 
                onrowcommand="GridView2_RowCommand">
                <RowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SkillID" HeaderText="SkillID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="SkillID" Visible="False" />
                    <asp:TemplateField HeaderText="SkillName" SortExpression="SkillName" InsertVisible="true">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SkillName") %>' 
                                Width="98%"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <asp:TextBox ID="NewCategorySkillTextBox" runat="server" Width="100%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="NewCategorySkill" runat="server" CommandName="NewCategorySkill" 
                                            CssClass="Button" Text="Save Skill" Width="45%" />
                                        &nbsp;
                                        <asp:Button ID="Cancel" runat="server" CommandName="Cancel" CssClass="Button" 
                                            Text="Cancel" Width="45%" />
                                    </td>
                                </tr>
                            </table>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SkillName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" 
                        SortExpression="CategoryID" Visible="False" />
                    <asp:CommandField ShowEditButton="True" ButtonType="Button" 
                        ControlStyle-CssClass="Button" ShowDeleteButton="True" >
                        <ControlStyle CssClass="Button" Width="48%" />
                        <ItemStyle HorizontalAlign="Center" Width="40%" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:TextBox ID="EmptyCatSkillTextBox" runat="server" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Button ID="Button1" runat="server" CssClass="Button" Text="Save Skill" 
                                    Width="40%" CommandName="EmptyCategorySkill" />
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </td>
    </tr>
    </table>
        <asp:SqlDataSource ID="SqlDataSourceSkillCategorySkills" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
            SelectCommand="SELECT [SkillID], [SkillName], [CategoryID] FROM [Skill] WHERE ([CategoryID] = @CategoryID)" 
            DeleteCommand="DELETE FROM [Skill] WHERE [SkillID] = @SkillID" 
            InsertCommand="INSERT INTO [Skill] ([SkillName], [CategoryID]) VALUES (@SkillName, @CategoryID)" 
            
            UpdateCommand="UPDATE [Skill] SET [SkillName] = @SkillName WHERE [SkillID] = @SkillID" 
            ondeleted="SqlDataSourceSkillCategorySkills_Deleted" >
        <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="CategoryID" SessionField="searchKey" 
                Type="Int32" />
        </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="SkillID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="SkillName" Type="String" />
                <asp:Parameter Name="SkillID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="SkillName" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>Processing...</ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>