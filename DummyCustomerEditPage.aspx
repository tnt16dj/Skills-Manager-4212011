<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DummyCustomerEditPage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <b>General:</b>
        <table style="width: 100%; border: 2px solid #000000">
            <tr>
                <td style="width: 675px">
                Customer Name</td>
                <td>
                    <asp:TextBox ID="empFirstName" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 675px">
                Description</td>
                <td>
                    <asp:TextBox ID="empLastName" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 675px">
                Website</td>
                <td>
                    <asp:TextBox ID="empTitle" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 26px; width: 675px;">
                    <asp:CheckBox ID="CheckBox3" runat="server" Text="Exculde From Reports" />
                </td>
                <td style="height: 26px">
                &nbsp;</td>
            </tr>
        </table>
        <b>
        <br />Addresss:</b>
        <table style="width: 100%; border: 2px solid #000000">
            <tr>
                <td style="height: 12px; width: 674px;">
                Address 1</td>
                <td style="height: 12px">
                    <asp:TextBox ID="empFirstName0" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 674px">
                Address 2</td>
                <td>
                    <asp:TextBox ID="empLastName0" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 674px">
                City</td>
                <td>
                    <asp:TextBox ID="empTitle0" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 674px">
                State / Province</td>
                <td>
                    <asp:TextBox ID="empFirstName1" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 674px">
                Postal Code</td>
                <td>
                    <asp:TextBox ID="empLastName1" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 674px; height: 26px;">
                    Country</td>
                <td style="height: 26px">
                    <asp:TextBox ID="empTitle1" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <b>
        <br />Phone Number:</b>
        <table style="width: 100%; border: 2px solid #000000">
            <tr>
                <td style="height: 12px; width: 674px;">
                Phone</td>
                <td style="height: 12px">
                    <asp:TextBox ID="empFirstName2" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 674px">
                Fax:</td>
                <td>
                    <asp:TextBox ID="empLastName2" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <table style="width: 100%">
            <tr>
                <td align="left">
                    <asp:Button ID="SubmitCustomer" runat="server" onclick="SubmitCustomer_Click" 
                    Text="Submit" Width="200px" />
&nbsp;&nbsp;
                    <asp:Button ID="DeleteCustomer" runat="server" onclick="DeleteCustomer_Click" 
                    Text="Delete" Width="200px" />
                </td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
        <h2>
            Contacts</h2>
        <table style="border: thin #000000 solid; width: 100%">
            <tr>
                <td align="left">
                    <asp:Button ID="Button1" runat="server" Text="Add Contact" 
                    onclick="Button1_Click" Width="200px" />
                    <br />
                </td>
            </tr>
        </table>
    </div>
    <div>
    <table align="center" style="width: 100%">
        <tr>
            <td style="table-layout: auto; background-color: #3366FF; width: 130px; text-align: center;">
                First Name</td>
            <td style="table-layout: auto; background-color: #3366FF; text-align: center; width: 192px;">
                Last Name</td>
            <td style="table-layout: auto; background-color: #3366FF; width: 117px; text-align: center;">
                Title</td>
            <td style="table-layout: auto; background-color: #3366FF; text-align: center; width: 91px;">
                Phone</td>
            <td style="table-layout: auto; background-color: #3366FF; text-align: center; width: 95px;">
                Fax</td>
            <td style="table-layout: auto; background-color: #3366FF; text-align: center; width: 86px;">
                Email</td>
        </tr>
        <tr>
            <td style="width: 130px; text-align: center; margin-left: 40px;">
                <asp:TextBox ID="TextBox1" runat="server" Width="161px"></asp:TextBox>
            </td>
            <td style="text-align: center; width: 192px">
                <asp:TextBox ID="TextBox2" runat="server" Width="198px"></asp:TextBox>
            </td>
            <td style="width: 117px; text-align: center">
                <asp:TextBox ID="TextBox3" runat="server" style="width: 128px"></asp:TextBox>
            </td>
            <td style="text-align: center; width: 91px">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: center; width: 95px">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: center; width: 86px">
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 130px; height: 20px; text-align: center">
                &nbsp;</td>
            <td style="width: 192px; height: 20px; text-align: center">
                &nbsp;</td>
            <td style="width: 117px; height: 20px; text-align: center">
                &nbsp;</td>
            <td style="height: 20px; width: 91px; text-align: center">
                &nbsp;</td>
            <td style="height: 20px; width: 95px; text-align: center">
                &nbsp;</td>
            <td style="height: 20px; width: 86px; text-align: center">
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>

