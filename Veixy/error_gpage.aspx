<%@ Page Language="C#" MasterPageFile="~/top_mp.master" AutoEventWireup="true" CodeFile="error_gpage.aspx.cs" Inherits="error_gpage" Title="Veixy-Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"
        Text="ERROR"></asp:Label><br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="A problem has occured while processing your request"></asp:Label><br />
    <br />
    <table>
        <tr>
            <td style="width: 90px">
                <asp:Label ID="Label3" runat="server" Font-Underline="True" Text="ERROR Code:"></asp:Label></td>
            <td style="width: 100px">
                <asp:Label ID="Label4" runat="server" ForeColor="Gray" Text="Label" Width="87px"></asp:Label></td>
        </tr>
    </table>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Please contact the Administrator."></asp:Label>
</asp:Content>