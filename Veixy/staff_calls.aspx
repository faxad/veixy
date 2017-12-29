<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_calls.aspx.cs" Inherits="staff_inbox" Title="Veixy-Locked Calls" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
function DIV1_onclick() {

}
    </script>

    &nbsp;
    <div style="z-index: 101; left: 1px; width: 112px; position: absolute; top: 56px; height: 379px">
        <asp:Panel ID="Panel1" runat="server" Height="154px" ScrollBars="Vertical" Width="632px">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" Width="614px" Height="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" ShowHeader="False" AutoGenerateColumns="False" DataKeyNames="call_ref_no" DataSourceID="SqlDataSource1" Font-Size="Small">
                        <RowStyle Height="5px"></RowStyle>
                        <Columns>
                            <asp:BoundField DataField="call_date" HeaderText="call_date" SortExpression="call_date">
                                <ItemStyle Width="130px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name">
                                <ItemStyle Width="85px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="issue_subject" HeaderText="issue_subject" SortExpression="issue_subject">
                                <ItemStyle Width="255px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="urgent_call" HeaderText="urgent_call" SortExpression="urgent_call">
                                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="call_status" HeaderText="call_status" SortExpression="call_status">
                                <ItemStyle HorizontalAlign="Right" ForeColor="SteelBlue" Width="80px"></ItemStyle>
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
                                        <td style="width: 444px; height: 19px">There calls list is currently empty</td>
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

                        <HeaderStyle BackColor="SteelBlue" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    </asp:GridView>
                    &nbsp;
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT [call_date], [user_name], [issue_subject], [urgent_call], [call_status], [call_ref_no] FROM [my_calls] WHERE (([lock_by] = @lock_by) AND ([call_status] NOT LIKE '%' + @call_status + '%')) ORDER BY call_ref_no DESC">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="lock_by" SessionField="user_session"
                        Type="String" />
                    <asp:Parameter DefaultValue="Answered" Name="call_status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;
            <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            </asp:ScriptManagerProxy>
            <div style="z-index: 102; left: 230px; width: 100px; position: absolute; top: 48px; height: 100px">
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
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel2" runat="server" Width="632px" ScrollBars="Vertical" Height="253px">
                    <asp:DataList Style="font-size: small" ID="DataList1" runat="server" DataSourceID="SqlDataSource2" DataKeyField="call_ref_no" OnItemDataBound="DataList1_ItemDataBound">
                        <ItemTemplate>
                            Call Ref #:
                            <asp:Label ID="call_ref_noLabel" runat="server" Text='<%# Eval("call_ref_no") %>' __designer:wfdid="w95"></asp:Label><br />
                            Contact #:
                            <asp:Label ID="contact_noLabel" runat="server" Text='<%# Eval("contact_no") %>' __designer:wfdid="w96"></asp:Label><br />
                            <asp:Label ID="Label3" runat="server" Text="Description:" ForeColor="#003399" __designer:wfdid="w97"></asp:Label><br />
                            <asp:TextBox ID="TextBox1" runat="server" Width="275px" Height="193px" Text='<%# Eval("issue_msg") %>' TextMode="MultiLine" ReadOnly="True" __designer:wfdid="w98"></asp:TextBox>
                            <div style="z-index: 102; left: 310px; width: 253px; position: absolute; top: 152px; height: 159px" id="DIV1" onclick="return DIV1_onclick()">
                                <table style="width: 298px">
                                    <tbody>
                                        <tr>
                                            <td style="width: 81px" colspan="1"></td>
                                            <td colspan="2">Enter the recommended staff's ID </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 81px; height: 21px"></td>
                                            <td style="width: 44px; height: 21px">
                                                <asp:DropDownList ID="DropDownList2" runat="server" Width="131px" DataSourceID="SqlDataSource1" DataTextField="user_id" DataValueField="user_id" __designer:wfdid="w99"></asp:DropDownList>
                                            </td>
                                            <td style="width: 144px; height: 21px">
                                                <asp:LinkButton ID="LinkButton5" OnClick="LinkButton5_Click" runat="server" Width="75px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" CssClass="bar_format" __designer:wfdid="w100">Recommend</asp:LinkButton></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table style="width: 302px">
                                    <tbody>
                                        <tr>
                                            <td style="width: 144px">
                                                <asp:Label ID="Label1" runat="server" Text="Comments:" ForeColor="#003399" __designer:wfdid="w101"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT [user_id], [user_type] FROM [activ_users] WHERE ([user_type] = @user_type)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" __designer:wfdid="w102">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="staff" Name="user_type" Type="String"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td style="width: 111px">
                                                <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" runat="server" Width="111px" Font-Size="Small" ForeColor="Brown" Font-Underline="False" __designer:wfdid="w103">(Click here to add)</asp:LinkButton></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <asp:TextBox ID="TextBox3" runat="server" Width="291px" Height="120px" Text='<%# Eval("comments") %>' TextMode="MultiLine" ReadOnly="True" __designer:wfdid="w104"></asp:TextBox><br />
                                <table style="width: 285px">
                                    <tbody>
                                        <tr>
                                            <td style="height: 24px"></td>
                                            <td style="width: 165px; height: 24px">
                                                <asp:Label ID="Label4" runat="server" Text="Status:" ForeColor="#003399" __designer:wfdid="w105"></asp:Label></td>
                                            <td style="width: 650px; height: 24px">
                                                <asp:DropDownList ID="DropDownList1" runat="server" Width="103px" __designer:wfdid="w106">
                                                    <asp:ListItem Selected="True">-----</asp:ListItem>
                                                    <asp:ListItem>Busy</asp:ListItem>
                                                    <asp:ListItem>No Reply</asp:ListItem>
                                                    <asp:ListItem>Answered</asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td style="width: 27px; height: 24px" colspan="2">
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/un_lok.jpg" __designer:wfdid="w107"></asp:Image></td>
                                            <td style="width: 100px; height: 24px">
                                                <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Width="74px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" CssClass="bar_format" __designer:wfdid="w108">Unlock Item</asp:LinkButton></td>
                                        </tr>
                                        <tr>
                                            <td style="height: 24px"></td>
                                            <td style="width: 165px; height: 24px"></td>
                                            <td style="width: 650px; height: 24px"></td>
                                            <td style="width: 27px; height: 24px" colspan="2">
                                                <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg" __designer:wfdid="w109"></asp:Image></td>
                                            <td style="width: 100px; height: 24px">
                                                <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="48px" Font-Size="Small" ForeColor="OliveDrab" BorderWidth="1px" BackColor="Transparent" Font-Underline="False" BorderStyle="None" Font-Bold="True" __designer:wfdid="w110">Update</asp:LinkButton></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT [call_ref_no], [issue_msg], [contact_no],[comments] FROM [my_calls] WHERE ([call_ref_no] = @call_ref_no)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="call_ref_no" Type="Decimal"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div style="z-index: 101; left: 185px; width: 198px; position: absolute; top: 222px; height: 22px" class="txt_boxx">
                        <table>
                            <tbody>
                                <tr>
                                    <td style="font-size: small; color: gainsboro; height: 23px" colspan="2">
                                        <asp:Label ID="Label2" runat="server" Text="Select a call to view the details"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </asp:Panel>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;<br />
            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="z-index: 102; left: 356px; width: 100px; position: absolute; top: 358px; height: 100px">
            &nbsp;<asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2"
                DisplayAfter="1">
                <ProgressTemplate>
                    <table>
                        <tbody>
                            <tr>
                                <td style="width: 66px; height: 21px"></td>
                                <td style="width: 56px; height: 21px">
                                    <img src="Images/ajax-loader2.gif" /></td>
                                <td style="width: 100px; height: 21px">
                                    <img id="IMG1" onclick="return IMG1_onclick()" src="Images/still-processing.gif" /></td>
                            </tr>
                            <tr>
                                <td style="width: 66px; height: 21px"></td>
                                <td style="width: 56px; height: 21px"></td>
                                <td style="width: 100px; height: 21px"></td>
                            </tr>
                        </tbody>
                    </table>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </div>
    <div style="z-index: 102; left: 3px; width: 582px; position: absolute; top: 36px; height: 23px">
        <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; width: 632px; color: white; background-color: steelblue">
            <tr>
                <td style="width: 15px; height: 18px"></td>
                <td style="width: 194px; height: 18px" align="center">Call Date
                    <div style="z-index: 101; left: -2px; width: 100px; position: absolute; top: -28px; height: 100px">
                        <img src="Images/locked_calls.jpg" />
                    </div>
                </td>
                <td align="right" style="width: 115px; height: 18px">From</td>
                <td align="center" style="width: 652px; height: 18px">Subject</td>
                <td align="center" style="width: 241px; height: 18px">Call Type</td>
                <td align="center" style="width: 102px; height: 18px">Status</td>
                <td align="center" style="width: 30px; height: 18px"></td>
            </tr>
        </table>
    </div>
</asp:Content>