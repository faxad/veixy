<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mobile_compose.aspx.cs" Inherits="mobile_compose" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="TABLE2" border="0" cellpadding="0" cellspacing="0" onclick="return TABLE2_onclick()"
                style="border-right: darkslateblue thin solid; border-top: darkslateblue thin solid; border-left: darkslateblue thin solid; width: 240px; border-bottom: darkslateblue thin solid; height: 320px">
                <tr>
                    <td style="width: 100px" valign="top">
                        <table id="TABLE1" onclick="return TABLE1_onclick()" style="width: 238px">
                            <tr>
                                <td style="width: 100px; height: 52px">
                                    <img src="Images/mobile_logo.jpg" /></td>
                            </tr>
                        </table>
                        <table style="width: 150px">
                            <tr>
                                <td style="font-size: small; width: 15px; color: dimgray">
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text="Welcome," Width="46px"></asp:Label></td>
                                <td style="font-size: small; width: 100px; color: dimgray" valign="bottom">
                                    <asp:Label ID="Label3" runat="server" ForeColor="Silver" Text="Label" Width="81px"></asp:Label></td>
                            </tr>
                        </table>
                        <table style="width: 233px">
                            <tr>
                                <td style="width: 34px">
                                    <asp:Label ID="Label6" runat="server" Font-Size="Small" Font-Underline="True" Text="Compose Ticket"
                                        Width="96px"></asp:Label></td>
                                <td style="width: 2000px"></td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="Label4" runat="server" Font-Size="Small" Font-Underline="False" Text="Product:"
                                        Width="40px"></asp:Label></td>
                                <td style="width: 100px">
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                                        DataTextField="prod_title" DataValueField="prod_title" Width="159px">
                                    </asp:DropDownList></td>
                            </tr>
                        </table>
                        <table style="width: 233px">
                            <tr>
                                <td style="width: 38px">
                                    <asp:Label ID="Label5" runat="server" Font-Size="Small" Font-Underline="False" Text="Subject:"
                                        Width="39px"></asp:Label></td>
                                <td style="width: 100px">
                                    <asp:TextBox ID="TextBox2" runat="server" Width="176px"></asp:TextBox></td>
                            </tr>
                        </table>
                        <table id="Table3" onclick="return TABLE2_onclick()" style="font-size: small; width: 235px">
                            <tr>
                                <td colspan="3" style="font-size: small; height: 40px">
                                    <asp:TextBox ID="TextBox1" runat="server" Font-Size="Small" Height="124px" TextMode="MultiLine"
                                        Width="222px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 2px"></td>
                                <td style="width: 119px"></td>
                                <td align="right" style="width: 100px">
                                    <asp:Button ID="Button1" runat="server" Font-Size="X-Small" OnClick="Button1_Click"
                                        Text="Send" /></td>
                            </tr>
                        </table>
                        <asp:Label ID="statuss" runat="server" Font-Size="Small" ForeColor="DarkRed" Visible="False"
                            Width="231px"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                            SelectCommand="SELECT [prod_title] FROM [my_product] WHERE ([user_name] = @user_name)">
                            <SelectParameters>
                                <asp:SessionParameter Name="user_name" SessionField="user_session" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <table style="width: 156px">
                            <tr>
                                <td style="width: 13px">
                                    <img src="Images/i_mini.jpg" /></td>
                                <td style="width: 100px">
                                    <asp:HyperLink ID="HyperLink4" runat="server" Font-Size="Small" Font-Underline="False"
                                        ForeColor="#8080FF" NavigateUrl="~/mobile_home.aspx">Ticket Inbox</asp:HyperLink></td>
                            </tr>
                            <tr>
                                <td style="width: 13px">
                                    <img src="Images/l_mini.jpg" /></td>
                                <td style="width: 100px">
                                    <asp:HyperLink ID="HyperLink3" runat="server" Font-Size="Small" Font-Underline="False"
                                        ForeColor="#8080FF" NavigateUrl="~/mobile_main.aspx">Sign Out</asp:HyperLink></td>
                            </tr>
                        </table>
                        <table style="width: 237px">
                            <tr>
                                <td style="font-size: small; width: 100px; color: dimgray">
                                    <br />
                                    <asp:Label ID="Label2" runat="server" Text="For desktop targetted version of the website click on the link below."
                                        Width="227px"></asp:Label></td>
                            </tr>
                        </table>
                        <table style="width: 143px">
                            <tr>
                                <td align="right" style="font-size: small; width: 187px; color: dimgray"></td>
                                <td align="right" style="font-size: small; width: 100px; color: dimgray" valign="bottom">
                                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="False" ForeColor="#8080FF"
                                        NavigateUrl="~/cust_main.aspx">Veixy.com</asp:HyperLink></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>