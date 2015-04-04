<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DummyCustomerDelete.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
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
                    Width="200px" style="text-align: center" onclick="NewCusButton_Click" 
                            EnableTheming="True" />
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
                <asp:Button ID="Button1" runat="server" Text="Find" Width="200px" 
                            onclick="Button1_Click" />
            </td>
            <td>
                        &nbsp;</td>
            <td align="center">
                        &nbsp;</td>
        </tr>
    </table>
    <table align="center" style="width: 100%">
        <tr>
            <td style="table-layout: auto; background-color: #3366FF; text-align: center; width: 85px;">
                <b>Customer ID</td>
            <td style="table-layout: auto; background-color: #3366FF; width: 202px; text-align: center;">
                Customer Name</td>
            <td style="table-layout: auto; background-color: #3366FF; text-align: center; width: 95px;">
                City</td>
            <td style="table-layout: auto; background-color: #3366FF; width: 117px; text-align: center;">
                State/Province</td>
            <td style="table-layout: auto; background-color: #3366FF; text-align: center; width: 91px;">
                Postal Code</td>
            <td style="table-layout: auto; background-color: #3366FF; text-align: center; width: 95px;">
                Country/Region</td>
            <td style="table-layout: auto; background-color: #3366FF; text-align: center; width: 86px;">
                Phone</td>
            </b>
            <td bgcolor="#CCFFFF" 
                style="table-layout: auto; background-color: #3366FF; text-align: center; width: 93px;">
                <b>Update</b>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; width: 85px">
                1</td>
            <td style="width: 202px; text-align: center">
                Save-a-Lot Markets</td>
            <td style="text-align: center; width: 95px">
                Boise</td>
            <td style="width: 117px; text-align: center">
&nbsp;ID</td>
            <td style="text-align: center; width: 91px">
                83720</td>
            <td style="text-align: center; width: 95px">
                USA</td>
            <td style="text-align: center; width: 86px">
                (208) 555-8097</td>
            <td style="text-align: center; width: 93px">
                Update Delete</td>
        </tr>
        <tr>
            <td style="text-align: center; width: 85px; height: 20px">
                2</td>
            <td style="width: 202px; height: 20px; text-align: center">
                Trail&#39;s Head Gourment Provisioners</td>
            <td style="width: 95px; height: 20px; text-align: center">
                Kirkland</td>
            <td style="width: 117px; height: 20px; text-align: center">
                WA</td>
            <td style="height: 20px; width: 91px; text-align: center">
                98034</td>
            <td style="height: 20px; width: 95px; text-align: center">
                USA</td>
            <td style="height: 20px; width: 86px; text-align: center">
                (206) 555-8257</td>
            <td style="height: 20px; width: 93px; text-align: center">
                Update Delete</td>
        </tr>
        <tr>
            <td style="height: 20px; width: 85px">
                &nbsp;</td>
            <td style="width: 202px; height: 20px">
                &nbsp;</td>
            <td style="height: 20px; width: 95px">
                &nbsp;</td>
            <td style="width: 117px; height: 20px">
                &nbsp;</td>
            <td style="height: 20px; width: 91px">
                &nbsp;</td>
            <td style="height: 20px; width: 95px">
                &nbsp;</td>
            <td style="height: 20px; width: 86px">
                &nbsp;</td>
            <td style="height: 20px; width: 93px">
                &nbsp;</td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td style="text-align: right">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="OK" 
                    Width="200px" />
            </td>
        </tr>
    </table>
    
<%-- Java Script Popup Sample Code--%>   
    <script type="text/javascript" id="Java Script Popup">
        function show_alert() {
            alert("Hello! I am an alert box!");
            confirm("Hello! I am an alert box!");
        }
    </script>
    <input type="button" onclick="show_alert()" value="Test Popup Message" />
<%-- Java Script Popup Sample Code--%> 
</asp:Content>

