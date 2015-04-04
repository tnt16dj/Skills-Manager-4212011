<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerDetailPage.aspx.cs" Inherits="Default2" EnableEventValidation="false"  MaintainScrollPositionOnPostback ="true" %>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <div>
    <b>General:</b>
    <table style="width: 100%; border: 2px solid #000000">
        <tr>
            <td style="width: 675px">
                Customer Name*</td>
            <td>
                <asp:TextBox ID="cusCustomerName" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td width="60px">
                <asp:RequiredFieldValidator ID="phoneRequiredFieldValidator0" runat="server" 
                    ControlToValidate="cusCustomerName" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 675px">
                Description</td>
            <td>
                <asp:TextBox ID="cusDescription" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 675px">
                Website</td>
            <td>
                <asp:TextBox ID="cusWebSite" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 26px; width: 675px;">
                <asp:CheckBox ID="cusCustomerNameExcludedFromReports" runat="server" 
                    Text="Exculde From Reports" />
            </td>
            <td style="height: 26px">
                &nbsp;</td>
            <td style="height: 26px">
                &nbsp;</td>
        </tr>
        </table>
    <b>
    <br />
    Addresss:</b>
    <table style="width: 100%; border: 2px solid #000000">
        <tr>
            <td style="height: 12px; width: 674px;">
                Address 1</td>
            <td style="height: 12px">
                <asp:TextBox ID="cusAddress1" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td width="60px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 674px">
                Address 2</td>
            <td>
                <asp:TextBox ID="cusAddress2" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 674px">
                City</td>
            <td>
                <asp:TextBox ID="cusCity" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 674px">
                State / Province</td>
            <td>
                <asp:TextBox ID="cusStateProvince" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 674px">
                Postal Code</td>
            <td>
                <asp:TextBox ID="cusPostalCode" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 674px; height: 26px;">
                Country</td>
            <td style="height: 26px">
                <asp:TextBox ID="cusCountryRegion" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="height: 26px">
                &nbsp;</td>
        </tr>
        </table>
    <b>
    <br />
    Phone Number:</b>
    <table style="width: 100%; border: 2px solid #000000">
        <tr>
            <td style="height: 12px; width: 674px;">
                Phone*</td>
            <td style="height: 12px">
                <asp:TextBox ID="cusPhone" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="height: 12px">
                <asp:RequiredFieldValidator ID="phoneRequiredFieldValidator" runat="server" 
                    ControlToValidate="cusPhone" ErrorMessage="Required" Display="Dynamic" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="phoneRegularExpressionValidator" 
                    runat="server" ControlToValidate="cusPhone" ErrorMessage="(###) ###-####" 
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" 
                    Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
            <td style="height: 12px" width="60px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 674px">
                Fax:</td>
            <td>
                <asp:TextBox ID="cusFax" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="phoneRegularExpressionValidator0" 
                    runat="server" ControlToValidate="CusFax" Display="Dynamic" 
                    ErrorMessage="(###) ###-####" SetFocusOnError="True" 
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>

</div>
    
<div>
    <table style="width: 100%">
        <tr>
            <td style="text-align: right">
                <asp:Button ID="SubmitCustomer" runat="server" onclick="SubmitCustomer_Click" 
                    Text="Save" Width="200px" CssClass=Button/>
