<%@ Page Language="C#" MasterPageFile="~/top_mp4.master" AutoEventWireup="true" CodeFile="cust_mcompose.aspx.cs" Inherits="cust_mcompose" Title="Veixy-Compose Message" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 657px" cellspacing="0">
                <tbody>
                    <tr>
                        <td style="width: 517px; height: 26px">
                            <asp:Label ID="Label2" runat="server" Width="63px" ForeColor="RoyalBlue" Font-Size="Small"></asp:Label></td>
                        <td style="height: 26px"></td>
                        <td style="height: 26px" align="left" colspan="4">
                            <div style="z-index: 101; left: -127px; width: 82px; position: absolute; top: 298px; height: 10px" id="DIV1" onclick="return DIV1_onclick()" __designer:dtid="4222124650659857">
                                <img src="Images/compose.jpg" __designer:dtid="4222124650659858" />
                            </div>
                        </td>
                        <td style="width: 100px; height: 26px"></td>
                    </tr>
                    <tr>
                        <td style="width: 517px" rowspan="4"></td>
                        <td style="height: 62px" align="left" colspan="4">
                            <br />
                            <table style="width: 534px">
                                <tbody>
                                    <tr>
                                        <td style="width: 100px; height: 19px" align="left">
                                            <asp:Label ID="Label6" runat="server" Width="76px" ForeColor="RoyalBlue" Font-Size="Small" Text="Message To:" __designer:wfdid="w441"></asp:Label></td>
                                        <td style="width: 100px; height: 19px"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="528px" Font-Size="9pt" __designer:wfdid="w439" Height="16px" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" BorderColor="RoyalBlue" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">Single Recipient</asp:ListItem>
                                <asp:ListItem>Multiple Clients</asp:ListItem>
                                <asp:ListItem Enabled="False">Client Group</asp:ListItem>
                                <asp:ListItem>Staff Members</asp:ListItem>
                                <asp:ListItem>Administrator</asp:ListItem>
                            </asp:RadioButtonList>&nbsp;&nbsp; </td>
                        <td style="width: 350px; height: 62px">&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" Width="112px" ForeColor="LightGray" Font-Size="Small" Text="Add Recipient's ID"></asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server" Width="132px" BorderColor="RoyalBlue" Enabled="False"></asp:TextBox>
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="139px" DataTextField="staff_id" DataSourceID="SqlDataSource2" DataValueField="staff_id" Visible="False"></asp:DropDownList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [staff_id] FROM [staff_info]"></asp:SqlDataSource>
                            &nbsp;
                            <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" Enabled="False" ImageUrl="~/Images/add_img.jpg"></asp:ImageButton>
                            <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" runat="server" ForeColor="Green" Font-Underline="True" Font-Size="X-Small" __designer:wfdid="w1">(Remove ID)</asp:LinkButton></td>
                        <td style="width: 100px; height: 62px"></td>
                    </tr>
                    <tr>
                        <td style="height: 26px" colspan="4">
                            <asp:Label ID="Label3" runat="server" Width="15px" ForeColor="RoyalBlue" Font-Size="Small" Text="To:"></asp:Label><br />
                            <asp:TextBox ID="TextBox1" runat="server" Width="171px" BorderColor="RoyalBlue"></asp:TextBox><br />
                            <asp:Label ID="Label4" runat="server" Width="15px" ForeColor="RoyalBlue" Font-Size="Small" Text="Subject:"></asp:Label>
                            <div style="z-index: 102; left: 322px; width: 100px; position: absolute; top: 186px; height: 100px" __designer:dtid="1407374883553339">
                                &nbsp;<asp:UpdateProgress ID="UpdateProgress2" runat="server" __designer:dtid="1407374883553340" __designer:wfdid="w66" DisplayAfter="1" AssociatedUpdatePanelID="UpdatePanel1">
                                    <ProgressTemplate __designer:dtid="1407374883553341">
                                        <table __designer:dtid="1407374883553342">
                                            <tbody __designer:dtid="1407374883553343">
                                                <tr __designer:dtid="1407374883553344">
                                                    <td __designer:dtid="1407374883553345" style="width: 66px; height: 21px"></td>
                                                    <td __designer:dtid="1407374883553346" style="width: 56px; height: 21px">
                                                        <img __designer:dtid="1407374883553347" src="Images/ajax-loader2.gif" /></td>
                                                    <td __designer:dtid="1407374883553348" style="width: 100px; height: 21px">
                                                        <img __designer:dtid="1407374883553349" src="Images/still-processing.gif" id="IMG1" onclick="return IMG1_onclick()" /></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                            <br />
                            <asp:TextBox ID="TextBox3" runat="server" Width="409px" BorderColor="RoyalBlue"></asp:TextBox></td>
                        <td style="width: 350px; height: 26px">
                            <asp:ListBox ID="ListBox1" runat="server" Width="187px" Height="86px" Enabled="False"></asp:ListBox></td>
                        <td style="width: 100px; height: 26px"></td>
                    </tr>
                    <tr>
                        <td style="height: 26px">
                            <asp:Label ID="Label5" runat="server" Width="15px" ForeColor="RoyalBlue" Font-Size="Small" Text="Message:"></asp:Label></td>
                        <td style="width: 100px; height: 26px"></td>
                        <td style="width: 100px; height: 26px"></td>
                        <td style="width: 727px; height: 26px" align="center">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [prod_name] FROM [prod_info]"></asp:SqlDataSource>
                            <asp:Label ID="status_label" runat="server" __designer:dtid="11258999068426287" ForeColor="Maroon" Font-Size="Small" __designer:wfdid="w35" BackColor="LemonChiffon"></asp:Label>&nbsp; </td>
                        <td style="width: 350px; height: 26px" align="center">
                            <table style="width: 185px" cellspacing="0" cellpadding="0" border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 46px; height: 20px">
                                            <asp:Image ID="Image1" runat="server" __designer:wfdid="w45" ImageUrl="~/Images/sav_msg.jpg"></asp:Image></td>
                                        <td style="width: 111px; height: 20px">
                                            <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Width="58px" ForeColor="OliveDrab" Font-Underline="False" Font-Size="X-Small" __designer:wfdid="w46" BackColor="Transparent" BorderStyle="None" BorderWidth="1px" Font-Bold="True">Save Draft</asp:LinkButton></td>
                                        <td style="width: 40px; height: 20px">
                                            <asp:Image ID="Image8" runat="server" __designer:wfdid="w47" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                        <td style="width: 100px; height: 20px">
                                            <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="80px" ForeColor="Maroon" Font-Underline="False" Font-Size="X-Small" __designer:wfdid="w48" BackColor="Transparent" BorderStyle="None" BorderWidth="1px" Font-Bold="True">Send Message</asp:LinkButton></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" __designer:wfdid="w1" ControlToValidate="TextBox3" ErrorMessage="Please specify subject"></asp:RequiredFieldValidator></td>
                        <td style="width: 100px; height: 26px"></td>
                    </tr>
                    <tr>
                        <td style="height: 26px" colspan="5">
                            <asp:TextBox ID="TextBox4" runat="server" Width="716px" Height="232px" BorderColor="RoyalBlue" TextMode="MultiLine"></asp:TextBox></td>
                        <td style="width: 100px; height: 26px"></td>
                    </tr>
                </tbody>
            </table>
            <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            </asp:ScriptManagerProxy>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>

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
                <asp:Label ID="Label221" runat="server" Font-Size="X-Small" Font-Underline="False"
                    ForeColor="Gray" Text="© Veixy.com"></asp:Label></td>
            <td style="width: 98px"></td>
        </tr>
    </table>
</asp:Content>