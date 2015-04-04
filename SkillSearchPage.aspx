<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" 
CodeFile="SkillSearchPage.aspx.cs" Inherits="SkillSearch"  EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">     <%--Place all Contents w/in Update Panel--%>
    <ContentTemplate>                                      <%--to avoid screen flicker on Selection--%>
    <table style="width: 100%">
        <tr>
            <td width="80%">
            <h2>Search for a Skill</h2>
            </td>
            <td width="20%" align="right">
                <asp:Button ID="Button1" runat="server" onclick="AddNewSkill_Click" Text="Add New Skill" 
                    Width="160px" CssClass="Button" />      <%--Added CSS Button Style... use CssClass property to set--%> 
            </td>                                          <%--Added ButtonHover and ButtonClick CSS Classes see style.css--%> 
        </tr>                                              <%--This way we don't have to use all that code--%> 
    </table>                                               <%--in the Code Behind just to allow color change--%>
    <table style="border: thin #000000 solid; width: 100%">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="CategoryID" DataSourceID="SqlDataSource1" 
                    ForeColor="#333333" AllowSorting="True" GridLines="Horizontal" 
                    OnRowDataBound="GridView1_RowDataBound" Width="100%"
                    onselectedindexchanged="GridView1_SelectedIndexChanged" AllowPaging="True" 
                    PageSize="8">
                    <RowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" Visible="false"/>
                        <asp:BoundField DataField="CategoryName" HeaderText="Existing Skills Categories:" 
                            SortExpression="CategoryName" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SkillsManagerConnectionString1 %>" 
                    SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Category] ORDER BY [CategoryName]">
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>

    <table style="width: 100%">
        <tr>
            <td width="80%">
                &nbsp;</td>
            <td width="20%" align="right">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Select" 
                    Width="160px" CssClass="Button" onprerender="Button2_PreRender"/>
            </td>
        </tr>
    </table>
    <%-- Java Script Popup Warning on No Selection Code--%>   
    <script type="text/javascript" id="Java Script Popup">
        function show_alert() {
            alert("Please select an Existing Skill first...");
        }
    </script>
    <%-- Java Script Popup Warning on No Selection Code--%> 
    </ContentTemplate>
    </asp:UpdatePanel>                                        <%--on trips between Client/Server--%>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">  <%--on trips between Client/Server--%>
        <ProgressTemplate>                                    <%--Eliminates flicker or gridview select--%>
            Processing...
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

