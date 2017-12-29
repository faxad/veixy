<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_compose.aspx.cs" Inherits="staff_inbox" Title="Veixy-Compose" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 583px" cellspacing="0">
                <tbody>
                    <tr>
                        <td style="width: 517px; height: 26px"></td>
                        <td style="height: 26px" align="center" colspan="3"></td>
                        <td style="width: 350px; height: 26px"></td>
                        <td style="width: 100px; height: 26px"></td>
                    </tr>
                    <tr>
                        <td style="width: 517px; height: 62px">&nbsp;</td>
                        <td style="height: 62px" align="center" colspan="3">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="218px" Height="16px" Font-Size="Small" RepeatDirection="Horizontal" BorderColor="RoyalBlue" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Selected="True">One Recipient</asp:ListItem>
                                <asp:ListItem>Multiple Users</asp:ListItem>
                                <asp:ListItem>User Group</asp:ListItem>
                            </asp:RadioButtonList>&nbsp; </td>
                        <td style="width: 350px; height: 62px">&nbsp;<asp:Label ID="Label1" runat="server" Width="85px" Text="Add Recipients" ForeColor="LightGray" Font-Size="Small"></asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server" Width="107px" BorderColor="RoyalBlue" Enabled="False"></asp:TextBox>&nbsp;
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/add_img.jpg" OnClick="ImageButton1_Click" Enabled="False"></asp:ImageButton></td>
                        <td style="width: 100px; height: 62px"></td>
                    </tr>
                    <tr>
                        <td style="height: 26px" colspan="4">
                            <asp:Label ID="Label3" runat="server" Width="15px" Text="To:" ForeColor="RoyalBlue" Font-Size="Small"></asp:Label><br />
                            <asp:TextBox ID="TextBox1" runat="server" Width="126px" BorderColor="RoyalBlue"></asp:TextBox><br />
                            <asp:Label ID="Label4" runat="server" Width="15px" Text="Subject:" ForeColor="RoyalBlue" Font-Size="Small"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBox3" runat="server" Width="430px" BorderColor="RoyalBlue"></asp:TextBox></td>
                        <td style="width: 350px; height: 26px">
                            <asp:ListBox ID="ListBox1" runat="server" Width="138px" Height="86px" Enabled="False"></asp:ListBox></td>
                        <td style="width: 100px; height: 26px"></td>
                    </tr>
                    <tr>
                        <td style="width: 517px; height: 26px">
                            <asp:Label ID="Label5" runat="server" Width="15px" Text="Message:" ForeColor="RoyalBlue" Font-Size="Small"></asp:Label></td>
                        <td style="width: 100px; height: 26px"></td>
                        <td style="width: 100px; height: 26px"></td>
                        <td style="width: 645px; height: 26px" align="center">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT [prod_name] FROM [prod_info]" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"></asp:SqlDataSource>
                            <asp:Label ID="status_label" runat="server" ForeColor="Red" Font-Size="Small" BackColor="#FFFFC0"></asp:Label></td>
                        <td style="width: 350px; height: 26px">
                            <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg"></asp:Image>
                            <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="80px" ForeColor="OliveDrab" Font-Size="Small" Font-Underline="False" BorderStyle="None" Font-Bold="True" BackColor="Transparent" BorderWidth="1px">Send Message</asp:LinkButton></td>
                        <td style="width: 100px; height: 26px"></td>
                    </tr>
                    <tr>
                        <td style="height: 26px" colspan="5">
                            <asp:TextBox ID="TextBox4" runat="server" Width="573px" Height="232px" TextMode="MultiLine" BorderColor="RoyalBlue"></asp:TextBox></td>
                        <td style="width: 100px; height: 26px"></td>
                    </tr>
                </tbody>
            </table>
            <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            </asp:ScriptManagerProxy>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>