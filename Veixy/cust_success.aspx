<%@ Page Language="C#" MasterPageFile="~/top_mp.master" AutoEventWireup="true" CodeFile="cust_success.aspx.cs" Inherits="cust_success" Title="Veixy-Request Registered" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 572px">
        <tr>
            <td style="width: 34px"></td>
            <td style="width: 446px">
                <strong style="color: dimgray">Complaint Registered !</strong></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 34px"></td>
            <td style="width: 446px"></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 34px"></td>
            <td style="width: 446px">Your request ticket is generated successfully. Our service consultents will be contacting
                you shortly.</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 34px"></td>
            <td style="width: 446px">.</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 34px"></td>
            <td style="width: 446px"></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 34px"></td>
            <td style="width: 446px">Ticket #:
                <asp:Label ID="Label1" runat="server" ForeColor="Maroon"></asp:Label></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 34px"></td>
            <td style="width: 446px"></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 34px"></td>
            <td style="width: 446px"></td>
            <td style="width: 100px"></td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="width: 34px"></td>
            <td style="width: 100px">
                <span style="text-decoration: underline; color: steelblue;">Alerts Report</span></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 34px"></td>
            <td style="width: 100px"></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 34px"></td>
            <td style="width: 100px">.</td>
            <td style="width: 100px"></td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="width: 74px"></td>
            <td style="width: 100px; height: 19px">Email Aert:</td>
            <td style="width: 100px; height: 19px">
                <asp:Label ID="Label2" runat="server" ForeColor="DarkOliveGreen"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 74px"></td>
            <td style="width: 100px">Mobile Alert:</td>
            <td style="width: 100px">
                <asp:Label ID="Label3" runat="server" ForeColor="DarkOliveGreen"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 74px"></td>
            <td style="width: 100px"></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 74px"></td>
            <td style="width: 100px">.</td>
            <td style="width: 100px"></td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="width: 39px"></td>
            <td style="font-size: small; width: 317px; color: black">Please check you profile for the alert configuration if prompted with a "Not Sent"
                status in the above report.&nbsp;</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 39px"></td>
            <td style="font-size: small; width: 317px; color: black"></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 39px"></td>
            <td style="font-size: small; width: 317px; color: black">.</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 39px"></td>
            <td style="font-size: small; width: 317px; color: darkgray">If you have any issue concerning the alerts, contact the admin by registering a
                complaint.</td>
            <td style="width: 100px"></td>
        </tr>
    </table>
</asp:Content>