<%@ Page Language="C#" MasterPageFile="~/top_mp.master" AutoEventWireup="true" CodeFile="cust_inbox.aspx.cs" Inherits="cust_inbox" Title="Veixy-Ticket Box" EnableEventValidation="false" %>

<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="font-size: small; z-index: 101; left: 0px; width: 765px; position: absolute; top: -43px; height: 38px" id="pprint">
                <br />
                &nbsp;<table>
                    <tbody>
                        <tr>
                            <td style="width: 3262px"></td>
                            <td style="width: 94px"></td>
                            <td style="width: 100px"></td>
                        </tr>
                        <tr>
                            <td style="width: 3262px">
                                <asp:ImageButton ID="ImageButton3" OnClick="ImageButton3_Click" runat="server" ImageUrl="~/Images/delete_img.jpg"></asp:ImageButton></td>
                            <td style="width: 94px; color: black"></td>
                            <td style="width: 100px; color: black"></td>
                        </tr>
                    </tbody>
                </table>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="Horizontal" PageSize="9" DataKeyNames="token_no" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BorderStyle="None" Width="775px" Font-Size="Small" Height="1px">
                    <FooterStyle BorderStyle="None"></FooterStyle>

                    <RowStyle BorderStyle="None" ForeColor="Black"></RowStyle>
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ImageField DataImageUrlField="img_url"></asp:ImageField>
                        <asp:BoundField DataField="token_no" HeaderText="Token #" SortExpression="token_no">
                            <ControlStyle Width="20px"></ControlStyle>

                            <HeaderStyle HorizontalAlign="Left" Width="60px"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="open_close" HeaderText="Status" SortExpression="o/c">
                            <ItemStyle HorizontalAlign="Center" ForeColor="SteelBlue" Width="40px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="msg_subject" HeaderText="Subject" SortExpression="msg_subject">
                            <ItemStyle Width="600px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="held_by" HeaderText="Held By" SortExpression="held_by">
                            <ControlStyle Width="100px"></ControlStyle>

                            <ItemStyle HorizontalAlign="Center" Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Expr1" HeaderText="Date" SortExpression="Expr1"></asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <table style="width: 751px">
                            <tr>
                                <td style="width: 151px"></td>
                                <td></td>
                                <td style="width: 444px"></td>
                            </tr>
                            <tr>
                                <td style="width: 151px; height: 19px"></td>
                                <td style="width: 151px; height: 19px"></td>
                                <td style="width: 444px; height: 19px">Your inbox is currently empty</td>
                                <td style="width: 100px; height: 19px"></td>
                            </tr>
                            <tr>
                                <td style="width: 151px"></td>
                                <td></td>
                                <td style="width: 444px"></td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <SelectedRowStyle BackColor="WhiteSmoke"></SelectedRowStyle>

                    <HeaderStyle BorderStyle="None" CssClass="gv_header" ForeColor="White" Height="20px"></HeaderStyle>
                </asp:GridView>
                <div style="z-index: 102; left: -157px; width: 88px; position: absolute; top: 321px; height: 117px">
                    <img src="Images_Net/support-bg.gif" />
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [token_no], [msg_subject] , CONVERT (VARCHAR, start_date, 101) AS Expr1, [sent_from], [img_url], [img_url2],[open_close],[held_by] FROM [cust_inbox] WHERE([sent_from]=@sent_from) ORDER BY [start_date] DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="sent_from" SessionField="user_session" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <table style="width: 765px; color: steelblue">
                    <tbody>
                        <tr>
                            <td style="width: 677px; height: 26px"></td>
                            <td style="width: 52px; height: 26px"></td>
                            <td style="width: 43px; height: 26px"></td>
                        </tr>
                        <tr>
                            <td style="width: 677px">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td style="width: 94px"><span style="color: #9acd32"><strong style="vertical-align: top; color: darkgray">Session Detail</strong></span> &nbsp;</td>
                                            <td style="width: 91px">
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/arrow_down.jpg" Width="23px" Height="15px"></asp:Image>
                                                <asp:Label ID="max_label" runat="server" Text="max_label"></asp:Label></td>
                                            <td style="width: 205px" valign="top"></td>
                                            <td style="width: 42px"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td style="width: 52px"><strong style="color: steelblue">O</strong>=Open</td>
                            <td style="width: 43px"><strong>C</strong>=Closed</td>
                        </tr>
                    </tbody>
                </table>
                <img style="width: 771px; height: 3px" src="Images/footerBg.gif" />&nbsp;<br />
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT * FROM [act_onbox] WHERE (([token_no] = @token_no) AND ([msg_counter] = @msg_counter))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="token_no" PropertyName="SelectedValue"
                            Type="Decimal" />
                        <asp:ControlParameter ControlID="max_label" Name="msg_counter" PropertyName="Text"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div style="z-index: 103; left: -166px; width: 100px; position: absolute; top: 466px; height: 232px">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Images_Net/abc.jpg"></asp:Image>
                </div>
                <table>
                    <tbody>
                        <tr>
                            <td style="width: 100px">
                                <asp:ImageButton ID="ImageButton4" OnClick="ImageButton4_Click" runat="server" ImageUrl="~/Images/unhold_img.jpg"></asp:ImageButton></td>
                            <td style="width: 130px">
                                <asp:ImageButton ID="ImageButton5" OnClick="ImageButton5_Click" runat="server" ImageUrl="~/Images/closet_img.jpg"></asp:ImageButton></td>
                            <td style="width: 35px"></td>
                            <td style="width: 35px; font-family: 'Book Antiqua'"></td>
                        </tr>
                    </tbody>
                </table>
                <table style="width: 772px; height: 21px">
                    <tbody>
                        <tr>
                            <td style="width: 20270px"></td>
                            <td style="width: 245px"></td>
                            <td style="width: 100px"></td>
                        </tr>
                        <tr>
                            <td style="width: 20270px"></td>
                            <td style="width: 245px">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/i_sign.jpg"></asp:Image>
                            </td>
                            <td style="width: 100px">
                                <asp:Label Style="color: black; font-family: Calibri" ID="Label5" runat="server" Width="508px" Text="Please select a message to view the detail"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource4" GridLines="Horizontal" BorderStyle="Double" BackColor="#FAFAFA" BorderColor="ForestGreen" DataKeyField="msg_counter">
                    <ItemTemplate>
                        <table style="width: 771px; color: maroon">
                            <tbody>
                                <tr>
                                    <td style="width: 63px; height: 20px">Token #:</td>
                                    <td style="height: 20px">
                                        <asp:Label ID="token_noLabel" runat="server" Text='<%# Eval("token_no") %>' ForeColor="SteelBlue"></asp:Label></td>
                                    <td style="width: 30px; height: 20px">Date:</td>
                                    <td style="width: 100px; height: 20px">
                                        <asp:Label ID="msg_dateLabel" runat="server" Width="188px" Text='<%# Eval("msg_date") %>'></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                        <table style="width: 770px; color: maroon; background-color: whitesmoke">
                            <tbody>
                                <tr>
                                    <td style="width: 134px; height: 20px" align="left">Sent By: </td>
                                    <td style="width: 100px; height: 20px">
                                        <asp:Label ID="msg_fromLabel" runat="server" Width="591px" Text='<%# Eval("msg_from") %>' ForeColor="SteelBlue"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 134px" align="left"></td>
                                    <td style="width: 100px"></td>
                                </tr>
                                <tr>
                                    <td style="height: 112px" colspan="2">
                                        <asp:TextBox ID="TextBox3" runat="server" Height="172px" Width="754px" BorderStyle="None" Text='<%# Eval("act_msg") %>' BackColor="WhiteSmoke" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>
                        <table style="width: 770px; background-color: transparent">
                            <tbody>
                                <tr>
                                    <td style="width: 3166px; height: 24px"></td>
                                    <td style="width: 4010px; height: 24px">To view the session history, click on the arrow to expand</td>
                                    <td style="width: 48px; height: 24px">
                                        <asp:ImageButton ID="ImageButton2" OnClick="ImageButton2_Click" runat="server" ImageUrl="~/Images/down.jpg" ToolTip="Expand"></asp:ImageButton></td>
                                    <td style="width: 100px; height: 24px">&nbsp;<asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" ImageUrl="~/Images/up.jpg" ToolTip="Contract"></asp:ImageButton></td>
                                </tr>
                            </tbody>
                        </table>
                    </ItemTemplate>
                </asp:DataList><table>
                    <tbody>
                        <tr>
                            <td style="width: 100px">
                                <asp:Label ID="Label1" runat="server" Text="Session History" Font-Bold="True" Font-Names="Book Antiqua" ForeColor="DarkGray"></asp:Label></td>
                            <td style="width: 100px">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/arrow_down.jpg" Width="23px" Height="15px"></asp:Image></td>
                        </tr>
                    </tbody>
                </table>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" GridLines="Horizontal" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" BorderStyle="Double" BackColor="#FAFAFA" BorderColor="ForestGreen">
                    <FooterStyle BackColor="WhiteSmoke"></FooterStyle>

                    <HeaderStyle BorderStyle="None"></HeaderStyle>
                    <FooterTemplate>
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 100px; color: yellowgreen"><strong style="color: darkgray">Quick Reply</strong></td>
                                    <td style="width: 100px"></td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:TextBox ID="TextBox2" runat="server" Height="193px" Width="586px" TextMode="MultiLine"></asp:TextBox></td>
                                    <td style="width: 100px"></td>
                                    <td style="width: 100px">
                                        <asp:ImageButton ID="ImageButton7" OnClick="ImageButton7_Click" runat="server" ImageUrl="~/Images/send_img.jpg" Height="28px" Width="98px"></asp:ImageButton>
                                        <br />
                                        <asp:ImageButton ID="ImageButton6" OnClick="ImageButton5_Click" runat="server" ImageUrl="~/Images/closet_img.jpg" Width="97px"></asp:ImageButton>
                                        <br />
                                        <asp:ImageButton ID="ImageButton8" OnClick="ImageButton4_Click" runat="server" ImageUrl="~/Images/unhold_img.jpg" Height="27px" Width="97px"></asp:ImageButton></td>
                                    <td style="width: 100px"></td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        &nbsp;
                    </FooterTemplate>
                    <ItemTemplate>
                        <table style="width: 771px; color: maroon; background-color: #fafafa">
                            <tbody>
                                <tr>
                                    <td style="width: 63px; height: 20px">Token #:</td>
                                    <td style="height: 20px">
                                        <asp:Label ID="token_no2Label" runat="server" Width="119px" Text='<%# Eval("token_no") %>' ForeColor="SteelBlue"></asp:Label></td>
                                    <td style="width: 30px; height: 20px">Date:</td>
                                    <td style="width: 100px; height: 20px; background-color: #fafafa">
                                        <asp:Label ID="msg_dateLabel" runat="server" Width="165px" Text='<%# Eval("msg_date") %>'></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                        <table style="width: 770px; color: maroon; background-color: #fafafa">
                            <tbody>
                                <tr>
                                    <td style="width: 65px; height: 20px" align="left">Sent By: </td>
                                    <td style="width: 100px; height: 20px">
                                        <asp:Label ID="msg_fromLabel" runat="server" Width="689px" Text='<%# Eval("msg_from") %>' ForeColor="SteelBlue"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px" align="left"></td>
                                    <td style="width: 100px"></td>
                                </tr>
                                <tr>
                                    <td style="height: 112px" colspan="2">
                                        <asp:TextBox ID="TextBox1" runat="server" Height="167px" Width="754px" BorderStyle="None" Text='<%# Eval("act_msg") %>' BackColor="#FAFAFA" ForeColor="Black" TextMode="MultiLine" ReadOnly="True"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>
                        <img style="width: 771px" height="3" src="Images/footerBg.gif" />
                    </ItemTemplate>
                </asp:DataList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT * FROM [act_onbox] WHERE ([token_no] = @token_no2)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="token_no2" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <div style="z-index: 101; left: 330px; width: 100px; position: absolute; top: 321px; height: 100px">
                    &nbsp;<asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="1" AssociatedUpdatePanelID="UpdatePanel1">
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
                <table style="width: 591px">
                    <tbody>
                        <tr>
                            <td style="width: 351px"></td>
                            <td style="width: 31px">
                                <asp:HyperLink ID="HyperLink1" runat="server" Width="51px" Font-Size="X-Small" ForeColor="SteelBlue" NavigateUrl="~/about_us.aspx" Font-Underline="False">About Us</asp:HyperLink></td>
                            <td>
                                <img src="Images/lint_v.jpg" /></td>
                            <td style="width: 62px">
                                <asp:HyperLink ID="HyperLink2" runat="server" Width="53px" Font-Size="X-Small" ForeColor="SteelBlue" NavigateUrl="~/contact_us.aspx" Font-Underline="False">Contact Us</asp:HyperLink></td>
                            <td>
                                <img src="Images/lint_v.jpg" /></td>
                            <td style="width: 100px">
                                <asp:Label ID="Label2" runat="server" Font-Size="X-Small" Text="© Veixy.com" ForeColor="Gray" Font-Underline="False"></asp:Label></td>
                            <td style="width: 98px"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    &nbsp;
</asp:Content>