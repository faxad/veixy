<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mobile_main.aspx.cs" Inherits="mobile_main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script language="javascript" type="text/javascript">
        function TABLE1_onclick() {

        }

        function TABLE2_onclick() {

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="0" cellpadding="0" cellspacing="0" style="width: 240px; height: 320px; border-right: darkslateblue thin solid; border-top: darkslateblue thin solid; border-left: darkslateblue thin solid; border-bottom: darkslateblue thin solid;">
                <tr>
                    <td style="width: 100px" valign="top">
                        <table id="TABLE1" onclick="return TABLE1_onclick()" style="width: 238px">
                            <tr>
                                <td style="width: 100px; height: 52px;">
                                    <img src="Images/mobile_logo.jpg" /></td>
                            </tr>
                        </table>
                        <table style="width: 237px">
                            <tr>
                                <td style="font-size: small; width: 100px; color: dimgray">
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text="Welcome to the mobile edition of Veixy.com."
                                        Width="227px"></asp:Label></td>
                            </tr>
                        </table>
                        <br />
                        <table id="TABLE2" style="width: 235px; font-size: small;" onclick="return TABLE2_onclick()">
                            <tr>
                                <td style="width: 2px"></td>
                                <td style="width: 50px; font-size: small;">Username:</td>
                                <td style="width: 100px">
                                    <asp:TextBox ID="TextBox1" runat="server" Width="106px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 2px"></td>
                                <td style="width: 50px">Password:</td>
                                <td style="width: 100px">
                                    <asp:TextBox ID="TextBox2" runat="server" Width="106px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 2px"></td>
                                <td style="width: 50px"></td>
                                <td style="width: 100px"></td>
                            </tr>
                            <tr>
                                <td style="width: 2px"></td>
                                <td style="width: 50px"></td>
                                <td align="right" style="width: 100px">
                                    <asp:Button ID="Button1" runat="server" Font-Size="X-Small" OnClick="Button1_Click"
                                        Text="Submit" /></td>
                            </tr>
                            <tr>
                                <td style="width: 2px"></td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="statuss" runat="server" Font-Size="Small" ForeColor="DarkRed" Visible="False"
                                        Width="222px"></asp:Label></td>
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