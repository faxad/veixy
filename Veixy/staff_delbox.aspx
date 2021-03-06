<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_delbox.aspx.cs" Inherits="staff_msgbox" Title="Veixy-Deleted Messages" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="z-index: 101; left: 1px; width: 112px; position: absolute; top: 30px; height: 379px">
        <table style="width: 26px">
            <tr>
                <td style="width: 79px">
                    <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/reply_msg.jpg" /></td>
                <td style="width: 79px">
                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="bar_format" Enabled="False"
                        Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab"
                        Width="91px">Compose Reply</asp:LinkButton>
                    <div style="z-index: 102; left: 7px; width: 100px; position: absolute; top: -31px; height: 100px">
                        <img src="Images/dbox2.jpg" />
                    </div>
                </td>
                <td style="width: 79px">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/fwd_msg.jpg" /></td>
                <td style="width: 79px">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="bar_format" Enabled="False"
                        Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab"
                        Width="109px">Forward Message</asp:LinkButton></td>
                <td style="width: 79px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/restore.jpg" /></td>
                <td style="width: 79px">
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="bar_format" Font-Bold="True"
                        Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton2_Click"
                        Width="100px">Restore Message</asp:LinkButton></td>
                <td style="width: 79px">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/del_msg.jpg" /></td>
                <td style="width: 79px">
                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="bar_format" Font-Bold="True"
                        Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton3_Click"
                        Width="93px">Delete Message</asp:LinkButton></td>
                <td style="width: 79px">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/del_all.jpg" /></td>
                <td style="width: 79px">
                    <asp:LinkButton ID="LinkButton5" runat="server" CssClass="bar_format" Font-Bold="True"
                        Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton5_Click"
                        Width="93px">Delete All</asp:LinkButton></td>
            </tr>
        </table>
        <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; color: white; background-color: steelblue"
            width="777">
            <tr>
                <td style="width: 56px; height: 19px"></td>
                <td align="center" colspan="2" style="width: 7845px; height: 19px">From</td>
                <td align="center" colspan="1" style="width: 165px; height: 19px">To</td>
                <td align="left" colspan="1" style="width: 155px; height: 19px">Recipient</td>
                <td align="center" style="width: 569px; height: 19px">Subject</td>
                <td align="left" colspan="2" style="width: 91px; height: 19px">Date</td>
                <td align="center" style="width: 30px; height: 19px"></td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server" Height="154px" ScrollBars="Vertical" Width="632px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" Width="614px" Font-Size="Small" Height="1px" DataSourceID="SqlDataSource1" DataKeyNames="msg_id" AutoGenerateColumns="False" ShowHeader="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
                        <RowStyle Height="5px"></RowStyle>
                        <Columns>
                            <asp:ImageField DataImageUrlField="msg_img">
                                <ItemStyle Width="15px"></ItemStyle>
                            </asp:ImageField>
                            <asp:BoundField DataField="msg_from" HeaderText="msg_from" SortExpression="msg_from">
                                <ItemStyle Width="90px"></ItemStyle>
                            </asp:BoundField>
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
                SelectCommand="SELECT msg_from, msg_id, subject, msg_img, to_type, msg_to, CONVERT (VARCHAR, msg_date, 101) AS msg_date FROM msg_box WHERE (msg_from = @msg_from) AND (box_type = @deleted) OR (box_type = @deleted) AND (msg_to = @msg_to) ORDER BY msg_id DESC, msg_date DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="msg_from" SessionField="user_session" />
                    <asp:SessionParameter Name="deleted" SessionField="user_session" />
                    <asp:SessionParameter Name="msg_to" SessionField="user_session" />
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
                <asp:Panel ID="Panel2" runat="server" Width="632px" ScrollBars="Vertical" Height="232px">
                    <asp:DataList ID="DataList11" runat="server" Width="561px" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <table style="font-size: small; background-color: #f5faf1" cellspacing="0" width="613">
                                <tbody>
                                    <tr>
                                        <td style="width: 24px; height: 21px">To:</td>
                                        <td style="width: 50px; height: 21px">
                                            <asp:Label ID="token_noLabel" runat="server" Text='<%# Eval("msg_to") %>' __designer:wfdid="w158"></asp:Label></td>
                                        <td style="width: 50px; height: 21px" align="center">From:</td>
                                        <td style="width: 50px; height: 21px">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("msg_from") %>' __designer:wfdid="w159"></asp:Label></td>
                                        <td style="height: 21px" colspan="8"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="font-size: small; background-color: #f5faf1" width="613">
                                <tbody>
                                    <tr>
                                        <td style="width: 46px; height: 18px" colspan="1">Date:</td>
                                        <td style="width: 71px; height: 18px" colspan="1">
                                            <asp:Label ID="msg_dateLabel" runat="server" Width="156px" Text='<%# Eval("msg_date") %>' __designer:wfdid="w160"></asp:Label></td>
                                        <td style="width: 257px; height: 18px" colspan="5"></td>
                                        <td style="height: 18px" colspan="1">
                                            <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/reply_pic.jpg" __designer:wfdid="w161"></asp:Image></td>
                                        <td style="width: 100px; height: 18px" colspan="1">
                                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" Enabled="False" NavigateUrl="#abc" __designer:wfdid="w162">Quick Reply</asp:HyperLink></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:TextBox ID="TextBox1" runat="server" Width="607px" Font-Size="Small" Height="175px" Text='<%# Eval("msg_text") %>' Font-Names="Book Antiqua" TextMode="MultiLine" ReadOnly="True" __designer:wfdid="w163"></asp:TextBox>
                        </ItemTemplate>
                    </asp:DataList><asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT [msg_id], [msg_to],[msg_from], [msg_date], [msg_text] FROM [msg_box] WHERE ([msg_id] = @msg_id)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
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
                                        <asp:Label ID="Label2" runat="server" Text="Select a message to view the details"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <script language="javascript" type="text/javascript">
        function setMouseOverColor(element) {
            element.style.cursor = 'hand';
        }
    </script>
</asp:Content>