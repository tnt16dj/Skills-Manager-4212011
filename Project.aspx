<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Project.aspx.cs" Inherits="Default2"  EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate> 
        <table width="100%">
            <tr>
                <td width="20%" style="height: 29px">
                    <asp:Label ID="ProjectName" runat="server" Text="Project Name:"></asp:Label>
                </td>
                <td style="height: 29px" width="30%">
                    <asp:TextBox ID="ProjectNameBox" runat="server" Width="260px"></asp:TextBox>
                </td>
                <td align="right" style="height: 29px" width="50%">
                    <asp:Button ID="AddProjButton" runat="server" CssClass="Button" 
                        onclick="AddProjButton_Click" Text="Add New Project" Width="160px" />
                </td>
            </tr>
            <tr>
                <td width="20%">
                    <asp:Label ID="CustomerNameLable" runat="server" Text="Customer Name:" 
                        Visible="False"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="CustNameBox" runat="server" Width="260px" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="20%" style="height: 29px">
                    <asp:Label ID="StartedLable" runat="server" Text="Project Started Date:"></asp:Label>
                </td>
                <td colspan="2" style="height: 29px">
                    <asp:TextBox ID="ProjStartBox" runat="server" style="margin-left: 0px" 
                        Width="130px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="ProjStartBox" ErrorMessage="RegularExpressionValidator" 
                        ValidationExpression="^([1-9]|0[1-9]|1[012])[- /.]([1-9]|0[1-9]|[12][0-9]|3[01])[- /.][0-9]{4}$">01/01/2001</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td width="20%">
                    <asp:Label ID="CompleteLable" runat="server" Text="Project Completed Date:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="ProjCompBox" runat="server" Width="130px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="ProjCompBox" ErrorMessage="RegularExpressionValidator" 
                        ValidationExpression="^([1-9]|0[1-9]|1[012])[- /.]([1-9]|0[1-9]|[12][0-9]|3[01])[- /.][0-9]{4}$">01/02/2002</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td width="20%">
                    <asp:Label ID="KeywordLable" runat="server" Text="Keyword:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="KeywordBox" runat="server" Width="260px"></asp:TextBox>
                </td>
            </tr>
        </table>
<br />
        <table class="style1">
            <tr>
                <td width="20%" style="height: 29px">
                    <asp:Button ID="SearchButton" runat="server" CssClass="Button" 
                        onclick="SearchButton_Click" Text="Find" Width="160px" />
                </td>
                <td width="25%" style="height: 29px">
                    <asp:Button ID="deleteButton" runat="server" CssClass="Button" 
                        onclick="Button1_Click" onprerender="deleteButton_PreRender" 
                        Text="Delete Selected" Width="160px" />
                </td>
                <td width="60%" style="height: 29px">
                    </td>
            </tr>
        </table>
        <br />
<asp:Label ID="ResultsLable" runat="server" Text="Results:"></asp:Label>
    <br />
&nbsp;<asp:GridView ID="projectGrid" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ProjectID" DataSourceID="SqlDataSource1" 
                    EmptyDataText="There are no data records to display."
                    ForeColor="#333333" AllowSorting="True" GridLines="Horizontal" Width="100%" 
                    OnRowDataBound="projectGrid_RowDataBound"
                    onselectedindexchanging="projectGrid_SelectedIndexChanging" >
                    <RowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" Visible="False" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="DateStarted" HeaderText="DateStarted" 
                SortExpression="DateStarted" />
            <asp:BoundField DataField="DateCompleted" HeaderText="DateCompleted" 
                SortExpression="DateCompleted" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ProjectID" 
                Visible="False" />
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
            SelectCommand="SELECT [Title], [DateStarted], [DateCompleted], [Description], [ProjectID] FROM [Project]">
    </asp:SqlDataSource>
        <p style="text-align: right; margin-left: 40px">
            <asp:Button ID="OKButton" runat="server" CssClass="Button" 
                onclick="OKButton_Click" onprerender="OKButton_PreRender" Text="Select" 
                Width="160px" />
            &nbsp;
            </p>
       </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>Processing...</ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

