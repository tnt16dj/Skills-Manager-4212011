<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PROTOTYPE_ONLY-FindEmployeeSearchPage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div>

<h2>Search for an employee</h2>
    <table style="width: 100%">
        <tr>
            <td style="width: 22%">
                <asp:Label ID="FNameLabel" runat="server" Text="First Name"></asp:Label>
            </td>
            <td style="width: 27%">
                <asp:TextBox ID="FNameTextBox" runat="server"></asp:TextBox>
            </td>
            <td style="width: 31%">
                &nbsp;</td>
            <td>
                <asp:Button ID="NewEmpButton" runat="server" onclick="NewEmpButton_Click" Text="Add New Employee" 
                    Width="100%" />
            </td>
        </tr>
        <tr>
            <td style="width: 22%">
                <asp:Label ID="LNameLabel" runat="server" Text="Last Name"></asp:Label>
            </td>
            <td style="width: 27%">
                <asp:TextBox ID="LNameTextBox" runat="server"></asp:TextBox>
            </td>
            <td style="width: 31%">
                <asp:Button ID="EmpFindButton" runat="server" Text="Find" 
                    onclick="EmpFindButton_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <table style="border: thin #000000 solid; width: 100%">
        <tr>
            <td>
                <br />
                <table style="width: 100%; border: 2px solid #000000">
                    <tr>
                        <td bgcolor="#CCCCCC">
                            FirstName</td>
                        <td bgcolor="#CCCCCC">
                            LastName</td>
                        <td bgcolor="#CCCCCC">
                            Title</td>
                        <td bgcolor="#CCCCCC">
                            Phone</td>
                        <td bgcolor="#CCCCCC">
                            Fax</td>
                        <td bgcolor="#CCCCCC">
                            Email</td>
                    </tr>
                    <tr>
                        <td style="height: 20px">
                            Karin</td>
                        <td style="height: 20px">
                            Josephs</td>
                        <td style="height: 20px">
                            Developer</td>
                        <td style="height: 20px">
                            (503) 555-7555</td>
                        <td style="height: 20px">
                        </td>
                        <td style="height: 20px">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
        </table>
</div>

    <table style="width: 100%">
        <tr>
            <td width="80%">
                &nbsp;</td>
            <td>
                <asp:Button ID="EmpSelectButton" runat="server" onclick="EmpSelectButton_Click" Text="Select" 
                    Width="100%" />
            </td>
        </tr>
    </table>

</asp:Content>

