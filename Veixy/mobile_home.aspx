<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mobile_home.aspx.cs" Inherits="mobile_home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: darkslateblue thin solid; border-top: darkslateblue thin solid; border-left: darkslateblue thin solid; width: 240px; border-bottom: darkslateblue thin solid; height: 321px">
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
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="token_no"
                            DataSourceID="SqlDataSource1" Font-Size="Small" Width="235px">
                            <Columns>
                                <asp:TemplateField HeaderText="Ticket #" SortExpression="token_no">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("token_no") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#000040" OnClick="LinkButton1_Click"
                                            Text='<%# Eval("token_no") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle ForeColor="#000040" Width="50px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="msg_subject" HeaderText="Issue" SortExpression="msg_subject" />
                            </Columns>
                            <HeaderStyle BackColor="LightGoldenrodYellow" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                            SelectCommand="SELECT [token_no], [msg_subject] FROM [cust_inbox] WHERE ([sent_from] = @sent_from)">
                            <SelectParameters>
                                <asp:SessionParameter Name="sent_from" SessionField="user_session" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <table style="width: 156px">
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