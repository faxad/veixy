<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_ilocked.aspx.cs" Inherits="staff_inbox" Title="Veixy-Locked Tickets" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>
    &nbsp;
    <div style="z-index: 101; left: 1px; width: 112px; position: absolute; top: 56px; height: 379px">
        <asp:Panel ID="Panel1" runat="server" Height="154px" ScrollBars="Vertical" Width="632px">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" Width="613px" Height="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" ShowHeader="False" AutoGenerateColumns="False" DataKeyNames="token_no" DataSourceID="SqlDataSource1" Font-Size="Small">
                        <RowStyle Height="5px"></RowStyle>
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img_url2") %>' __designer:wfdid="w199"></asp:Image>
                                </ItemTemplate>

                                <ItemStyle Width="10px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="token_no" HeaderText="Token #" ReadOnly="True" SortExpression="token_no">
                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Left" Width="50px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="sent_from" HeaderText="From" SortExpression="sent_from">
                                <HeaderStyle Width="90px"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="msg_subject" HeaderText="Subject" SortExpression="msg_subject">
                                <ItemStyle Width="260px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="association" HeaderText="Association" SortExpression="association">
                                <ItemStyle Width="90px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Expr1" HeaderText="Date" SortExpression="Expr1">
                                <ItemStyle HorizontalAlign="Right" Width="50px"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <table style="width: 583px">
                                <tbody>
                                    <tr>
                                        <td style="width: 151px"></td>
                                        <td></td>
                                        <td style="width: 444px"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 151px; height: 19px"></td>
                                        <td style="width: 151px; height: 19px"></td>
                                        <td style="width: 444px; height: 19px">Inbox is currently empty</td>
                                        <td style="width: 100px; height: 19px"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 151px"></td>
                                        <td></td>
                                        <td style="width: 444px"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </EmptyDataTemplate>

                        <SelectedRowStyle BackColor="WhiteSmoke"></SelectedRowStyle>

                        <HeaderStyle VerticalAlign="Middle" BorderStyle="None" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT token_no, sent_from, msg_subject, CONVERT (VARCHAR, start_date, 101) AS Expr1, img_url2, association FROM cust_inbox WHERE (open_close = @open_close) AND (lock_by = @lock_by)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="O" Name="open_close" Type="String" />
                    <asp:SessionParameter DefaultValue="" Name="lock_by" SessionField="user_session"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            </asp:ScriptManagerProxy>
            <div style="z-index: 102; left: 248px; width: 100px; position: absolute; top: 48px; height: 100px">
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
        <div style="z-index: 101; left: 5px; width: 1px; position: absolute; top: 182px; height: 169px">
            &nbsp;<br />
            &nbsp;
        </div>
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <table style="font-weight: bold; font-size: small; width: 583px; color: black; background-color: white" cellspacing="0" border="0">
                    <tbody>
                        <tr>
                            <td style="width: 16px; height: 19px" colspan="1">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/un_lok2.jpg"></asp:Image></td>
                            <td style="width: 70px; height: 19px" colspan="1">
                                <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Width="73px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" CssClass="bar_format" Font-Bold="True">Unlock Topic</asp:LinkButton></td>
                            <td style="width: 17px; height: 19px" colspan="1">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/hot_topic.jpg"></asp:Image></td>
                            <td style="width: 78px; height: 19px" colspan="1">
                                <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" runat="server" Width="78px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" CssClass="bar_format" Font-Bold="True">Inc. Priority</asp:LinkButton></td>
                            <td style="width: 13px; height: 19px" colspan="1">
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/msg_checked.jpg"></asp:Image></td>
                            <td style="width: 79px; height: 19px" colspan="1">
                                <asp:LinkButton ID="LinkButton3" OnClick="LinkButton3_Click" runat="server" Width="79px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" CssClass="bar_format" Font-Bold="True">Dec. Priority</asp:LinkButton></td>
                            <td style="width: 3px; height: 19px" colspan="1">
                                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/clos_top.jpg"></asp:Image></td>
                            <td style="width: 73px; height: 19px" colspan="1">
                                <asp:LinkButton ID="LinkButton4" OnClick="LinkButton4_Click" runat="server" Width="75px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" CssClass="bar_format" Font-Bold="True">Close Topic</asp:LinkButton></td>
                            <td style="width: 8px; height: 19px" colspan="1">
                                <asp:DropDownList ID="DropDownList2" runat="server" __designer:dtid="2251799813685331" Width="131px" DataSourceID="SqlDataSource11" DataValueField="user_id" DataTextField="user_id" __designer:wfdid="w51" OnDataBound="DropDownList2_DataBound"></asp:DropDownList></td>
                            <td style="width: 101px; height: 19px" colspan="8">&nbsp;
                                <asp:LinkButton ID="LinkButton5" OnClick="LinkButton5_Click" runat="server" Width="75px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" CssClass="bar_format" Font-Bold="True">Recommend</asp:LinkButton></td>
                        </tr>
                    </tbody>
                </table>
                <div style="z-index: 102; left: 247px; width: 100px; position: absolute; top: 261px; height: 100px" __designer:dtid="6755399441055812">
                    &nbsp;<asp:UpdateProgress ID="UpdateProgress2" runat="server" __designer:dtid="6755399441055813" DisplayAfter="1" AssociatedUpdatePanelID="UpdatePanel2" __designer:wfdid="w22">
                        <ProgressTemplate __designer:dtid="6755399441055814">
                            <table __designer:dtid="6755399441055815">
                                <tbody __designer:dtid="6755399441055816">
                                    <tr __designer:dtid="6755399441055817">
                                        <td __designer:dtid="6755399441055818" style="width: 66px; height: 21px"></td>
                                        <td __designer:dtid="6755399441055819" style="width: 56px; height: 21px">
                                            <img __designer:dtid="6755399441055820" src="Images/ajax-loader2.gif" /></td>
                                        <td __designer:dtid="6755399441055821" style="width: 100px; height: 21px">
                                            <img __designer:dtid="6755399441055822" src="Images/still-processing.gif" id="IMG1" onclick="return IMG1_onclick()" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
                <div style="z-index: 102; left: 247px; width: 100px; position: absolute; top: 247px; height: 100px">
                    &nbsp;<asp:UpdateProgress ID="UpdateProgress3" runat="server" DisplayAfter="1" AssociatedUpdatePanelID="UpdatePanel4" __designer:wfdid="w25">
                        <ProgressTemplate>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width: 66px; height: 21px"></td>
                                        <td style="width: 56px; height: 21px">
                                            <img src="Images/ajax-loader2.gif" /></td>
                                        <td style="width: 100px; height: 21px">
                                            <img id="Img2" onclick="return IMG1_onclick()" src="Images/still-processing.gif" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
                <asp:SqlDataSource ID="SqlDataSource11" runat="server" SelectCommand="SELECT [user_id], [user_type] FROM [activ_users] WHERE ([user_type] = @user_type)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" __designer:wfdid="w52">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="staff" Name="user_type" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel2" runat="server" Width="632px" ScrollBars="Vertical" Height="227px">
                    <asp:DataList ID="DataList1" runat="server" Width="561px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <table style="font-size: small; background-color: whitesmoke" cellspacing="0" width="613">
                                <tbody>
                                    <tr>
                                        <td style="width: 49px; height: 21px">Token #:</td>
                                        <td style="width: 366px; height: 21px" colspan="2">
                                            <asp:Label ID="token_noLabel" runat="server" __designer:wfdid="w15" Text='<%# Eval("token_no") %>'></asp:Label></td>
                                        <td style="width: 36px; height: 21px" align="left" colspan="1">Date:</td>
                                        <td style="width: 93px; height: 21px" align="left" colspan="4">
                                            <asp:Label ID="msg_dateLabel" runat="server" Width="156px" __designer:wfdid="w16" Text='<%# Eval("msg_date") %>'></asp:Label></td>
                                        <td style="height: 21px" colspan="1"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="font-size: small; background-color: whitesmoke" width="613">
                                <tbody>
                                    <tr>
                                        <td style="width: 57px" colspan="1">From:</td>
                                        <td style="width: 147px" colspan="1">
                                            <asp:Label ID="msg_fromLabel" runat="server" __designer:wfdid="w17" Text='<%# Eval("msg_from") %>'></asp:Label></td>
                                        <td style="width: 239px" colspan="1"></td>
                                        <td colspan="1"></td>
                                        <td colspan="1"></td>
                                        <td style="width: 16px" colspan="1">
                                            <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/hold_pic.jpg" __designer:wfdid="w18"></asp:Image></td>
                                        <td style="width: 74px" colspan="1">
                                            <asp:LinkButton ID="LinkButton6" OnClick="LinkButton6_Click" runat="server" Width="64px" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" __designer:wfdid="w19" BorderWidth="1px" BorderStyle="None" BorderColor="RoyalBlue">Hold Topic</asp:LinkButton></td>
                                        <td style="width: 20px" colspan="1">
                                            <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/reply_pic.jpg" __designer:wfdid="w20"></asp:Image></td>
                                        <td style="width: 100px" colspan="1">
                                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" __designer:wfdid="w21" NavigateUrl="#abc">Reply</asp:HyperLink></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:TextBox ID="TextBox1" runat="server" Width="607px" Height="175px" Font-Size="Small" __designer:wfdid="w22" Text='<%# Eval("act_msg") %>' TextMode="MultiLine" Font-Names="Book Antiqua" ReadOnly="True"></asp:TextBox>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT [act_msg], [token_no], [msg_date], [msg_from] FROM [act_onbox] WHERE ([token_no] = @token_no)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="token_no" PropertyName="SelectedValue"
                                Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <table cellspacing="0" width="613">
                        <tbody>
                            <tr>
                                <td style="width: 4060px; height: 18px; background-color: whitesmoke" colspan="1">
                                    <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="SteelBlue" Font-Bold="True" Text="Compose Reply"></asp:Label></td>
                                <td style="width: 18px; height: 18px; background-color: whitesmoke" colspan="1">
                                    <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                <td style="width: 8px; height: 18px; background-color: whitesmoke" colspan="1">
                                    <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="61px" Font-Size="Small" ForeColor="Maroon" Font-Underline="False" Font-Bold="True" BorderWidth="1px" BackColor="Transparent" BorderStyle="None">Send Reply</asp:LinkButton></td>
                                <td style="width: 100px; height: 18px; background-color: whitesmoke" colspan="1"></td>
                            </tr>
                        </tbody>
                    </table>
                    <a name="abc"></a>
                    <asp:TextBox ID="TextBox3" runat="server" Width="607px" Height="200px" TextMode="MultiLine"></asp:TextBox>
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
                &nbsp;&nbsp;&nbsp;&nbsp;<br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div style="z-index: 102; left: 3px; width: 582px; position: absolute; top: 36px; height: 23px">
        <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; width: 632px; color: white; background-color: steelblue">
            <tr>
                <td style="width: 19px; height: 19px"></td>
                <td style="width: 79px; height: 19px">Ticket #
                    <div style="z-index: 101; left: 2px; width: 100px; position: absolute; top: -34px; height: 100px">
                        <img src="Images/locked_tickets.jpg" />
                    </div>
                </td>
                <td align="left" style="width: 115px; height: 19px">From</td>
                <td align="center" style="width: 527px; height: 19px">Subject</td>
                <td align="left" style="width: 125px; height: 19px">Association</td>
                <td align="center" style="width: 77px; height: 19px">Date</td>
                <td align="center" style="width: 30px; height: 19px"></td>
            </tr>
        </table>
    </div>
</asp:Content>