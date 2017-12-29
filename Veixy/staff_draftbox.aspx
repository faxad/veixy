<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_draftbox.aspx.cs" Inherits="staff_msgbox" Title="Veixy-Drafts" EnableEventValidation="false" %>

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
                        <img src="Images/dbox.jpg" />
                    </div>
                </td>
                <td style="width: 79px">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/fwd_msg.jpg" /></td>
                <td style="width: 79px">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="bar_format" Font-Bold="True"
                        Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton1_Click"
                        Width="109px">Forward Message</asp:LinkButton></td>
                <td style="width: 79px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/del_msg.jpg" /></td>
                <td style="width: 79px">
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="bar_format" Font-Bold="True"
                        Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton2_Click"
                        Width="114px">Delete Permanently</asp:LinkButton></td>
            </tr>
        </table>
        <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; color: white; background-color: steelblue"
            width="777">
            <tr>
                <td style="width: 43px; height: 19px"></td>
                <td align="center" colspan="2" style="width: 7845px; height: 19px">To</td>
                <td align="right" colspan="1" style="width: 102px; height: 19px">Recipient&nbsp;</td>
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
                            <asp:BoundField DataField="msg_to" HeaderText="msg_to" SortExpression="msg_from">
                                <ItemStyle Width="90px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="to_type" HeaderText="to_type" SortExpression="to_type">
                                <ItemStyle Width="40px"></ItemStyle>
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
                SelectCommand="SELECT [msg_from], [msg_id], [subject], [msg_img], [to_type], [msg_to],CONVERT (VARCHAR, msg_date, 101) AS msg_date FROM [msg_box] WHERE (([msg_from] = @msg_from)) AND ([box_type])='draft' ORDER BY msg_id DESC, msg_date DESC">
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
                <asp:Panel ID="Panel2" runat="server" Width="632px" ScrollBars="Vertical" Height="232px">
                    <asp:DataList ID="DataList11" runat="server" Width="561px" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <table style="font-size: small; background-color: #f5faf1" cellspacing="0" width="613">
                                <tbody>
                                    <tr>
                                        <td style="width: 50px; height: 21px">To:</td>
                                        <td style="height: 21px" colspan="8">
                                            <asp:Label ID="token_noLabel" runat="server" Text='<%# Eval("msg_to") %>' __designer:wfdid="w881"></asp:Label></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="font-size: small; background-color: #f5faf1" width="613">
                                <tbody>
                                    <tr>
                                        <td style="width: 46px; height: 18px" colspan="1">Date:</td>
                                        <td style="width: 71px; height: 18px" colspan="1">
                                            <asp:Label ID="msg_dateLabel" runat="server" Width="156px" Text='<%# Eval("msg_date") %>' __designer:wfdid="w882"></asp:Label></td>
                                        <td style="width: 257px; height: 18px" colspan="5"></td>
                                        <td style="height: 18px" colspan="1">
                                            <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/send_but.jpg" __designer:wfdid="w883"></asp:Image></td>
                                        <td style="width: 100px; height: 18px" colspan="1">
                                            <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="93px" ForeColor="Maroon" Font-Underline="False" Font-Size="Small" Font-Bold="True" CssClass="bar_format" __designer:wfdid="w884">Send Message</asp:LinkButton></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:TextBox ID="TextBox1" runat="server" Width="607px" Font-Size="Small" Height="175px" Text='<%# Eval("msg_text") %>' Font-Names="Book Antiqua" TextMode="MultiLine" __designer:wfdid="w885"></asp:TextBox>
                        </ItemTemplate>
                    </asp:DataList><asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT [msg_id], [msg_to], [msg_date], [msg_text] FROM [msg_box] WHERE ([msg_id] = @msg_id)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
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
                <br />
                &nbsp; &nbsp;&nbsp;<br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <script language="javascript" type="text/javascript">
function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>
</asp:Content>