<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mobile_inbox.aspx.cs" Inherits="mobile_inbox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script language="javascript" type="text/javascript">
function TABLE2_onclick() {

}
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="TABLE2" border="0" cellpadding="0" cellspacing="0" style="border-right: darkslateblue thin solid; border-top: darkslateblue thin solid; border-left: darkslateblue thin solid; width: 240px; border-bottom: darkslateblue thin solid; height: 320px"
                onclick="return TABLE2_onclick()">
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
                        <table>
                            <tr>
                                <td style="width: 34px">
                                    <asp:Label ID="Label4" runat="server" Font-Size="Small" Font-Underline="True" Text="Ticket #"
                                        Width="46px"></asp:Label></td>
                                <td style="width: 100px">
                                    <asp:Label ID="Label5" runat="server" Font-Size="Small" ForeColor="Chocolate" Text="Label"
                                        Width="81px"></asp:Label></td>
                            </tr>
                        </table>
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Font-Size="Small" Width="233px">
                            <ItemTemplate>
                                From:
                            <asp:Label ID="msg_fromLabel" runat="server" Text='<%# Eval("msg_from") %>' ForeColor="SteelBlue" Width="150px"></asp:Label><br />
                                Date :
                            <asp:Label ID="msg_dateLabel" runat="server" Text='<%# Eval("msg_date") %>' ForeColor="SteelBlue" Width="190px"></asp:Label><br />
                                Message:
                            <asp:Label ID="act_msgLabel" runat="server" Text='<%# Eval("act_msg") %>' Width="227px"></asp:Label><br />
                                <br />
                            </ItemTemplate>
                            <AlternatingItemStyle ForeColor="Gray" />
                        </asp:DataList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                            SelectCommand="SELECT [msg_from], [msg_date], [act_msg] FROM [act_onbox] WHERE ([token_no] = @token_no)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="token_no" QueryStringField="ticket_id" Type="Decimal" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <table id="Table3" onclick="return TABLE2_onclick()" style="font-size: small; width: 235px">
                            <tr>
                                <td colspan="3" style="font-size: small; height: 40px">
                                    <table>
                                        <tr>
                                            <td style="width: 34px">
                                                <asp:Label ID="Label6" runat="server" Font-Size="Small" Font-Underline="True" Text="Quick Reply"
                                                    Width="66px"></asp:Label></td>
                                            <td style="width: 100px"></td>
                                        </tr>
                                    </table>
                                    <asp:TextBox ID="TextBox1" runat="server" Font-Size="Small" Height="102px" TextMode="MultiLine"
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
                        <br />
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
                                    <img src="Images/c_mini.jpg" /></td>
                                <td style="width: 100px">
                                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="Small" Font-Underline="False"
                                        ForeColor="#8080FF" NavigateUrl="~/mobile_compose.aspx">Compose Ticket</asp:HyperLink></td>
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