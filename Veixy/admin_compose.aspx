<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_compose.aspx.cs" Inherits="admin_reg_pending" Title="Veixy-Compose Message" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>

    <table border="0" cellspacing="0" style="width: 825px; height: 27px">
        <tr>
            <td style="width: 203px; height: 21px; background-color: white"></td>
            <td style="width: 27px; height: 21px; background-color: white">
                <asp:ImageButton ID="ImageButton11" runat="server" ImageUrl="~/Images/cp_home.jpg" OnClick="ImageButton11_Click" /></td>
            <td colspan="3" style="height: 21px; background-color: #f5faf1">
                <asp:Label ID="Label44" runat="server" Font-Bold="True" ForeColor="DimGray" Text="Control Panel"
                    Width="82px"></asp:Label>
                <asp:Label ID="Label33" runat="server" Font-Bold="True" ForeColor="LightGray" Text="--- Compose Message"
                    Width="235px"></asp:Label></td>
        </tr>
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width: 765px">
        <tr>
            <td style="width: 116px"></td>
            <td align="right" style="width: 100px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table style="width: 583px" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td style="width: 517px; height: 26px"></td>
                                    <td style="width: 517px; height: 26px">
                                        <div style="z-index: 102; left: 7px; width: 100px; position: absolute; top: -3px; height: 100px">
                                            <img src="Images/cbox.jpg" />
                                        </div>
                                    </td>
                                    <td style="height: 26px" align="center" colspan="3">
                                        <div style="z-index: 102; left: 294px; width: 100px; position: absolute; top: 230px; height: 100px" __designer:dtid="1407374883553339">
                                            &nbsp;<asp:UpdateProgress ID="UpdateProgress2" runat="server" __designer:dtid="1407374883553340" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="1" __designer:wfdid="w68">
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
                                    </td>
                                    <td style="width: 350px; height: 26px"></td>
                                    <td style="width: 100px; height: 26px"></td>
                                </tr>
                                <tr>
                                    <td style="width: 517px" rowspan="4"></td>
                                    <td style="font-size: small; height: 62px; text-decoration: none" align="left" colspan="4">
                                        <asp:Label ID="Label2" runat="server" Text="Please select the recipient category from the options below." ForeColor="SteelBlue" __designer:wfdid="w529"></asp:Label><br />
                                        <br />
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="432px" Height="16px" __designer:wfdid="w530" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" BorderColor="Black" RepeatDirection="Horizontal" Font-Size="9pt" BorderWidth="0px">
                                            <asp:ListItem Selected="True">Single Recipient</asp:ListItem>
                                            <asp:ListItem>Multiple Clients</asp:ListItem>
                                            <asp:ListItem>Client Group</asp:ListItem>
                                            <asp:ListItem>Staff Members</asp:ListItem>
                                            <asp:ListItem Enabled="False">Administrator</asp:ListItem>
                                        </asp:RadioButtonList>&nbsp; </td>
                                    <td style="width: 350px; height: 62px" align="left">&nbsp;<asp:Label ID="Label1" runat="server" Width="120px" Text="Add Recipient's ID" ForeColor="LightGray" __designer:wfdid="w531" Font-Size="Small"></asp:Label>
                                        <asp:TextBox ID="TextBox2" runat="server" Width="132px" __designer:wfdid="w532" BorderColor="SteelBlue" Enabled="False"></asp:TextBox>
                                        <asp:DropDownList ID="DropDownList1" runat="server" Width="139px" __designer:wfdid="w533" DataTextField="staff_id" DataSourceID="SqlDataSource2" DataValueField="staff_id" Visible="False"></asp:DropDownList><asp:SqlDataSource ID="SqlDataSource2" runat="server" __designer:wfdid="w534" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [staff_id] FROM [staff_info]"></asp:SqlDataSource>
                                        &nbsp;
                                        <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" ImageUrl="~/Images/add_img.jpg" __designer:wfdid="w535" Enabled="False"></asp:ImageButton>
                                        <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" runat="server" ForeColor="Green" Font-Underline="True" __designer:wfdid="w3" Font-Size="X-Small">(Remove ID)</asp:LinkButton></td>
                                    <td style="width: 100px; height: 62px"></td>
                                </tr>
                                <tr>
                                    <td style="height: 26px" align="left" colspan="4">
                                        <asp:Label ID="Label3" runat="server" Width="15px" Text="To:" ForeColor="SteelBlue" __designer:wfdid="w536" Font-Size="Small"></asp:Label>
                                        <br />
                                        <table style="width: 393px" cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td style="width: 251px">
                                                        <asp:TextBox ID="TextBox1" runat="server" Width="171px" __designer:wfdid="w537" BorderColor="SteelBlue"></asp:TextBox></td>
                                                    <td style="width: 100px">
                                                        <asp:Label ID="Label6" runat="server" Width="223px" Text="(Enter only one customer's user name)" ForeColor="LightGray" __designer:wfdid="w538" Font-Size="Small"></asp:Label></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <asp:Label ID="Label4" runat="server" Width="15px" Text="Subject:" ForeColor="SteelBlue" __designer:wfdid="w539" Font-Size="Small"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="TextBox3" runat="server" Width="430px" __designer:wfdid="w540" BorderColor="SteelBlue"></asp:TextBox></td>
                                    <td style="width: 350px; height: 26px">
                                        <asp:ListBox ID="ListBox1" runat="server" Width="183px" Height="86px" __designer:wfdid="w541" Enabled="False"></asp:ListBox></td>
                                    <td style="width: 100px; height: 26px"></td>
                                </tr>
                                <tr>
                                    <td style="width: 517px; height: 26px" align="left">
                                        <asp:Label ID="Label5" runat="server" Width="15px" Text="Message:" ForeColor="SteelBlue" __designer:wfdid="w542" Font-Size="Small"></asp:Label></td>
                                    <td style="width: 100px; height: 26px"></td>
                                    <td style="width: 100px; height: 26px"></td>
                                    <td style="width: 645px; height: 26px" align="center">
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" __designer:wfdid="w543" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [prod_name] FROM [prod_info]"></asp:SqlDataSource>
                                        <asp:Label ID="status_label" runat="server" ForeColor="Maroon" __designer:wfdid="w544" Font-Size="Small" BackColor="LemonChiffon"></asp:Label></td>
                                    <td style="width: 350px; height: 26px" align="left">
                                        <table style="width: 185px" cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td style="width: 46px">
                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/sav_msg.jpg" __designer:wfdid="w545"></asp:Image></td>
                                                    <td style="width: 111px">
                                                        <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Width="61px" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" __designer:wfdid="w546" Font-Size="9pt" BorderWidth="1px" BackColor="Transparent" BorderStyle="None">Save Draft</asp:LinkButton></td>
                                                    <td style="width: 40px">
                                                        <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg" __designer:wfdid="w547"></asp:Image></td>
                                                    <td style="width: 100px">
                                                        <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="83px" ForeColor="Maroon" Font-Underline="False" Font-Bold="True" __designer:wfdid="w548" Font-Size="9pt" BorderWidth="1px" BackColor="Transparent" BorderStyle="None">Send Message</asp:LinkButton></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" __designer:wfdid="w549" Font-Size="Small" ErrorMessage="Please specify subject" ControlToValidate="TextBox3"></asp:RequiredFieldValidator></td>
                                    <td style="width: 100px; height: 26px"></td>
                                </tr>
                                <tr>
                                    <td style="height: 26px" colspan="5">
                                        <asp:TextBox ID="TextBox4" runat="server" Width="619px" Height="210px" __designer:wfdid="w550" BorderColor="SteelBlue" TextMode="MultiLine"></asp:TextBox></td>
                                    <td style="width: 100px; height: 26px"></td>
                                </tr>
                            </tbody>
                        </table>
                        <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server" __designer:wfdid="w551">
                        </asp:ScriptManagerProxy>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="z-index: 101; left: 9px; width: 100px; position: absolute; top: 35px; height: 100px">
        <asp:TreeView ID="TreeView1" runat="server" Height="90px" LineImagesFolder="~/TreeLineImages"
            ShowLines="True">
            <ParentNodeStyle Font-Bold="True" Font-Size="Small" ForeColor="#003399" />
            <HoverNodeStyle ForeColor="Olive" />
            <SelectedNodeStyle ForeColor="OliveDrab" />
            <Nodes>
                <asp:TreeNode Text="Message Box" Value="Message Box">
                    <asp:TreeNode Text="Inbox" Value="Inbox" NavigateUrl="~/admin_msgbox.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="Compose" Value="Compose" NavigateUrl="~/admin_compose.aspx?case=0" Selected="True"></asp:TreeNode>
                    <asp:TreeNode Text="Sent" Value="Sent" NavigateUrl="~/admin_sentbox.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="Drafts" Value="Drafts" NavigateUrl="~/admin_draftbox.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="Deleted" Value="Deleted" NavigateUrl="~/admin_delbox.aspx"></asp:TreeNode>
                </asp:TreeNode>
            </Nodes>
            <NodeStyle Font-Size="Small" />
        </asp:TreeView>
    </div>
</asp:Content>