<%@ Page Language="C#" MasterPageFile="~/user_mp.master" AutoEventWireup="true" CodeFile="user_calls.aspx.cs" Inherits="staff_inbox" Title="Veixy-Calls" EnableEventValidation="false" %>

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
        <asp:Panel ID="Panel1" runat="server" Height="154px" ScrollBars="Vertical" Width="597px">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" Width="580px" Height="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" ShowHeader="False" AutoGenerateColumns="False" DataKeyNames="call_ref_no" DataSourceID="SqlDataSource1" Font-Size="Small">
                        <RowStyle Height="5px"></RowStyle>
                        <Columns>
                            <asp:BoundField DataField="call_date" HeaderText="call_date" SortExpression="call_date">
                                <ItemStyle Width="127px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="lock_by" HeaderText="lock_by" SortExpression="lock_by">
                                <ItemStyle Width="70px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="issue_subject" HeaderText="issue_subject" SortExpression="issue_subject">
                                <ItemStyle Width="220px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="urgent_call" HeaderText="urgent_call" SortExpression="urgent_call">
                                <ItemStyle Width="40px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="call_status" HeaderText="call_status" SortExpression="call_status">
                                <ItemStyle HorizontalAlign="Right" Width="60px"></ItemStyle>
                            </asp:BoundField>
                        </Columns>

                        <SelectedRowStyle BackColor="#F5FAF1"></SelectedRowStyle>

                        <HeaderStyle BackColor="SteelBlue" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    </asp:GridView>
                    &nbsp;
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT [call_date], [lock_by], [issue_subject], [comments],[urgent_call], [call_status], [call_ref_no] FROM [my_calls] WHERE [user_name] = @user_name">
                <SelectParameters>
                    <asp:QueryStringParameter Name="user_name" QueryStringField="user_query" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;
            <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            </asp:ScriptManagerProxy>
            <div style="z-index: 102; left: 225px; width: 100px; position: absolute; top: 48px; height: 100px">
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
                <asp:Panel ID="Panel2" runat="server" Width="597px" ScrollBars="Vertical" Height="253px">
                    <asp:DataList Style="font-size: small" ID="DataList1" runat="server" DataSourceID="SqlDataSource2" DataKeyField="call_ref_no">
                        <ItemTemplate>
                            Call Ref #:
                            <asp:Label ID="call_ref_noLabel" runat="server" Text='<%# Eval("call_ref_no") %>' __designer:wfdid="w873"></asp:Label><br />
                            Contact #:
                            <asp:Label ID="contact_noLabel" runat="server" Text='<%# Eval("contact_no") %>' __designer:wfdid="w874"></asp:Label><br />
                            <asp:Label ID="Label3" runat="server" Text="Description:" __designer:wfdid="w875" ForeColor="#003399"></asp:Label><br />
                            <asp:TextBox ID="TextBox1" runat="server" Width="266px" Height="72px" Text='<%# Eval("issue_msg") %>' __designer:wfdid="w876" TextMode="MultiLine" ReadOnly="True"></asp:TextBox><br />
                            <div style="z-index: 102; left: 289px; width: 253px; position: absolute; top: 152px; height: 159px">
                                <table style="width: 267px">
                                    <tbody>
                                        <tr>
                                            <td style="width: 81px" colspan="1"></td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 81px" colspan="1"></td>
                                            <td colspan="2">Enter the recommended staff's ID </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 81px; height: 21px"></td>
                                            <td style="width: 100px; height: 21px">
                                                <asp:TextBox ID="TextBox2" runat="server" Width="80px" Height="10px" Font-Size="X-Small" __designer:wfdid="w877" ForeColor="RoyalBlue"></asp:TextBox></td>
                                            <td style="width: 144px; height: 21px">
                                                <asp:LinkButton ID="LinkButton5" OnClick="LinkButton5_Click" runat="server" Width="75px" Font-Size="Small" __designer:wfdid="w878" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" CssClass="bar_format">Recommend</asp:LinkButton></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table style="width: 272px">
                                    <tbody>
                                        <tr>
                                            <td style="width: 870px">
                                                <asp:Label ID="Label1" runat="server" Text="Add Comments:" __designer:wfdid="w879" ForeColor="#003399"></asp:Label>
                                            </td>
                                            <td style="width: 28px"></td>
                                            <td style="width: 111px">
                                                <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" runat="server" Width="111px" Font-Size="Small" __designer:wfdid="w880" ForeColor="Brown" Font-Underline="False">(Click here to add)</asp:LinkButton></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <asp:TextBox ID="TextBox3" runat="server" Width="266px" Height="115px" __designer:wfdid="w881" TextMode="MultiLine" ReadOnly="True"></asp:TextBox><br />
                                <table style="width: 268px">
                                    <tbody>
                                        <tr>
                                            <td style="height: 24px"></td>
                                            <td style="width: 165px; height: 24px">
                                                <asp:Label ID="Label4" runat="server" Text="Status:" __designer:wfdid="w882" ForeColor="#003399"></asp:Label></td>
                                            <td style="width: 650px; height: 24px">
                                                <asp:DropDownList ID="DropDownList1" runat="server" Width="103px" __designer:wfdid="w883">
                                                    <asp:ListItem Selected="True">-----</asp:ListItem>
                                                    <asp:ListItem>Busy</asp:ListItem>
                                                    <asp:ListItem>No Reply</asp:ListItem>
                                                    <asp:ListItem>Answered</asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td style="width: 27px; height: 24px" colspan="2">
                                                <asp:Image ID="Image2" runat="server" __designer:wfdid="w884" ImageUrl="~/Images/lok_grey.jpg"></asp:Image></td>
                                            <td style="width: 100px; height: 24px">
                                                <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Width="74px" Font-Size="Small" __designer:wfdid="w885" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" CssClass="bar_format">Lock Item</asp:LinkButton></td>
                                        </tr>
                                        <tr>
                                            <td style="height: 24px"></td>
                                            <td style="width: 165px; height: 24px"></td>
                                            <td style="width: 650px; height: 24px"></td>
                                            <td style="width: 27px; height: 24px" colspan="2">
                                                <asp:Image ID="Image8" runat="server" __designer:wfdid="w886" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                            <td style="width: 100px; height: 24px">
                                                <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="48px" Font-Size="Small" __designer:wfdid="w887" ForeColor="OliveDrab" BorderWidth="1px" BackColor="Transparent" BorderStyle="None" Font-Underline="False" Font-Bold="True">Update</asp:LinkButton></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div style="z-index: 102; left: 45px; width: 100px; position: absolute; top: 215px; height: 68px" __designer:dtid="281474976710741">
                                    &nbsp;<asp:UpdateProgress ID="UpdateProgress2" runat="server" __designer:dtid="281474976710742" DisplayAfter="1" AssociatedUpdatePanelID="UpdatePanel2" __designer:wfdid="w888">
                                        <ProgressTemplate __designer:dtid="281474976710743">
                                            <table __designer:dtid="281474976710744">
                                                <tbody __designer:dtid="281474976710745">
                                                    <tr __designer:dtid="281474976710746">
                                                        <td __designer:dtid="281474976710747" style="width: 66px; height: 21px"></td>
                                                        <td __designer:dtid="281474976710748" style="width: 56px; height: 21px">
                                                            <img __designer:dtid="281474976710749" src="Images/ajax-loader2.gif" /></td>
                                                        <td __designer:dtid="281474976710750" style="width: 100px; height: 21px">
                                                            <img __designer:dtid="281474976710751" src="Images/still-processing.gif" id="IMG1" onclick="return IMG1_onclick()" /></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                            </div>
                            <asp:Label ID="Label5" runat="server" Text="Comments:" __designer:wfdid="w889" ForeColor="#003399"></asp:Label><br />
                            <asp:TextBox ID="TextBox4" runat="server" Width="266px" Height="105px" Text='<%# Eval("comments") %>' __designer:wfdid="w890" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                        </ItemTemplate>
                    </asp:DataList>
                    <div style="z-index: 101; left: 185px; width: 198px; position: absolute; top: 222px; height: 22px" class="txt_boxx">
                        <table>
                            <tbody>
                                <tr>
                                    <td style="font-size: small; color: gainsboro; height: 23px" colspan="2">
                                        <asp:Label ID="Label2" runat="server" Text="Select a call to view the details" __designer:wfdid="w98"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT [call_ref_no], [issue_msg],[comments], [contact_no] FROM [my_calls] WHERE ([call_ref_no] = @call_ref_no)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="call_ref_no" Type="Decimal"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;<br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div style="z-index: 102; left: 3px; width: 582px; position: absolute; top: 36px; height: 23px">
        <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; color: white; background-color: steelblue"
            width="597">
            <tr>
                <td style="width: 15px; height: 19px"></td>
                <td style="width: 215px; height: 19px">Call
                    Date</td>
                <td align="center" style="width: 107px; height: 19px">Locked By</td>
                <td align="center" style="width: 453px; height: 19px">Subject</td>
                <td align="center" style="width: 125px; height: 19px">Call Type</td>
                <td align="center" style="width: 77px; height: 19px">Status</td>
                <td align="center" style="width: 30px; height: 19px"></td>
            </tr>
        </table>
    </div>
</asp:Content>