<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_msgbox.aspx.cs" Inherits="staff_msgbox" Title="Veixy-Message Box" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>

    <div style="z-index: 101; left: 2px; width: 112px; position: absolute; top: 29px; height: 379px">
        <div style="z-index: 102; left: 7px; width: 100px; position: absolute; top: -31px; height: 100px">
            <img src="Images/ibox.jpg" />
        </div>
        <table style="width: 26px">
            <tr>
                <td style="width: 79px">
                    <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/reply_msg.jpg" /></td>
                <td style="width: 79px">
                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="bar_format" Font-Bold="True"
                        Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton4_Click"
                        Width="91px">Compose Reply</asp:LinkButton></td>
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
                        Width="93px">Delete Message</asp:LinkButton></td>
            </tr>
        </table>
        <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; width: 634px; color: white; background-color: steelblue">
            <tr>
                <td style="width: 29px; height: 19px"></td>
                <td align="center" colspan="2" style="height: 19px; width: 73px;">From</td>
                <td align="center" colspan="1" style="width: 67px; height: 19px">Sender
                </td>
                <td align="center" style="width: 356px; height: 19px">Subject</td>
                <td align="right" colspan="2" style="width: 91px; height: 19px">Date</td>
                <td align="center" style="width: 30px; height: 19px"></td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server" Height="154px" ScrollBars="Vertical" Width="632px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" Width="614px" Font-Size="Small" Height="1px" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowHeader="False" AutoGenerateColumns="False" DataKeyNames="msg_id" DataSourceID="SqlDataSource1" __designer:wfdid="w14">
                        <RowStyle Height="5px"></RowStyle>
                        <Columns>
                            <asp:ImageField DataImageUrlField="msg_img">
                                <ItemStyle Width="15px"></ItemStyle>
                            </asp:ImageField>
                            <asp:BoundField DataField="msg_from" HeaderText="msg_from" SortExpression="msg_from">
                                <ItemStyle Width="90px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="from_type" HeaderText="from_type" SortExpression="from_type">
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
                SelectCommand="SELECT [msg_from], [msg_id], [subject], [msg_img], [from_type], [msg_to],CONVERT (VARCHAR, msg_date, 101) AS msg_date FROM [msg_box] WHERE (([msg_to] = @msg_to)) AND ([box_type])='inbox' ORDER BY msg_id DESC, msg_date DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="msg_to" SessionField="user_session" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            </asp:ScriptManagerProxy>
            <div style="z-index: 102; left: 289px; width: 100px; position: absolute; top: 63px; height: 100px">
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
                <asp:Panel ID="Panel2" runat="server" Width="632px" ScrollBars="Vertical" Height="234px">
                    <asp:DataList ID="DataList11" runat="server" Width="561px" OnSelectedIndexChanged="DataList11_SelectedIndexChanged" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <table style="font-size: small; background-color: #f5faf1" cellspacing="0" width="613">
                                <tbody>
                                    <tr>
                                        <td style="width: 50px; height: 21px">From:</td>
                                        <td style="height: 21px" colspan="8">
                                            <asp:Label ID="token_noLabel" runat="server" __designer:wfdid="w16" Text='<%# Eval("msg_from") %>'></asp:Label></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="font-size: small; background-color: #f5faf1" width="613">
                                <tbody>
                                    <tr>
                                        <td style="width: 46px; height: 18px" colspan="1">Date:</td>
                                        <td style="width: 71px; height: 18px" colspan="1">
                                            <asp:Label ID="msg_dateLabel" runat="server" Width="156px" __designer:wfdid="w17" Text='<%# Eval("msg_date") %>'></asp:Label></td>
                                        <td style="width: 257px; height: 18px" colspan="5"></td>
                                        <td style="height: 18px" colspan="1">
                                            <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/reply_pic.jpg" __designer:wfdid="w18"></asp:Image></td>
                                        <td style="width: 100px; height: 18px" colspan="1">
                                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" __designer:wfdid="w19" NavigateUrl="#abc">Quick Reply</asp:HyperLink></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:TextBox ID="TextBox1" runat="server" Width="607px" Font-Size="Small" Height="180px" __designer:wfdid="w20" Text='<%# Eval("msg_text") %>' TextMode="MultiLine" Font-Names="Book Antiqua" ReadOnly="True"></asp:TextBox>
                        </ItemTemplate>
                    </asp:DataList><asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT [msg_id], [msg_from], [msg_date], [msg_text] FROM [msg_box] WHERE ([msg_id] = @msg_id)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="msg_id" Type="Decimal"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <table style="background-color: #f5faf1" cellspacing="0" width="613">
                        <tbody>
                            <tr>
                                <td style="width: 560px; height: 18px" colspan="1">
                                    <asp:Label ID="Label1" runat="server" ForeColor="SteelBlue" Font-Size="Small" Font-Bold="True" Text="Compose Reply"></asp:Label></td>
                                <td style="height: 18px" align="center" colspan="1">
                                    <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                <td style="height: 18px" colspan="2">
                                    <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="61px" ForeColor="Maroon" Font-Underline="False" Font-Size="Small" Font-Bold="True" BorderStyle="None" BackColor="Transparent" BorderWidth="1px">Send Reply</asp:LinkButton></td>
                            </tr>
                        </tbody>
                    </table>
                    <a name="abc"></a>
                    <asp:TextBox ID="TextBox3" runat="server" Width="607px" Height="205px" TextMode="MultiLine"></asp:TextBox>
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
        <div style="z-index: 101; left: 294px; width: 100px; position: absolute; top: 261px; height: 100px">
            &nbsp;<asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2"
                DisplayAfter="1">
                <ProgressTemplate>
                    <table>
                        <tr>
                            <td style="width: 66px; height: 21px"></td>
                            <td style="width: 56px; height: 21px">
                                <img src="Images/ajax-loader2.gif" /></td>
                            <td style="width: 100px; height: 21px">
                                <img id="IMG1" onclick="return IMG1_onclick()" src="Images/still-processing.gif" /></td>
                        </tr>
                    </table>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </div>
</asp:Content>