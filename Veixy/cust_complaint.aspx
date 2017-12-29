<%@ Page Language="C#" MasterPageFile="~/top_mp6.master" AutoEventWireup="true" CodeFile="cust_complaint.aspx.cs" Inherits="cust_complaint" Title="Veixy-Complaints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
function DIV1_onclick() {

}
    </script>

    <div style="z-index: 101; left: 190px; width: 215px; position: absolute; top: 50px; height: 292px">
        <table style="width: 386px; height: 100px">
            <tr>
                <td style="font-weight: bold; color: steelblue">Username:&nbsp;
                </td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox1" runat="server" Enabled="False" Style="text-align: center"
                        Width="242px">Anonymous</asp:TextBox></td>
            </tr>
            <tr>
                <td style="font-weight: bold; color: steelblue">Complaint:</td>
                <td style="width: 100px"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="TextBox2" runat="server" Height="212px" TextMode="MultiLine" Width="364px"></asp:TextBox><br />
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 367px">
                        <tr>
                            <td style="width: 295px">
                                <asp:Label ID="status_label" runat="server" BackColor="LemonChiffon" Font-Size="Small"
                                    ForeColor="Maroon"></asp:Label></td>
                            <td style="width: 100px">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/send_img.jpg"
                                    OnClick="ImageButton1_Click" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <table style="width: 301px">
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
    <div id="DIV1" style="z-index: 102; left: 5px; width: 100px; position: absolute; top: 1px; height: 195px"
        onclick="return DIV1_onclick()">
        <img src="Images_Net/cad.jpg" />
    </div>
    <div style="z-index: 103; left: 597px; width: 100px; position: absolute; top: 105px; height: 283px">
        <img src="Images_Net/fwc.jpg" />
    </div>
    <div style="z-index: 104; left: -134px; width: 100px; position: absolute; top: 272px; height: 100px">
        <img src="Images_Net/abch.jpg" />
    </div>
    <div style="z-index: 105; left: 160px; width: 600px; position: absolute; top: 1px; height: 45px">
        <asp:Label ID="Label5" runat="server" Style="color: black; font-family: Calibri"
            Text="Send in your complaints about the issues realated to the quality of our customer  support services that we have been providing. Any issues regarding unavailability, late replies etc will be taken into account."
            Width="569px"></asp:Label><br />
        <div style="font-size: 9pt; z-index: 101; left: -165px; width: 182px; color: dimgray; position: absolute; top: 187px; height: 100px">
            <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Italic="False" ForeColor="OliveDrab"
                Text="Dear Customer,"></asp:Label><br />
            <br />
            None of your complaints will be shared with any of our support
            staff. However you
            may be contacted by our Quality Control Professional regarding the issue.
        </div>
        <br />
    </div>
</asp:Content>