&nbsp;&nbsp;
                <asp:Button ID="DeleteCustomer" runat="server" onclick="DeleteCustomer_Click" 
                    Text="Delete" Width="200px"  
                    OnClientClick="return confirm('Are you sure you want delete this?');" 
                    CssClass=Button/>
            </td>
        </tr>
    </table>
    <p>
        <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Overline="False" 
            Font-Size="Large" ForeColor="Red"></asp:Label>
    </p>
    <h2>Contacts</h2>
    <table style="border: thin #000000 solid; width: 100%">
        <tr>
            <td align="left">
                <asp:Panel ID="panel" runat="server" DefaultButton="AddContact">
                    <asp:Button ID="AddContact" runat="server" CssClass="Button" 
                        onclick="AddContact_Click" Text="Add Contact" Width="200px" />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CustDataText="There are no data records to display." 
                        DataKeyNames="CustomerContactID" DataSourceID="SqlDataSource1" 
                        ForeColor="#333333" GridLines="Horizontal" 
                        OnRowDataBound="GridView1_RowDataBound" 
                        OnSelectedIndexChanging="GridView1_SelectedIndexChanging" 
                        style="text-align: center" Width="100%" 
                        EmptyDataText="No Contacts to display.">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:TemplateField HeaderText="CustomerContactID" InsertVisible="False" 
                                SortExpression="CustomerContactID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CustomerContactID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CustomerContactID") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CustomerID" InsertVisible="False" 
                                SortExpression="CustomerID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("CustomerID") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ControlStyle-Width="98%" HeaderText="FirstName*" 
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="12.5%" 
                                SortExpression="FirstName">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID='TextBox1' runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="GridViewFirstNameRequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Required" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ControlStyle Width="98%" />
                                <ItemStyle HorizontalAlign="Center" Width="12.5%" />
                            </asp:TemplateField>
                            <asp:TemplateField ControlStyle-Width="98%" HeaderText="LastName" 
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="12.5%" 
                                SortExpression="LastName">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>' 
                                        Width="12.5%"></asp:TextBox>
                                </EditItemTemplate>
                                <ControlStyle Width="98%" />
                                <ItemStyle HorizontalAlign="Center" Width="12.5%" />
                            </asp:TemplateField>
                            <asp:TemplateField ControlStyle-Width="98%" HeaderText="Title" 
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="12.5%" 
                                SortExpression="Title">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Title") %>' 
                                        Width="12.5%"></asp:TextBox>
                                </EditItemTemplate>
                                <ControlStyle Width="98%" />
                                <ItemStyle HorizontalAlign="Center" Width="12.5%" />
                            </asp:TemplateField>
                            <asp:TemplateField ControlStyle-Width="98%" HeaderText="Phone" 
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="12.5%" 
                                SortExpression="Phone">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Phone") %>' 
                                        Width="12.5%"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="GridViewPhoneRegularExpressionValidator2" 
                                        runat="server" ControlToValidate="TextBox4" Display="Dynamic" 
                                        ErrorMessage="(###) ###-####" SetFocusOnError="True" 
                                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <ControlStyle Width="98%" />
                                <ItemStyle HorizontalAlign="Center" Width="12.5%" />
                            </asp:TemplateField>
                            <asp:TemplateField ControlStyle-Width="98%" HeaderText="Fax" 
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="12.5%" SortExpression="Fax">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Fax") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Fax") %>' 
                                        Width="12.5%"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="GridViewFaxRegularExpressionValidator3" 
                                        runat="server" ControlToValidate="TextBox5" Display="Dynamic" 
                                        ErrorMessage="(###) ###-####" SetFocusOnError="True" 
                                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <ControlStyle Width="98%" />
                                <ItemStyle HorizontalAlign="Center" Width="12.5%" />
                            </asp:TemplateField>
                            <asp:TemplateField ControlStyle-Width="98%" HeaderText="Email" 
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="12.5%" 
                                SortExpression="Email">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Email") %>' 
                                        Width="12.5%"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="GridViewEmailRegularExpressionValidator4" 
                                        runat="server" ControlToValidate="TextBox6" Display="Dynamic" 
                                        ErrorMessage="email@domain.com" SetFocusOnError="True" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <ControlStyle Width="98%" />
                                <ItemStyle HorizontalAlign="Center" Width="12.5%" />
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="Button" 
                                HeaderText="Edit" ShowEditButton="True">
                                <ControlStyle CssClass="Button" Width="48%" />
                                <ItemStyle HorizontalAlign="Center" Width="12.5%" Wrap="false" />
                            </asp:CommandField>
                            <asp:TemplateField ControlStyle-Width="98%" HeaderText="Delete" 
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="12.5%">
                                <ItemTemplate>
                                    <asp:Button ID="LinkButton22" Runat="server" CommandName="Delete" 
                                        CssClass="Button" 
                                        OnClientClick="return confirm('Are you sure you want delete this?');" 
                                        Text="Delete" Width="12.5%" />
                                </ItemTemplate>
                                <ControlStyle Width="98%" />
                                <ItemStyle HorizontalAlign="Center" Width="12.5%" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </asp:Panel>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
                    
                    SelectCommand="SELECT [CustomerContactID], [CustomerID], [FirstName], [LastName], [Title], [Phone], [Fax], [Email] FROM [CustomerContact] WHERE ([CustomerID] = @CustomerID)" 
                    DeleteCommand="DELETE FROM [CustomerContact] WHERE [CustomerContactID] = @CustomerContactID" 
                    InsertCommand="INSERT INTO [CustomerContact] ([CustomerID], [FirstName], [LastName], [Title], [Phone], [Fax], [Email]) VALUES (@CustomerID, @FirstName, @LastName, @Title, @Phone, @Fax, @Email)" 
                    UpdateCommand="UPDATE [CustomerContact] SET [CustomerID] = @CustomerID, [FirstName] = @FirstName, [LastName] = @LastName, [Title] = @Title, [Phone] = @Phone, [Fax] = @Fax, [Email] = @Email WHERE [CustomerContactID] = @CustomerContactID" 
              
                    >
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="CustomerID" SessionField="cusID" 
                            Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="CustomerContactID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="CustomerContactID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="FirstName" Type="String" DefaultValue =""/>
                        <asp:Parameter Name="LastName" Type="String" DefaultValue =""/>
                        <asp:Parameter Name="Title" Type="String" DefaultValue =""/>
                        <asp:Parameter Name="Phone" Type="String" DefaultValue =""/>
                        <asp:Parameter Name="Fax" Type="String" DefaultValue =""/>
                        <asp:Parameter Name="Email" Type="String" DefaultValue =""/>
                    </InsertParameters>
                </asp:SqlDataSource>
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

