<%@ Page Language="C#" MasterPageFile="~/top_mp_m.master" AutoEventWireup="true" CodeFile="cust_main.aspx.cs" Inherits="cust_main" Title="Veixy-We know how to care" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
function TABLE1_onclick() {

}
    </script>

    <table>
        <tr>
            <td style="width: 100px">
                <span style="font-size: 13pt; color: #a6a6a6; font-family: Calibri">About Viexy</span></td>
        </tr>
    </table>
    <div style="z-index: 103; left: -131px; width: 100px; position: absolute; top: 270px; height: 100px">
        <img src="Images/main_left2.gif" />
    </div>

    <table id="TABLE1" style="font-size: small; width: 570px" onclick="return TABLE1_onclick()">
        <tr>
            <td colspan="3" style="width: 458px">
                <p class="MsoNormal" style="margin: 0in 0in 10pt">
                    <span style="font-size: 14pt; line-height: 115%; mso-bidi-font-size: 12.0pt"><span
                        style="font-size: small; font-family: Calibri">We provide solutions for your business
                        by providing an efficient system for your customer support services.<br />
                    </span></span><span style="font-size: 14pt; line-height: 115%; mso-bidi-font-size: 12.0pt">
                        <span style="font-size: small; font-family: Calibri">Our system allows the formation
                            of individualized relationships with customers, with the aim of improving customer
                            satisfaction and maximizing profits.<o:p></o:p></span></span>
                </p>
            </td>
            <td align="right" colspan="1" valign="top"></td>
            <td align="center" colspan="1" style="width: 3px" valign="top">
                <img src="Images/sms_alert.gif" /></td>
        </tr>
    </table>
    <br />
    <br />
    <div style="z-index: 101; left: 605px; width: 165px; position: absolute; top: 19px; height: 100px">
        <table>
            <tr>
                <td style="width: 69px">&nbsp;<img src="Images/vbar.jpg" /></td>
                <td style="width: 100px">
                    <img src="Images/lnk1.jpg" /></td>
                <td style="width: 100px">
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="False" ForeColor="DarkOliveGreen"
                        Width="81px" PostBackUrl="~/cust_chat.aspx?user_id=0000000000">Support Chat</asp:LinkButton></td>
            </tr>
            <tr>
                <td style="width: 69px">&nbsp;<img src="Images/vbar.jpg" /></td>
                <td style="width: 100px">
                    <img src="Images/lnk2.jpg" /></td>
                <td style="width: 100px">
                    <asp:LinkButton ID="LinkButton2" runat="server" Font-Underline="False" ForeColor="DarkOliveGreen"
                        Width="81px" PostBackUrl="~/disc_main.aspx">Discussion</asp:LinkButton></td>
            </tr>
            <tr>
                <td style="width: 69px">&nbsp;<img src="Images/vbar.jpg" /></td>
                <td style="width: 100px">
                    <img src="Images/lnk3.jpg" /></td>
                <td align="center" style="width: 100px">
                    <asp:Label ID="Label1" runat="server" ForeColor="DarkGray" Text="Phone Support"
                        Width="87px"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Font-Size="X-Small" ForeColor="Chocolate" Text="111-abc-xyz"
                        Width="54px"></asp:Label></td>
            </tr>
        </table>
        <div style="z-index: 101; left: 21px; width: 100px; position: absolute; top: 224px; height: 100px">
            <img src="Images/lnk4.jpg" />
        </div>
    </div>
    <div style="z-index: 102; left: -14px; width: 100px; position: absolute; top: 121px; height: 100px">
        <table style="width: 427px">
            <tr>
                <td style="width: 100px">
                    <img src="Images/cz.jpg" /></td>
                <td style="width: 100px">
                    <img src="Images/sz.jpg" /></td>
                <td style="width: 100px">
                    <img src="Images/az.jpg" /></td>
            </tr>
        </table>
    </div>
</asp:Content>