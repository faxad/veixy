<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_mcompose.aspx.cs" Inherits="staff_msgbox" Title="Veixy-Compose Message" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                        <td style="height: 26px" align="center" colspan="3"></td>
                        <td style="width: 350px; height: 26px"></td>
                        <td style="width: 100px; height: 26px"></td>
                    </tr>
                    <tr>
                        <td style="width: 517px" rowspan="4"></td>
                        <td style="font-size: small; height: 62px; text-decoration: none" align="left" colspan="4">
                            <asp:Label ID="Label2" runat="server" Text="Please select the recipient category from the options below." ForeColor="SteelBlue"></asp:Label><br />
                            <br />
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" BorderWidth="0px" AutoPostBack="True" RepeatDirection="Horizontal" BorderColor="Black" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" Height="16px" Font-Size="9pt" Width="413px">
                                <asp:ListItem Selected="True">Single Recipient</asp:ListItem>
                                <asp:ListItem>Multiple Clients</asp:ListItem>
                                <asp:ListItem>Client Group</asp:ListItem>
                                <asp:ListItem>Staff Members</asp:ListItem>
                                <asp:ListItem>Administrator</asp:ListItem>
                            </asp:RadioButtonList>&nbsp;
                            <div style="z-index: 102; left: 189px; width: 100px; position: absolute; top: 159px; height: 100px" __designer:dtid="1407374883553339">
                                &nbsp;<asp:UpdateProgress ID="UpdateProgress2" runat="server" __designer:dtid="1407374883553340" DisplayAfter="1" AssociatedUpdatePanelID="UpdatePanel1" __designer:wfdid="w67">
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
                        <td style="width: 350px; height: 62px">&nbsp;<asp:Label ID="Label1" runat="server" Text="Add Recipient's ID" ForeColor="LightGray" Font-Size="Small" Width="103px"></asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server" BorderColor="SteelBlue" Width="132px" Enabled="False"></asp:TextBox>
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="139px" DataTextField="staff_id" DataValueField="staff_id" Visible="False" DataSourceID="SqlDataSource2"></asp:DropDownList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [staff_id] FROM [staff_info]"></asp:SqlDataSource>
                            &nbsp;
                            <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" Enabled="False" ImageUrl="~/Images/add_img.jpg"></asp:ImageButton>
                            <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" runat="server" ForeColor="Green" Font-Size="X-Small" __designer:wfdid="w2" Font-Underline="True">(Remove ID)</asp:LinkButton></td>
                        <td style="width: 100px; height: 62px"></td>
                    </tr>
                    <tr>
                        <td style="height: 26px" colspan="4">
                            <asp:Label ID="Label3" runat="server" Text="To:" ForeColor="SteelBlue" Font-Size="Small" Width="15px"></asp:Label>
                            <br />
                            <table style="width: 393px" cellspacing="0" cellpadding="0" border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 251px">
                                            <asp:TextBox ID="TextBox1" runat="server" BorderColor="SteelBlue" Width="171px"></asp:TextBox></td>
                                        <td style="width: 100px">
                                            <asp:Label ID="Label6" runat="server" Text="(Enter only one customer's user name)" ForeColor="LightGray" Font-Size="Small" Width="203px"></asp:Label></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:Label ID="Label4" runat="server" Text="Subject:" ForeColor="SteelBlue" Font-Size="Small" Width="15px"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBox3" runat="server" BorderColor="SteelBlue" Width="430px"></asp:TextBox></td>
                        <td style="width: 350px; height: 26px">
                            <asp:ListBox ID="ListBox1" runat="server" Height="86px" Width="183px" Enabled="False"></asp:ListBox></td>
                        <td style="width: 100px; height: 26px"></td>
                    </tr>
                    <tr>
                        <td style="width: 517px; height: 26px">
                            <asp:Label ID="Label5" runat="server" Text="Message:" ForeColor="SteelBlue" Font-Size="Small" Width="15px"></asp:Label></td>
                        <td style="width: 100px; height: 26px"></td>
                        <td style="width: 100px; height: 26px"></td>
                        <td style="width: 645px; height: 26px" align="center">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [prod_name] FROM [prod_info]"></asp:SqlDataSource>
                            <asp:Label ID="status_label" runat="server" ForeColor="Maroon" Font-Size="Small" BackColor="LemonChiffon"></asp:Label></td>
                        <td style="width: 350px; height: 26px">
                            <table style="width: 185px" cellspacing="0" cellpadding="0" border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 46px">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/sav_msg.jpg"></asp:Image></td>
                                        <td style="width: 111px">
                                            <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" ForeColor="OliveDrab" BorderWidth="1px" Font-Size="Small" Width="58px" Font-Underline="False" BackColor="Transparent" BorderStyle="None" Font-Bold="True">Save Draft</asp:LinkButton></td>
                                        <td style="width: 40px">
                                            <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                        <td style="width: 100px">
                                            <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" ForeColor="Maroon" BorderWidth="1px" Font-Size="Small" Width="80px" Font-Underline="False" BackColor="Transparent" BorderStyle="None" Font-Bold="True">Send Message</asp:LinkButton></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Size="Small" ErrorMessage="Please specify subject" ControlToValidate="TextBox3"></asp:RequiredFieldValidator></td>
                        <td style="width: 100px; height: 26px"></td>
                    </tr>
                    <tr>
                        <td style="height: 26px" colspan="5">
                            <asp:TextBox ID="TextBox4" runat="server" BorderColor="SteelBlue" Height="200px" Width="619px" TextMode="MultiLine"></asp:TextBox></td>
                        <td style="width: 100px; height: 26px"></td>
                    </tr>
                </tbody>
            </table>
            <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            </asp:ScriptManagerProxy>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
        function setMouseOverColor(element) {
            element.style.cursor = 'hand';
        }
    </script>
</asp:Content>