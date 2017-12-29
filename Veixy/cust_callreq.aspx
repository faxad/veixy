<%@ Page Language="C#" MasterPageFile="~/top_mp3.master" AutoEventWireup="true" CodeFile="cust_callreq.aspx.cs" Inherits="cust_callreq" Title="Veixy-Call Back Request" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="z-index: 101; left: 0px; width: 555px; position: absolute; top: 0px; height: 279px">
        <table style="width: 341px">
            <tr>
                <td style="width: 62px"></td>
                <td style="width: 100px">
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal"
                        Width="132px" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="1">Scheduled</asp:ListItem>
                        <asp:ListItem Value="2">Urgent</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
        </table>
        <table>
            <tr>
                <td></td>
                <td style="width: 100px">Date/Time :
                </td>
                <td style="width: 50px">
                    <rad:RadDateTimePicker ID="RadDateTimePicker1" runat="server"></rad:RadDateTimePicker>
                </td>
                <td style="width: 59px">&nbsp;</td>
                <td style="width: 100px"></td>
            </tr>
        </table>
        <table style="width: 400px">
            <tr>
                <td style="width: 98px; height: 46px;">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="335px" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem Value="1" Selected="True">Use Existing Contact #</asp:ListItem>
                        <asp:ListItem Value="2">Specify Contact #</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td style="width: 100px; height: 46px">
                    <asp:TextBox ID="TextBox3" runat="server" BorderColor="YellowGreen"></asp:TextBox><br />
                </td>
            </tr>
        </table>
        <table style="width: 498px">
            <tr>
                <td style="width: 214px"></td>
                <td style="width: 7px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/i_sign.jpg" /></td>
                <td style="width: 717px; color: black">If your request is already associated with a token # than specify the reference
                    in the Issue field</td>
                <td style="width: 155px"></td>
            </tr>
        </table>
        <div style="z-index: 101; left: -118px; width: 70px; position: absolute; top: 268px; height: 78px">
            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="Images_Net/Untitled-1.jpg"
                PostBackUrl="~/cust_chat.aspx?user_id=0000000000" />
        </div>
        <br />
        <table style="width: 504px">
            <tr>
                <td style="width: 67px">Subject:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox4" runat="server" Width="418px" BorderColor="YellowGreen"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 67px">Issue:<br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox5" runat="server" Height="131px" TextMode="MultiLine" Width="417px" BorderColor="YellowGreen"></asp:TextBox></td>
            </tr>
        </table>
        <table>
            <tr>
                <td style="width: 382px"></td>
                <td style="width: 100px">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/send_img.jpg" OnClick="ImageButton1_Click" /></td>
            </tr>
        </table>
        &nbsp;
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
    </div>
    <div style="z-index: 102; left: 569px; width: 205px; position: absolute; top: 14px; height: 395px">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 92px">
                    <img src="Images_Net/zcdc.jpg" /></td>
            </tr>
            <tr>
                <td style="width: 92px">
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td style="width: 92px">
                    <img src="Images_Net/supporttt.jpg" /></td>
            </tr>
        </table>
    </div>
</asp:Content>