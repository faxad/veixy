<%@ Page Language="C#" MasterPageFile="~/top_mp2.master" AutoEventWireup="true" CodeFile="cust_chat.aspx.cs" Inherits="cust_chat" Title="Veixy-Chat" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

function TABLE1_onclick() {

}

function DIV1_onclick() {

}
    </script>

    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <div style="z-index: 101; left: 0px; width: 100px; position: absolute; top: 0px; height: 100px">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table style="width: 481px" id="TABLE1" onclick="return TABLE1_onclick()">
                    <tbody>
                        <tr>
                            <td style="width: 4600px"></td>
                            <td style="width: 100px">
                                <asp:TextBox ID="TextBox1" runat="server" Width="462px" __designer:wfdid="w1252" TextMode="MultiLine" OnTextChanged="TextBox1_TextChanged"></asp:TextBox></td>
                        </tr>
                    </tbody>
                </table>
                <div style="z-index: 101; left: -135px; width: 93px; position: absolute; top: 245px; height: 118px" id="DIV1" onclick="return DIV1_onclick()">
                    <img src="Images_Net/24x7_support.png" />
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ImageButton1" EventName="Click"></asp:AsyncPostBackTrigger>
            </Triggers>
        </asp:UpdatePanel>
    </div>
    &nbsp;
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>
            <table style="width: 581px">
                <tbody>
                    <tr>
                        <td style="width: 881px" align="right"></td>
                        <td style="width: 17px"></td>
                        <td style="width: 100px">
                            <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" ImageUrl="~/Images/send_img.jpg" __designer:wfdid="w1247"></asp:ImageButton></td>
                    </tr>
                </tbody>
            </table>
            <table style="width: 583px">
                <tbody>
                    <tr>
                        <td style="width: 7567px"></td>
                        <td style="font-weight: bold; width: 100px; color: white" class="gv_header">Customer's Chat</td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 7567px"></td>
                        <td style="border-right: #3366ff 1px solid; border-top: #3366ff 1px solid; border-left: #3366ff 1px solid; width: 100px; border-bottom: #3366ff 1px solid">
                            <asp:Panel ID="Panel2" runat="server" __designer:wfdid="w1248" Width="567px" OnLoad="Panel2_Load" ScrollBars="Vertical" Height="272px">
                                <asp:GridView ID="GridView1" runat="server" __designer:wfdid="w1224" Width="546px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowHeader="False" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="msg_from" SortExpression="msg_from">
                                            <ItemStyle VerticalAlign="Top" ForeColor="#0000C0"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Panel ID="Panel1" runat="server" __designer:wfdid="w161" Width="432px">
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("msg_txt") %>' __designer:wfdid="w162"></asp:Label>
                                                </asp:Panel>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <table style="width: 484px" border="0">
                                            <tbody>
                                                <tr>
                                                    <td align="center" colspan="3">&nbsp;<asp:Label ID="Label2" runat="server" Text="Please" __designer:wfdid="w163"></asp:Label>&nbsp;<asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" __designer:wfdid="w164">sign-in</asp:LinkButton>
                                                        <asp:Label ID="Label3" runat="server" Text="here to start a new chat session." __designer:wfdid="w1200"></asp:Label></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                    </EmptyDataTemplate>

                                    <SelectedRowStyle BackColor="#FFE0C0"></SelectedRowStyle>
                                </asp:GridView>
                            </asp:Panel>
                            <table style="width: 563px">
                                <tbody>
                                    <tr>
                                        <td style="width: 114px">
                                            <asp:ImageButton ID="ImageButton2" OnClick="ImageButton2_Click" runat="server" ImageUrl="~/Images/exit_chat.gif" __designer:wfdid="w167"></asp:ImageButton></td>
                                        <td style="width: 189px">
                                            <asp:Label ID="Label1" runat="server" ForeColor="Maroon" Font-Size="Small" __designer:wfdid="w174" Width="357px" BackColor="LemonChiffon" Visible="False"></asp:Label></td>
                                        <td style="width: 100px"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" __designer:wfdid="w1225" SelectCommand="SELECT [msg_from], [msg_txt] FROM [chat_msgs] WHERE ([chat_id] = @chat_id) ORDER BY msg_id DESC" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="chat_id" Name="chat_id" Type="Decimal"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Timer ID="Timer1" runat="server" __designer:dtid="29836347531329538" __designer:wfdid="w1251" OnTick="Timer1_Tick1" Interval="3000">
                            </asp:Timer>
                        </td>
                        <td style="width: 100px"></td>
                    </tr>
                </tbody>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="DataBound"></asp:AsyncPostBackTrigger>
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
        </Triggers>
    </asp:UpdatePanel>
    <div style="z-index: 103; left: 603px; width: 154px; position: absolute; top: 180px; height: 200px">
        <img src="Images_Net/solutions.jpg" />
        <asp:Label ID="Label4" runat="server" Font-Size="8pt" ForeColor="Gray" Text="Want to discuss face to face? Let us help you set an appointment."></asp:Label>
    </div>
    <div style="z-index: 102; left: 571px; width: 213px; position: absolute; top: 19px; height: 145px">
        <table style="font-size: 9pt">
            <tr>
                <td align="center" style="width: 100px; height: 47px" valign="top">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/co.jpg" /></td>
                <td style="width: 1481px; height: 47px" valign="bottom">You may leave the chat anytime. Our customer representatives will handle the closing
                    of the chat session. If you want to exit manually you may click here anytime to
                    leave.</td>
                <td style="width: 100px; height: 47px" valign="bottom">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/cc.jpg" /></td>
            </tr>
        </table>
    </div>
    &nbsp;&nbsp;<br />
    &nbsp;<triggers>
<asp:AsyncPostBackTrigger ControlID="Timer1" EventName="DataBinding"></asp:AsyncPostBackTrigger>
</triggers>
</asp:Content>