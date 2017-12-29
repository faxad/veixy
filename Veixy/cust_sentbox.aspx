<%@ Page Language="C#" MasterPageFile="~/top_mp4.master" AutoEventWireup="true" CodeFile="cust_sentbox.aspx.cs" Inherits="cust_sentbox" Title="Veixy-Sent Messages" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="z-index: 101; left: 0px; width: 240px; position: absolute; top: 0px; height: 379px">
        <table style="width: 26px">
            <tr>
                <td style="width: 79px; height: 22px">
                    <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/reply_msg.jpg" /></td>
                <td style="width: 79px; height: 22px">
                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="bar_format" Enabled="False"
                        Font-Bold="True" Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab"
                        Width="91px">Compose Reply</asp:LinkButton></td>
                <td style="width: 79px; height: 22px">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/fwd_msg.jpg" /></td>
                <td style="width: 79px; height: 22px">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="bar_format" Font-Bold="True"
                        Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton1_Click"
                        Width="109px">Forward Message</asp:LinkButton></td>
                <td style="width: 79px; height: 22px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/del_msg.jpg" /></td>
                <td style="width: 79px; height: 22px">
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="bar_format" Font-Bold="True"
                        Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton2_Click"
                        Width="93px">Delete Message</asp:LinkButton></td>
            </tr>
        </table>
        <div id="DIV1" onclick="return DIV1_onclick()" style="z-index: 101; left: -135px; width: 56px; position: absolute; top: 297px; height: 10px">
            <img src="Images/sent.jpg" id="IMG1" onclick="return IMG1_onclick()" />
        </div>
        <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; color: white; background-color: steelblue"
            width="777">
            <tr>
                <td style="width: 43px; height: 19px"></td>
                <td align="center" colspan="2" style="width: 62603px; height: 19px">To</td>
                <td align="center" colspan="1" style="width: 166px; height: 19px">Recipient&nbsp;</td>
                <td align="center" style="width: 569px; height: 19px">Subject</td>
                <td align="left" colspan="2" style="width: 91px; height: 19px">Date</td>
                <td align="center" style="width: 30px; height: 19px"></td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server" Height="154px" ScrollBars="Vertical" Width="777px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" Width="758px" Font-Size="Small" Height="1px" __designer:wfdid="w28" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowHeader="False" AutoGenerateColumns="False" DataKeyNames="msg_id" DataSourceID="SqlDataSource1">
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
                SelectCommand="SELECT msg_from, msg_id, subject, msg_img, to_type, msg_to, CONVERT (VARCHAR, msg_date, 101) AS msg_date FROM msg_box WHERE (msg_from = @msg_from) AND (box_type = 'sent') ORDER BY msg_id DESC, msg_date DESC">
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
                <asp:Panel ID="Panel2" runat="server" Width="777px" Height="230px" ScrollBars="Vertical">
                    <asp:DataList ID="DataList11" runat="server" Width="561px" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <table style="font-size: small; background-color: #f5faf1" cellspacing="0" width="758">
                                <tbody>
                                    <tr>
                                        <td style="width: 50px; height: 21px">To:</td>
                                        <td style="height: 21px" colspan="8">
                                            <asp:Label ID="token_noLabel" runat="server" Text='<%# Eval("msg_to") %>'></asp:Label></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="font-size: small; background-color: #f5faf1" width="758">
                                <tbody>
                                    <tr>
                                        <td style="width: 46px; height: 18px" colspan="1">Date:</td>
                                        <td style="width: 71px; height: 18px" colspan="1">
                                            <asp:Label ID="msg_dateLabel" runat="server" Text='<%# Eval("msg_date") %>' Width="156px"></asp:Label></td>
                                        <td style="width: 257px; height: 18px" colspan="5"></td>
                                        <td style="height: 18px" colspan="1">
                                            <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/reply_pic.jpg"></asp:Image></td>
                                        <td style="width: 100px; height: 18px" colspan="1">
                                            <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="False" Enabled="False" Font-Bold="True" Font-Size="X-Small" ForeColor="OliveDrab" NavigateUrl="#abc">Quick Reply</asp:HyperLink></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("msg_text") %>' Font-Size="Small" Width="752px" Height="173px" ReadOnly="True" TextMode="MultiLine" Font-Names="Book Antiqua"></asp:TextBox>
                        </ItemTemplate>
                    </asp:DataList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [msg_id], [msg_to], [msg_date], [msg_text] FROM [msg_box] WHERE ([msg_id] = @msg_id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="msg_id" Type="Decimal"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <a name="abc"></a>
                    <div style="z-index: 101; left: 275px; width: 198px; position: absolute; top: 267px; height: 22px" class="txt_boxx">
                        <table>
                            <tbody>
                                <tr>
                                    <td style="font-size: small; color: gainsboro; height: 23px" colspan="2">
                                        <asp:Label ID="Label2" runat="server" Text="Select a message to view the details" Width="207px"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
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
    </div>
    <script language="javascript" type="text/javascript">
function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
function IMG1_onclick() {

}
    </script>
</asp:Content>