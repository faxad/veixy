<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_sentbox.aspx.cs" Inherits="admin_reg_pending" Title="Veixy-Sent Messages" EnableEventValidation="false" %>

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
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/cp_home.jpg"
                    PostBackUrl="~/admin_main.aspx" /></td>
            <td colspan="3" style="height: 21px; background-color: #f5faf1">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="DimGray" Text="Control Panel"
                    Width="82px"></asp:Label>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="LightGray" Text="--- Sent Items"
                    Width="235px"></asp:Label></td>
        </tr>
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="z-index: 101; left: 114px; width: 112px; position: absolute; top: 30px; height: 379px">
        <table style="width: 26px">
            <tr>
                <td style="width: 79px">
                    <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/reply_msg.jpg" /></td>
                <td style="width: 79px">
                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="bar_format" Font-Bold="True"
                        Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab"
                        Width="104px" Enabled="False">Compose Reply</asp:LinkButton></td>
                <td style="width: 79px">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/fwd_msg.jpg" /></td>
                <td style="width: 79px">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="bar_format" Font-Bold="True"
                        Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton1_Click"
                        Width="109px">Forward Message</asp:LinkButton></td>
                <td style="width: 79px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/del_msg.jpg" /></td>
                <td style="width: 198px">
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="bar_format" Font-Bold="True"
                        Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton2_Click"
                        Width="98px">Delete Message</asp:LinkButton></td>
            </tr>
        </table>
        <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; width: 707px; color: white; background-color: steelblue">
            <tr>
                <td style="width: 43px; height: 19px"></td>
                <td align="center" colspan="2" style="height: 19px; width: 7845px;">To</td>
                <td align="right" colspan="1" style="width: 130px; height: 19px">Recipient&nbsp;</td>
                <td align="center" style="width: 569px; height: 19px">Subject</td>
                <td align="left" colspan="2" style="width: 91px; height: 19px">Date</td>
                <td align="center" style="width: 30px; height: 19px"></td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server" Height="154px" ScrollBars="Vertical" Width="707px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" Width="682px" Font-Size="Small" Height="1px" ShowHeader="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="msg_id" OnRowDataBound="GridView1_RowDataBound">
                        <RowStyle Height="5px"></RowStyle>
                        <Columns>
                            <asp:ImageField DataImageUrlField="msg_img">
                                <ItemStyle Width="15px"></ItemStyle>
                            </asp:ImageField>
                            <asp:BoundField DataField="msg_to" HeaderText="msg_to" SortExpression="msg_from">
                                <ItemStyle Width="90px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="to_type" HeaderText="to_type" SortExpression="to_type">
                                <ItemStyle ForeColor="#C04000" Width="40px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject"></asp:BoundField>
                            <asp:BoundField DataField="msg_date" HeaderText="msg_date" SortExpression="msg_date">
                                <ItemStyle HorizontalAlign="Right" Width="80px"></ItemStyle>
                            </asp:BoundField>
                        </Columns>

                        <SelectedRowStyle BackColor="#F5FAF1"></SelectedRowStyle>

                        <HeaderStyle BackColor="SteelBlue" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT [msg_from], [msg_id], [subject], [msg_img], [to_type], [msg_to],CONVERT (VARCHAR, msg_date, 101) AS msg_date FROM [msg_box] WHERE (([msg_from] = @msg_from)) AND ([box_type])='sent' ORDER BY msg_id DESC, msg_date DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="msg_from" SessionField="user_session" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            </asp:ScriptManagerProxy>
            <div style="z-index: 102; left: 289px; width: 100px; position: absolute; top: 48px; height: 100px">
                &nbsp;<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                    DisplayAfter="1">
                    <ProgressTemplate>
                        <table>
                            <tr>
                                <td style="width: 66px; height: 21px"></td>
                                <td style="width: 56px; height: 21px">
                                    <img src="Images/ajax-loader2.gif" /></td>
                                <td style="width: 100px; height: 21px">
                                    <img src="Images/still-loading.gif" /></td>
                            </tr>
                        </table>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </asp:Panel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel2" runat="server" Width="707px" ScrollBars="Vertical" Height="283px">
                    <asp:DataList ID="DataList11" runat="server" Width="561px" DataSourceID="SqlDataSource2" __designer:wfdid="w291">
                        <ItemTemplate>
                            <table style="font-size: small; width: 687px; background-color: #f5faf1" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 50px; height: 21px">To:</td>
                                        <td style="height: 21px" colspan="8">
                                            <asp:Label ID="token_noLabel" runat="server" __designer:wfdid="w1" Text='<%# Eval("msg_to") %>'></asp:Label></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="font-size: small; width: 686px; background-color: #f5faf1">
                                <tbody>
                                    <tr>
                                        <td style="width: 46px; height: 18px" colspan="1">Date:</td>
                                        <td style="width: 71px; height: 18px" colspan="1">
                                            <asp:Label ID="msg_dateLabel" runat="server" Width="156px" __designer:wfdid="w45" Text='<%# Eval("msg_date") %>'></asp:Label></td>
                                        <td style="width: 257px; height: 18px" colspan="5"></td>
                                        <td style="height: 18px" colspan="1">
                                            <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/reply_pic.jpg" __designer:wfdid="w46"></asp:Image></td>
                                        <td style="width: 100px; height: 18px" colspan="1">
                                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" __designer:wfdid="w4" NavigateUrl="#abc" Enabled="False">Quick Reply</asp:HyperLink></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:TextBox ID="TextBox1" runat="server" Width="680px" Font-Size="Small" Height="222px" __designer:wfdid="w48" Text='<%# Eval("msg_text") %>' TextMode="MultiLine" Font-Names="Book Antiqua" ReadOnly="True"></asp:TextBox>
                        </ItemTemplate>
                    </asp:DataList><asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT [msg_id], [msg_to], [msg_date], [msg_text] FROM [msg_box] WHERE ([msg_id] = @msg_id)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" __designer:wfdid="w292">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="msg_id" Type="Decimal"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <a name="abc"></a>
                    <div style="z-index: 101; left: 185px; width: 198px; position: absolute; top: 267px; height: 22px" class="txt_boxx">
                        <table>
                            <tbody>
                                <tr>
                                    <td style="font-size: small; color: gainsboro; height: 23px" colspan="2">
                                        <asp:Label ID="Label2" runat="server" Width="206px" Text="Select a message to view the details"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </asp:Panel>
                <br />
                &nbsp; &nbsp;&nbsp;<br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:Panel ID="Panel3" runat="server" Height="232px" Width="105px">
        <asp:TreeView ID="TreeView1" runat="server" Height="90px" LineImagesFolder="~/TreeLineImages"
            ShowLines="True">
            <ParentNodeStyle Font-Bold="True" Font-Size="Small" ForeColor="#003399" />
            <HoverNodeStyle ForeColor="Olive" />
            <SelectedNodeStyle ForeColor="OliveDrab" />
            <Nodes>
                <asp:TreeNode Text="Message Box" Value="Message Box" NavigateUrl="~/admin_compose.aspx">
                    <asp:TreeNode Text="Inbox" Value="Inbox" NavigateUrl="~/admin_msgbox.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="Compose" Value="Compose" NavigateUrl="~/admin_compose.aspx?case=0"></asp:TreeNode>
                    <asp:TreeNode Text="Sent" Value="Sent" NavigateUrl="~/admin_sentbox.aspx" Selected="True"></asp:TreeNode>
                    <asp:TreeNode Text="Drafts" Value="Drafts" NavigateUrl="~/admin_draftbox.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="Deleted" Value="Deleted" NavigateUrl="~/admin_delbox.aspx"></asp:TreeNode>
                </asp:TreeNode>
            </Nodes>
            <NodeStyle Font-Size="Small" />
        </asp:TreeView>
    </asp:Panel>
</asp:Content>