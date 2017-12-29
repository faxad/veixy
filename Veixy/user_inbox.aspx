<%@ Page Language="C#" MasterPageFile="~/user_mp.master" AutoEventWireup="true" CodeFile="user_inbox.aspx.cs" Inherits="staff_inbox" Title="Veixy-Ticket Box" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function setMouseOverColor(element) {
            element.style.cursor = 'hand';
        }
    </script>
    &nbsp;
    <div style="z-index: 101; left: 1px; width: 112px; position: absolute; top: 56px; height: 379px">
        <asp:Panel ID="Panel1" runat="server" Height="146px" ScrollBars="Vertical" Width="597px">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" Width="580px" Height="2px" __designer:wfdid="w1065" BorderStyle="None" Font-Size="Small" DataSourceID="SqlDataSource1" DataKeyNames="token_no" AutoGenerateColumns="False" ShowHeader="False" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <RowStyle Height="5px"></RowStyle>
                        <Columns>
                            <asp:ImageField DataImageUrlField="img_url2"></asp:ImageField>
                            <asp:BoundField DataField="open_close" HeaderText="open_close" SortExpression="open_close">
                                <ItemStyle HorizontalAlign="Center" Width="33px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="token_no" HeaderText="Token #" ReadOnly="True" SortExpression="token_no">
                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Left" BackColor="#F5FAF1" Width="50px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="held_by" HeaderText="held_by" SortExpression="held_by"></asp:BoundField>
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

                        <SelectedRowStyle BackColor="#F5FAF1"></SelectedRowStyle>

                        <HeaderStyle BackColor="SteelBlue" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT img_url2,[token_no], [held_by], [msg_subject], CONVERT (VARCHAR, start_date, 101) AS Expr1, [open_close], [association] FROM [cust_inbox] WHERE (([sent_from] = @sent_from))">
                <SelectParameters>
                    <asp:QueryStringParameter Name="sent_from" QueryStringField="user_query" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            </asp:ScriptManagerProxy>
            <div style="z-index: 102; left: 224px; width: 100px; position: absolute; top: 48px; height: 100px">
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
        <div style="z-index: 102; left: 5px; width: 1px; position: absolute; top: 182px; height: 169px">
            &nbsp;<br />
            &nbsp;
        </div>
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <table style="font-weight: bold; font-size: small; color: black; background-color: white" cellspacing="0" width="590" border="0">
                    <tbody>
                        <tr>
                            <td style="width: 16px; height: 20px" colspan="1">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/lok_grey.jpg"></asp:Image></td>
                            <td style="width: 70px; height: 20px" colspan="1">
                                <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Width="80px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" CssClass="bar_format" Font-Bold="True">Lock Topic</asp:LinkButton></td>
                            <td style="width: 17px; height: 20px" colspan="1">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/hot_topic.jpg"></asp:Image></td>
                            <td style="width: 78px; height: 20px" colspan="1">
                                <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" runat="server" Width="78px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" CssClass="bar_format" Font-Bold="True">Inc. Priority</asp:LinkButton></td>
                            <td style="height: 20px" colspan="1">
                                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/clos_top.jpg"></asp:Image></td>
                            <td style="width: 13px; height: 20px" colspan="1">
                                <asp:LinkButton ID="LinkButton4" OnClick="LinkButton4_Click" runat="server" Width="75px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" CssClass="bar_format" Font-Bold="True">Close Topic</asp:LinkButton></td>
                            <td style="width: 10px; height: 20px" colspan="1">
                                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/hold_pic.jpg"></asp:Image></td>
                            <td style="width: 73px; height: 20px" colspan="1">
                                <asp:LinkButton ID="LinkButton6" OnClick="LinkButton6_Click" runat="server" Width="64px" BorderStyle="None" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" BorderColor="RoyalBlue" BorderWidth="1px">Hold Topic</asp:LinkButton></td>
                            <td style="width: 8px; height: 20px" colspan="1">
                                <asp:TextBox ID="TextBox2" runat="server" Width="80px" Height="10px" Font-Size="X-Small" ForeColor="RoyalBlue"></asp:TextBox></td>
                            <td style="height: 20px" colspan="8">&nbsp;
                                <asp:LinkButton ID="LinkButton5" OnClick="LinkButton5_Click" runat="server" Width="75px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" CssClass="bar_format" Font-Bold="True">Recommend</asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td style="width: 16px; height: 20px" colspan="1">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/un_lok2.jpg"></asp:Image></td>
                            <td style="width: 70px; height: 20px" colspan="1">
                                <asp:LinkButton ID="LinkButton8" OnClick="LinkButton8_Click" runat="server" Width="81px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" CssClass="bar_format" Font-Bold="True" Enabled="False">Unlock Topic</asp:LinkButton></td>
                            <td style="width: 17px; height: 20px" colspan="1">
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/msg_checked.jpg"></asp:Image></td>
                            <td style="width: 78px; height: 20px" colspan="1">
                                <asp:LinkButton ID="LinkButton3" OnClick="LinkButton3_Click" runat="server" Width="83px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" CssClass="bar_format" Font-Bold="True">Dec. Priority</asp:LinkButton></td>
                            <td style="height: 20px" colspan="1">
                                <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/open_top.jpg"></asp:Image></td>
                            <td style="width: 79px; height: 20px" colspan="1">
                                <asp:LinkButton ID="LinkButton9" OnClick="LinkButton9_Click" runat="server" Width="75px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" CssClass="bar_format" Font-Bold="True">Open Topic</asp:LinkButton></td>
                            <td style="width: 10px; height: 20px" colspan="1">
                                <asp:Image ID="Image10" runat="server" ImageUrl="~/Images/unhold_pic.jpg"></asp:Image></td>
                            <td style="width: 13px; height: 20px" colspan="1">
                                <asp:LinkButton ID="LinkButton10" OnClick="LinkButton10_Click" runat="server" Width="72px" BorderStyle="None" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" BorderColor="RoyalBlue" BorderWidth="1px">Unhold Topic</asp:LinkButton></td>
                            <td style="width: 73px; height: 20px" colspan="1"></td>
                            <td style="width: 8px; height: 20px" colspan="1"></td>
                            <td style="height: 20px" colspan="8"></td>
                        </tr>
                    </tbody>
                </table>
                <div style="z-index: 102; left: 247px; width: 100px; position: absolute; top: 281px; height: 100px">
                    &nbsp;<asp:UpdateProgress ID="UpdateProgress3" runat="server" DisplayAfter="1" AssociatedUpdatePanelID="UpdatePanel2" __designer:wfdid="w29">
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
                <div style="z-index: 102; left: 247px; width: 100px; position: absolute; top: 294px; height: 100px">
                    &nbsp;<asp:UpdateProgress ID="UpdateProgress2" runat="server" DisplayAfter="1" AssociatedUpdatePanelID="UpdatePanel4" __designer:wfdid="w30">
                        <ProgressTemplate>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width: 66px; height: 21px"></td>
                                        <td style="width: 56px; height: 21px">
                                            <img src="Images/ajax-loader2.gif" /></td>
                                        <td style="width: 100px; height: 21px">
                                            <img id="Img1" onclick="return IMG1_onclick()" src="Images/still-processing.gif" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel2" runat="server" Width="597px" ScrollBars="Vertical" Height="220px">
                    <asp:DataList ID="DataList1" runat="server" Width="561px" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <table style="font-size: small; color: #003399; background-color: #f5faf1" class="user_down" cellspacing="0" width="578">
                                <tbody>
                                    <tr>
                                        <td style="width: 49px; height: 21px">Token #:</td>
                                        <td style="width: 366px; height: 21px" colspan="2">
                                            <asp:Label ID="token_noLabel" runat="server" __designer:wfdid="w15" Text='<%# Eval("token_no") %>'></asp:Label></td>
                                        <td style="width: 36px; height: 21px" align="left" colspan="1">Date:</td>
                                        <td style="width: 93px; height: 21px" align="left" colspan="4">
                                            <asp:Label ID="msg_dateLabel" runat="server" Width="156px" __designer:wfdid="w16" Text='<%# Eval("msg_date") %>'></asp:Label></td>
                                        <td style="width: 3px; height: 21px" colspan="1"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="font-size: small; color: #003399; background-color: #f5faf1" width="578">
                                <tbody>
                                    <tr>
                                        <td style="width: 57px" colspan="1">From:</td>
                                        <td style="width: 147px" colspan="1">
                                            <asp:Label ID="msg_fromLabel" runat="server" __designer:wfdid="w17" Text='<%# Eval("msg_from") %>'></asp:Label></td>
                                        <td style="width: 239px" colspan="1"></td>
                                        <td colspan="1"></td>
                                        <td colspan="1"></td>
                                        <td style="width: 16px" colspan="1"></td>
                                        <td style="width: 74px" colspan="1"></td>
                                        <td style="width: 20px" colspan="1">
                                            <asp:Image ID="Image7" runat="server" __designer:wfdid="w18" ImageUrl="~/Images/reply_pic.jpg"></asp:Image></td>
                                        <td style="width: 100px" colspan="1">
                                            <asp:HyperLink ID="HyperLink1" runat="server" __designer:wfdid="w19" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" NavigateUrl="#abc">Reply</asp:HyperLink></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:TextBox ID="TextBox1" runat="server" Width="572px" Height="175px" __designer:wfdid="w20" Font-Size="Small" Text='<%# Eval("act_msg") %>' TextMode="MultiLine" Font-Names="Book Antiqua" ReadOnly="True"></asp:TextBox>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT [act_msg], [token_no], [msg_date], [msg_from] FROM [act_onbox] WHERE ([token_no] = @token_no)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="token_no" PropertyName="SelectedValue"
                                Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <table style="background-color: #f5faf1" cellspacing="0" width="578">
                        <tbody>
                            <tr>
                                <td colspan="1">
                                    <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="#003399" Font-Bold="True" Text="Compose Reply"></asp:Label></td>
                                <td style="width: 18px; height: 18px; background-color: whitesmoke" colspan="1">
                                    <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                <td style="width: 8px; height: 18px; background-color: whitesmoke" colspan="1">
                                    <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="61px" Font-Size="Small" BorderStyle="None" ForeColor="Maroon" Font-Underline="False" Font-Bold="True" BorderWidth="1px" BackColor="Transparent">Send Reply</asp:LinkButton></td>
                                <td colspan="1"></td>
                            </tr>
                        </tbody>
                    </table>
                    <a name="abc"></a>
                    <asp:TextBox ID="TextBox3" runat="server" Width="572px" Height="190px" TextMode="MultiLine"></asp:TextBox>
                    <div style="z-index: 101; left: 185px; width: 198px; position: absolute; top: 291px; height: 22px" class="txt_boxx">
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
    <div style="z-index: 102; left: 3px; width: 582px; position: absolute; top: 36px; height: 23px">
        <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; color: white; background-color: steelblue"
            width="597">
            <tr>
                <td style="width: 51px; height: 19px"></td>
                <td style="width: 32px; height: 19px">Status</td>
                <td style="width: 65px; height: 19px">&nbsp; Ticket</td>
                <td align="left" style="width: 115px; height: 19px">Held &nbsp;By</td>
                <td align="center" style="width: 448px; height: 19px">Subject</td>
                <td align="center" style="width: 219px; height: 19px">Association</td>
                <td align="center" style="width: 77px; height: 19px">Date</td>
                <td align="center" style="width: 30px; height: 19px"></td>
            </tr>
        </table>
    </div>
</asp:Content>