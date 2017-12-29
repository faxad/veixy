<%@ Page Language="C#" MasterPageFile="~/top_mp.master" AutoEventWireup="true" CodeFile="cust_compose.aspx.cs" Inherits="cust_compose" Title="Veixy-Compose" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function TABLE1_onclick() {

        }
    </script>

    <div style="z-index: 101; left: 0px; width: 758px; position: absolute; top: -18px; height: 100px">
        &nbsp;
        <div style="z-index: 103; left: 332px; width: 100px; position: absolute; top: 53px; height: 100px">
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <asp:Label ID="Label3" runat="server" Width="224px" ForeColor="Maroon" Font-Size="Small" BackColor="LemonChiffon" Visible="False"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Width="224px" ForeColor="Maroon" Font-Size="Small" BackColor="LemonChiffon" Visible="False"></asp:Label>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table>
                    <tbody>
                        <tr>
                            <td style="width: 373px; height: 137px" colspan="2">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td style="width: 100px; height: 32px">
                                                <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" ImageUrl="~/Images/send_img.jpg"></asp:ImageButton></td>
                                            <td style="width: 100px; height: 32px">
                                                <asp:ImageButton ID="ImageButton2" OnClick="ImageButton2_Click" runat="server" ImageUrl="~/Images/cancel_img.jpg"></asp:ImageButton></td>
                                            <td style="width: 100px; height: 32px"></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Selected="True" Value="1">Compose a new ticket</asp:ListItem>
                                    <asp:ListItem Value="2">Post a reply to an existing ticket</asp:ListItem>
                                </asp:RadioButtonList>
                                <table style="width: 556px">
                                    <tbody>
                                        <tr>
                                            <td style="width: 112px"></td>
                                            <td style="width: 100px">
                                                <asp:TextBox ID="TextBox1" runat="server" BorderColor="YellowGreen"></asp:TextBox></td>
                                            <td style="width: 143px">(Token #) </td>
                                            <td style="width: 167px">Topic Category</td>
                                            <td style="width: 100px">
                                                <asp:DropDownList ID="DropDownList1" runat="server" Width="159px" DataValueField="prod_title" DataTextField="prod_title" DataSourceID="SqlDataSource1" OnDataBound="DropDownList1_DataBound"></asp:DropDownList></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td style="width: 91px"></td>
                                            <td style="width: 190px">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Width="151px" Enabled="False" ControlToValidate="TextBox1" ErrorMessage="Specify your ticket #"></asp:RequiredFieldValidator></td>
                                            <td style="width: 100px"></td>
                                            <td style="width: 100px">
                                                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="CustomValidator"></asp:CustomValidator></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td style="width: 100px; height: 26px">Subject:</td>
                                            <td style="width: 99px; height: 26px">
                                                <asp:TextBox ID="TextBox2" runat="server" Width="495px" BorderColor="YellowGreen"></asp:TextBox></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT [prod_title] FROM [my_product] WHERE ([user_name] = @user_name)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="user_session" Name="user_name" Type="String"></asp:SessionParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <table style="width: 460px" id="TABLE1" onclick="return TABLE1_onclick()">
                                    <tbody>
                                        <tr>
                                            <td style="width: 226px; height: 19px"></td>
                                            <td style="width: 100px; height: 19px">
                                                <asp:Label ID="Label1" runat="server" Visible="False" BackColor="LemonChiffon" Font-Size="Small" ForeColor="Maroon" Width="224px"></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div style="z-index: 102; left: 608px; width: 100px; position: absolute; top: 187px; height: 100px">
                                    &nbsp;<asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="1" __designer:wfdid="w15">
                                        <ProgressTemplate>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 66px; height: 21px"></td>
                                                        <td style="width: 56px; height: 21px">
                                                            <img src="Images/ajax-loader2.gif" /></td>
                                                        <td style="width: 100px; height: 21px">
                                                            <img src="Images/still-processing.gif" id="IMG1" onclick="return IMG1_onclick()" /></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                            </td>
                            <td style="width: 104px; height: 137px" colspan="1">&nbsp;
                                <div style="z-index: 101; left: 622px; width: 132px; position: absolute; top: 65px; height: 165px">
                                    <img src="Images_Net/livesupport.gif" />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div style="z-index: 102; left: -162px; width: 100px; position: absolute; top: 289px; height: 283px">
                    <img src="Images_Net/helpline.gif" />
                </div>
                <table style="width: 743px">
                    <tbody>
                        <tr>
                            <td style="width: 682px">Message</td>
                            <td style="width: 100px" align="right">
                                <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Font-Size="X-Small" ForeColor="Green" __designer:wfdid="w16" Font-Underline="True">(Refresh All)</asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td style="height: 40px" colspan="2">
                                <asp:TextBox ID="TextBox3" runat="server" Width="762px" BorderColor="YellowGreen" TextMode="MultiLine" Height="318px"></asp:TextBox></td>
                        </tr>
                    </tbody>
                </table>
                <br />
                <br />
                <table style="width: 591px">
                    <tbody>
                        <tr>
                            <td style="width: 351px"></td>
                            <td style="width: 31px">
                                <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="X-Small" ForeColor="SteelBlue" Width="51px" Font-Underline="False" NavigateUrl="~/about_us.aspx">About Us</asp:HyperLink></td>
                            <td>
                                <img src="Images/lint_v.jpg" /></td>
                            <td style="width: 62px">
                                <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="X-Small" ForeColor="SteelBlue" Width="53px" Font-Underline="False" NavigateUrl="~/contact_us.aspx">Contact Us</asp:HyperLink></td>
                            <td>
                                <img src="Images/lint_v.jpg" /></td>
                            <td style="width: 100px">
                                <asp:Label ID="Label221" runat="server" Font-Size="X-Small" ForeColor="Gray" Font-Underline="False" Text="© Veixy.com"></asp:Label></td>
                            <td style="width: 98px"></td>
                        </tr>
                    </tbody>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>