<%@ Page Language="C#" MasterPageFile="~/top_mp.master" AutoEventWireup="true" CodeFile="contact_us.aspx.cs" Inherits="contact_us" Title="Veixy-Contact Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="1" cellspacing="1" width="100%">
        <tr>
            <td align="left" colspan="2" valign="top">
                <span class="pageText3"></span>
            </td>
        </tr>
        <tr>
            <td align="left" class="pageText2" colspan="2" valign="top">
                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                    <tr align="left" valign="top">
                        <td class="pageText3" colspan="2">&nbsp;</td>
                    </tr>
                    <tr align="left" valign="top">
                        <td colspan="2">
                            <a href="/ccp/index.jsp?pg_name=ccpmapp/shared/assets/page/email"><span class="pageText3">
                                <strong>By E-mail</strong></span></a></td>
                    </tr>
                    <tr align="left" valign="top">
                        <td class="pageText2" colspan="2">Send us a mail at fawadhq@live.com<br />
                        </td>
                    </tr>
                    <tr align="left" valign="top">
                        <td class="pageText2" colspan="2"></td>
                    </tr>
                    <tr align="left" valign="top">
                        <td class="pageText2" colspan="2">
                            <a href="/ccp/index.jsp?pg_name=ccpmapp/shared/assets/page/phone2"><span class="pageText3">
                                <strong>By Phone</strong></span></a></td>
                    </tr>
                    <tr align="left" valign="top">
                        <td class="pageText2" colspan="2">We are available 24x7. Call us at 111-abc-xyz<br />
                            <br />
                        </td>
                    </tr>
                    <tr align="left" valign="top">
                        <td class="pageText2" colspan="2">
                            <a href="/ccp/index.jsp?pg_name=ccpmapp/shared/assets/page/findus"><span class="pageText3">
                                <strong>Pay Us a Visit</strong></span></a></td>
                    </tr>
                    <tr align="left" valign="top">
                        <td class="pageText2" colspan="2"></td>
                    </tr>
                    <tr align="left" valign="top">
                        <td class="pageText2" colspan="2">
                            <span class="pageText3"><strong>Post us a mail</strong></span></td>
                    </tr>
                    <tr align="left" valign="top">
                        <td class="pageText2" colspan="2">
                            <br />
                            Office name<br />
                            Mail code ABC<br />
                            Veixy Location<br />
                            Veixy Country, 0000<br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <table style="width: 591px">
        <tr>
            <td style="width: 351px"></td>
            <td style="width: 31px">
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="X-Small" Font-Underline="False"
                    ForeColor="SteelBlue" NavigateUrl="~/about_us.aspx" Width="51px">About Us</asp:HyperLink></td>
            <td>
                <img src="Images/lint_v.jpg" /></td>
            <td style="width: 62px">
                <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="X-Small" Font-Underline="False"
                    ForeColor="SteelBlue" NavigateUrl="~/contact_us.aspx" Width="53px">Contact Us</asp:HyperLink></td>
            <td>
                <img src="Images/lint_v.jpg" /></td>
            <td style="width: 100px">
                <asp:Label ID="Label2" runat="server" Font-Size="X-Small" Font-Underline="False"
                    ForeColor="Gray" Text="© Veixy.com"></asp:Label></td>
            <td style="width: 98px"></td>
        </tr>
    </table>
</asp:Content>