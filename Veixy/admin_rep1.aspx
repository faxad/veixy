<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_rep1.aspx.cs" Inherits="admin_rep1" Title="Veixy-Reports" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellspacing="0" style="width: 825px; height: 27px">
        <tr>
            <td style="width: 203px; height: 21px; background-color: white"></td>
            <td style="width: 27px; height: 21px; background-color: white">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/cp_home.jpg"
                    PostBackUrl="~/admin_main.aspx" /></td>
            <td colspan="3" style="height: 21px; background-color: #f5faf1">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="DimGray" Text="Control Panel"
                    Width="82px"></asp:Label>
                <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="LightGray" Text="--- Current System Status"
                    Width="235px"></asp:Label></td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <table style="width: 759px">
        <tr>
            <td style="width: 221px"></td>
            <td style="width: 100px"></td>
            <td style="width: 100px"></td>
            <td style="width: 156px"></td>
            <td style="width: 100px"></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 221px"></td>
            <td style="width: 100px">Online Users:</td>
            <td style="width: 100px">
                <asp:Label ID="Label1" runat="server" ForeColor="OliveDrab" Text="Label"></asp:Label></td>
            <td style="width: 156px">Items Held:</td>
            <td style="width: 100px">
                <asp:Label ID="Label4" runat="server" ForeColor="OliveDrab" Text="Label"></asp:Label></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 221px"></td>
            <td style="width: 100px">Online Staff:</td>
            <td style="width: 100px">
                <asp:Label ID="Label2" runat="server" ForeColor="OliveDrab" Text="Label"></asp:Label></td>
            <td style="width: 156px">Open Tickets:</td>
            <td style="width: 100px">
                <asp:Label ID="Label5" runat="server" ForeColor="OliveDrab" Text="Label"></asp:Label></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 221px"></td>
            <td style="width: 100px">Locked Items:</td>
            <td style="width: 100px">
                <asp:Label ID="Label3" runat="server" ForeColor="OliveDrab" Text="Label"></asp:Label></td>
            <td style="width: 156px">Pending Appointment:</td>
            <td style="width: 100px">
                <asp:Label ID="Label6" runat="server" ForeColor="OliveDrab" Text="Label"></asp:Label></td>
            <td style="width: 100px"></td>
        </tr>
    </table>
    <br />
    <br />
    <table style="width: 738px">
        <tr>
            <td style="width: 195px"></td>
            <td style="width: 418px">The following figures are recorded at
                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>.</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 195px"></td>
            <td style="width: 418px">In order to update the displayed values with the current one's
                <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="X-Small" PostBackUrl="~/admin_rep1.aspx">Click Here</asp:LinkButton></td>
            <td style="width: 100px"></td>
        </tr>
    </table>
</asp:Content>