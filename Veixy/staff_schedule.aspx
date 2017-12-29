<%@ Page Language="C#" MasterPageFile="~/staff_mp2.master" AutoEventWireup="true" CodeFile="staff_schedule.aspx.cs" Inherits="staff_schedule" Title="Veixy-Schedule Manager" EnableEventValidation="false" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>
    <table style="width: 820px; height: 207px">
        <tr>
            <td style="width: 100px; height: 241px" valign="top">
                <div style="z-index: 101; left: 4px; width: 100px; position: absolute; top: 11px; height: 100px">
                    <img src="Images/schedule.jpg" />
                </div>
                <br />
                <table>
                    <tr>
                        <td style="width: 23px; height: 23px;">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/i_sign.jpg" /></td>
                        <td style="width: 23px; height: 23px;">
                            <asp:Label ID="Label15" runat="server" Font-Size="Small" Style="color: black; font-family: Calibri"
                                Text="Please specify a time span" Width="169px"></asp:Label></td>
                    </tr>
                </table>
                <rad:RadCalendar ID="RadCalendar3" runat="server" BorderColor="SteelBlue" BorderStyle="Solid"
                    BorderWidth="1px" DayNameFormat="Short" EnableViewState="False" Font-Names="Arial,Verdana,Tahoma"
                    ForeColor="Black" SelectedDate="" Skin="Outlook" Style="border-left-color: #ececec; border-bottom-color: #ececec; border-top-color: #ececec; border-right-color: #ececec"
                    UseColumnHeadersAsSelectors="False" Width="264px">
                    <TitleStyle ForeColor="White" BackColor="SteelBlue" Font-Bold="True" />
                </rad:RadCalendar>
                <table style="width: 256px">
                    <tr>
                        <td style="width: 24px">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/insert.jpg" /></td>
                        <td>
                            <asp:LinkButton ID="LinkButton22" runat="server" CommandName="Update" CssClass="bar_format"
                                Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="Firebrick"
                                OnClick="LinkButton22_Click" Width="96px">Display Schedule</asp:LinkButton></td>
                        <td align="right" style="width: 100px">
                            <asp:LinkButton ID="LinkButton32" runat="server" CssClass="bar_format" Font-Bold="True"
                                Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton32_Click"
                                Width="76px">(Clear Selection)</asp:LinkButton></td>
                    </tr>
                    <tr>
                        <td style="width: 24px">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/add_img.jpg" /></td>
                        <td>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Update" CssClass="bar_format"
                                Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="Firebrick"
                                OnClick="LinkButton3_Click" Width="96px">Create Schedule</asp:LinkButton></td>
                        <td align="right" style="width: 100px"></td>
                    </tr>
                </table>
                <div style="z-index: 101; left: -1px; width: 100px; position: absolute; top: 232px; height: 100px">
                    <asp:Panel ID="Panel2" runat="server">
                        <table style="width: 544px">
                            <tr>
                                <td style="width: 1px; height: 21px"></td>
                                <td style="width: 61px; height: 21px">
                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="DimGray"
                                        Text="Create Schedule" Width="102px"></asp:Label></td>
                                <td style="width: 54px; height: 21px">
                                    <img src="Images/arrow_down.jpg" style="width: 19px; height: 12px" /></td>
                            </tr>
                            <tr>
                                <td style="width: 1px"></td>
                                <td style="width: 61px">
                                    <asp:Label ID="Label3" runat="server" Font-Size="Small" ForeColor="#003399" Text="Date & Time"
                                        Width="69px"></asp:Label>
                                </td>
                                <td style="width: 54px">&nbsp;<rad:RadDateTimePicker ID="RadDateTimePicker1" runat="server">
                                </rad:RadDateTimePicker>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 1px"></td>
                                <td style="width: 61px">
                                    <asp:Label ID="Label4" runat="server" Font-Size="Small" ForeColor="#003399" Text="Schedule For"
                                        Width="86px"></asp:Label>
                                </td>
                                <td style="width: 54px">
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource11"
                                        DataTextField="staff_id" DataValueField="staff_id">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                                        SelectCommand="SELECT [staff_id] FROM [staff_info]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 1px"></td>
                                <td style="width: 61px">
                                    <asp:Label ID="Label5" runat="server" Font-Size="Small" ForeColor="#003399" Text="Priority"
                                        Width="86px"></asp:Label>
                                </td>
                                <td align="right" style="width: 54px">
                                    <asp:DropDownList ID="DropDownList3" runat="server">
                                        <asp:ListItem>Low</asp:ListItem>
                                        <asp:ListItem Selected="True">Normal</asp:ListItem>
                                        <asp:ListItem>High</asp:ListItem>
                                    </asp:DropDownList>&nbsp;
                        <table style="width: 368px">
                            <tr>
                                <td style="width: 409px"></td>
                                <td style="width: 201px">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/send_but.jpg" /></td>
                                <td style="width: 16px">
                                    <asp:LinkButton ID="LinkButton14" runat="server" CommandName="Update" CssClass="bar_format"
                                        Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab"
                                        OnClick="LinkButton14_Click" Width="90px">Create Schedule</asp:LinkButton></td>
                            </tr>
                        </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 1px"></td>
                                <td align="center" style="width: 61px" valign="top">
                                    <asp:Label ID="Label6" runat="server" Font-Size="Small" ForeColor="#003399" Text="Task Detail"
                                        Width="60px"></asp:Label>
                                </td>
                                <td style="width: 54px">
                                    <asp:TextBox ID="TextBox3" runat="server" Height="95px" TextMode="MultiLine" Width="364px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </div>
            </td>
            <td style="width: 100px; height: 241px" valign="top">
                <br />
                <div style="z-index: 104; left: 340px; width: 380px; position: absolute; top: 26px; height: 29px">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="#003399" Text="Displaying schedule from"
                                Width="138px"></asp:Label><br />
                    <asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="DarkGoldenrod" Width="132px"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Font-Size="Small" ForeColor="#003399" Width="14px">to</asp:Label>
                    <asp:Label ID="Label8" runat="server" Font-Size="Small" ForeColor="DarkGoldenrod" Width="152px"></asp:Label>
                </div>
                <table style="width: 547px">
                    <tr>
                        <td style="width: 1046px">
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="bar_format" Font-Bold="True"
                                Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton2_Click"
                                Width="59px">(Reset Filter)</asp:LinkButton></td>
                        <td style="width: 100px">
                            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("status") %>' Width="116px">
                                <asp:ListItem Selected="True">Select a status</asp:ListItem>
                                <asp:ListItem>Delay</asp:ListItem>
                                <asp:ListItem>Done</asp:ListItem>
                                <asp:ListItem>Not Possible</asp:ListItem>
                                <asp:ListItem>Not Done</asp:ListItem>
                                <asp:ListItem>Not Checked</asp:ListItem>
                                <asp:ListItem>Processing</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 100px">
                            <asp:LinkButton ID="LinkButton12" runat="server" CommandName="Delete" CssClass="bar_format"
                                Font-Bold="True" Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab"
                                OnClick="LinkButton12_Click1" Width="60px">Apply Filter</asp:LinkButton></td>
                    </tr>
                </table>
                <asp:Panel ID="Panel1" runat="server" Height="212px" ScrollBars="Vertical" Width="546px">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" Width="527px" Font-Size="Small" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="schedule_id" AutoGenerateColumns="False" __designer:wfdid="w352" OnRowDataBound="GridView1_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="schedule_id" HeaderText="SID" ReadOnly="True" InsertVisible="False" SortExpression="schedule_id">
                                        <HeaderStyle Width="55px"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="staff_id" HeaderText="Staff ID" SortExpression="staff_id">
                                        <HeaderStyle Width="100px"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date">
                                        <HeaderStyle Width="140px"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="priority" HeaderText="Priority" SortExpression="priority">
                                        <HeaderStyle Width="50px"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status">
                                        <HeaderStyle Width="70px"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="scheduled_by" HeaderText="Scheduled By" SortExpression="scheduled_by">
                                        <HeaderStyle Width="100px"></HeaderStyle>
                                    </asp:BoundField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <table>
                                        <tr>
                                            <td style="width: 171px"></td>
                                            <td style="width: 23px">
                                                <asp:Label ID="Label9" runat="server" Width="149px" ForeColor="Silver" Text="No schedule available"></asp:Label></td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>

                                <SelectedRowStyle BackColor="#F5FAF1"></SelectedRowStyle>

                                <HeaderStyle BackColor="SteelBlue" ForeColor="White"></HeaderStyle>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT schedule_id, staff_id, date, priority, status, scheduled_by FROM staff_schedule WHERE (date >= @date) AND (date <= @date2) AND (staff_id = @staff_id) OR (date >= @date) AND (date <= @date2) AND (scheduled_by = @scheduled_by)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" __designer:wfdid="w353" UpdateCommand="UPDATE [staff_schedule] SET [staff_id] = @staff_id, [date] = @date, [priority] = @priority, [status] = @status, [scheduled_by] = @scheduled_by WHERE [schedule_id] = @schedule_id" InsertCommand="INSERT INTO [staff_schedule] ([staff_id], [date], [priority], [status], [scheduled_by]) VALUES (@staff_id, @date, @priority, @status, @scheduled_by)" DeleteCommand="DELETE FROM [staff_schedule] WHERE [schedule_id] = @schedule_id">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label2" PropertyName="Text" Name="date" Type="DateTime"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="Label8" PropertyName="Text" Name="date2" Type="DateTime"></asp:ControlParameter>
                                    <asp:SessionParameter SessionField="user_session" Name="staff_id"></asp:SessionParameter>
                                    <asp:SessionParameter SessionField="user_session" Name="scheduled_by"></asp:SessionParameter>
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="schedule_id" Type="Decimal"></asp:Parameter>
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="staff_id" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="date" Type="DateTime"></asp:Parameter>
                                    <asp:Parameter Name="priority" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="status" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="scheduled_by" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="schedule_id" Type="Decimal"></asp:Parameter>
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="staff_id" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="date" Type="DateTime"></asp:Parameter>
                                    <asp:Parameter Name="priority" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="status" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="scheduled_by" Type="String"></asp:Parameter>
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="SELECT [schedule_id], [staff_id], [date], [priority], [status], [scheduled_by] FROM [staff_schedule] WHERE (([date] >= @date) AND ([date] <= @date2)) AND [status]=@status" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" __designer:wfdid="w354" UpdateCommand="UPDATE [staff_schedule] SET [staff_id] = @staff_id, [date] = @date, [priority] = @priority, [status] = @status, [scheduled_by] = @scheduled_by WHERE [schedule_id] = @schedule_id" InsertCommand="INSERT INTO [staff_schedule] ([staff_id], [date], [priority], [status], [scheduled_by]) VALUES (@staff_id, @date, @priority, @status, @scheduled_by)" DeleteCommand="DELETE FROM [staff_schedule] WHERE [schedule_id] = @schedule_id">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label2" PropertyName="Text" Name="date" Type="DateTime"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="Label8" PropertyName="Text" Name="date2" Type="DateTime"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="status"></asp:ControlParameter>
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="schedule_id" Type="Decimal"></asp:Parameter>
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="staff_id" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="date" Type="DateTime"></asp:Parameter>
                                    <asp:Parameter Name="priority" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="status" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="scheduled_by" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="schedule_id" Type="Decimal"></asp:Parameter>
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="staff_id" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="date" Type="DateTime"></asp:Parameter>
                                    <asp:Parameter Name="priority" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="status" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="scheduled_by" Type="String"></asp:Parameter>
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:FormView ID="FormView1" runat="server" Width="404px" DataSourceID="SqlDataSource2" DataKeyNames="schedule_id" DefaultMode="Edit">
                <EditItemTemplate>
                    <table style="font-size: small; width: 622px; height: 195px" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <td style="width: 89px; color: #333399; height: 18px" valign="top">Schedule ID:</td>
                                <td style="width: 45px; height: 18px" valign="top">
                                    <asp:Label ID="user_idLabel1" runat="server" Text='<%# Eval("schedule_id") %>' __designer:wfdid="w388"></asp:Label></td>
                                <td style="width: 51px; color: #333399; height: 18px">Detail:<asp:LinkButton ID="LinkButton4" OnClick="LinkButton4_Click" runat="server" Width="62px" Font-Size="X-Small" ForeColor="Brown" Font-Underline="False" __designer:wfdid="w389">(Edit Detail)</asp:LinkButton></td>
                                <td style="width: 100px" rowspan="2">
                                    <asp:TextBox ID="email_addTextBox" runat="server" Width="245px" Text='<%# Bind("task_detail") %>' Height="75px" TextMode="MultiLine" __designer:wfdid="w390" ReadOnly="True"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 89px; color: #333399" valign="top">Scheduled By:</td>
                                <td style="width: 45px" valign="top">
                                    <asp:TextBox ID="user_passTextBox" runat="server" Text='<%# Bind("scheduled_by") %>' __designer:wfdid="w41" ReadOnly="True"></asp:TextBox></td>
                                <td style="width: 51px; color: #333399"></td>
                            </tr>
                            <tr>
                                <td style="width: 89px; color: #333399" valign="top">Date:</td>
                                <td style="width: 45px" valign="top">
                                    <table cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="width: 100px">
                                                    <asp:Label ID="Label11" runat="server" Text="Scheduled:" Font-Size="X-Small" ForeColor="#333399" __designer:wfdid="w392"></asp:Label></td>
                                                <td style="width: 100px">
                                                    <asp:Label ID="Label12" runat="server" Width="123px" Text='<%# Eval("date") %>' Font-Size="X-Small" ForeColor="Black" __designer:wfdid="w393"></asp:Label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <rad:RadDateTimePicker ID="RadDateTimePicker2" __designer:wfdid="w394" runat="server">
                                        <TimeView Skin=""></TimeView>

                                        <DateInput Skin=""></DateInput>
                                    </rad:RadDateTimePicker>
                                </td>
                                <td style="width: 51px; color: #333399">Comments:<asp:LinkButton ID="LinkButton33" OnClick="LinkButton33_Click" runat="server" Width="75px" Font-Size="X-Small" ForeColor="Brown" Font-Underline="False" __designer:wfdid="w395">(Edit Comments)</asp:LinkButton></td>
                                <td style="width: 100px" rowspan="2">
                                    <asp:TextBox ID="user_contact_noTextBox" runat="server" Width="244px" Text='<%# Bind("staff_comments") %>' Height="75px" TextMode="MultiLine" __designer:wfdid="w396" ReadOnly="True"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 89px; color: #333399; height: 24px" valign="top">Priority:<asp:LinkButton ID="LinkButton2" runat="server" Width="89px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" CssClass="bar_format" __designer:wfdid="w397"></asp:LinkButton></td>
                                <td style="width: 45px; height: 24px" valign="top">
                                    <asp:DropDownList ID="DropDownList33" runat="server" SelectedValue='<%# Bind("priority") %>' __designer:wfdid="w398">
                                        <asp:ListItem>Low</asp:ListItem>
                                        <asp:ListItem>Normal</asp:ListItem>
                                        <asp:ListItem>High</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td style="width: 51px; color: #333399; height: 24px"></td>
                            </tr>
                            <tr>
                                <td style="width: 89px; color: #333399" valign="top">Status:</td>
                                <td style="width: 45px" valign="top">
                                    <asp:DropDownList ID="DropDownList11" runat="server" SelectedValue='<%# Bind("status") %>' __designer:wfdid="w399">
                                        <asp:ListItem Selected="True">Delay</asp:ListItem>
                                        <asp:ListItem>Done</asp:ListItem>
                                        <asp:ListItem>Not Possible</asp:ListItem>
                                        <asp:ListItem>Not Done</asp:ListItem>
                                        <asp:ListItem>Not Checked</asp:ListItem>
                                        <asp:ListItem>Processing</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td style="width: 51px; color: #333399"></td>
                                <td style="width: 100px" valign="top" rowspan="2">
                                    <table style="width: 125px">
                                        <tbody>
                                            <tr>
                                                <td style="width: 3px">
                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/delete.jpg" __designer:wfdid="w400"></asp:Image></td>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" Width="39px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" CssClass="bar_format" CommandName="Delete" __designer:wfdid="w401">Delete</asp:LinkButton></td>
                                                <td style="width: 100px">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/send_but.jpg" __designer:wfdid="w402"></asp:Image></td>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton15" OnClick="LinkButton15_Click" runat="server" Width="39px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" CssClass="bar_format" __designer:wfdid="w403">Update</asp:LinkButton></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div style="z-index: 102; left: 477px; width: 100px; position: absolute; top: 433px; height: 100px" __designer:dtid="7599824371187739">
                                        &nbsp;<asp:UpdateProgress ID="UpdateProgress1" runat="server" __designer:dtid="7599824371187740" __designer:wfdid="w404" AssociatedUpdatePanelID="UpdatePanel2" DisplayAfter="1">
                                            <ProgressTemplate __designer:dtid="7599824371187741">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 66px; height: 21px"></td>
                                                            <td style="width: 56px; height: 21px">
                                                                <img src="Images/ajax-loader2.gif" /></td>
                                                            <td style="width: 100px; height: 21px">
                                                                <img src="Images/still-loading.gif" /></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                &nbsp;
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 89px; color: #333399; height: 20px" valign="top"></td>
                                <td valign="top" colspan="2" rowspan="2">
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" __designer:wfdid="w405" PopupPosition="TopLeft" TargetControlID="f_nameTextBox">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 89px; color: #333399; height: 19px" valign="top"></td>
                                <td style="width: 100px; height: 19px">&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="f_nameTextBox" runat="server" Height="1px" __designer:wfdid="w406" Visible="False"></asp:TextBox></td>
                            </tr>
                        </tbody>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    user_id:
            <asp:TextBox ID="user_idTextBox" runat="server" Text='<%# Bind("user_id") %>'>
            </asp:TextBox><br />
                    user_pass:
            <asp:TextBox ID="user_passTextBox" runat="server" Text='<%# Bind("user_pass") %>'>
            </asp:TextBox><br />
                    user_contact_no:
            <asp:TextBox ID="user_contact_noTextBox" runat="server" Text='<%# Bind("user_contact_no") %>'>
            </asp:TextBox><br />
                    f_name:
            <asp:TextBox ID="f_nameTextBox" runat="server" Text='<%# Bind("f_name") %>'>
            </asp:TextBox><br />
                    l_name:
            <asp:TextBox ID="l_nameTextBox" runat="server" Text='<%# Bind("l_name") %>'>
            </asp:TextBox><br />
                    user_contact_no2:
            <asp:TextBox ID="user_contact_no2TextBox" runat="server" Text='<%# Bind("user_contact_no2") %>'>
            </asp:TextBox><br />
                    dob:
            <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>'>
            </asp:TextBox><br />
                    country:
            <asp:TextBox ID="countryTextBox" runat="server" Text='<%# Bind("country") %>'>
            </asp:TextBox><br />
                    city:
            <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>'>
            </asp:TextBox><br />
                    email_add:
            <asp:TextBox ID="email_addTextBox" runat="server" Text='<%# Bind("email_add") %>'>
            </asp:TextBox><br />
                    postal_address:
            <asp:TextBox ID="postal_addressTextBox" runat="server" Text='<%# Bind("postal_address") %>'>
            </asp:TextBox><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert">
                    </asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel">
                    </asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    user_id:
                    <asp:Label ID="user_idLabel" runat="server" Text='<%# Eval("user_id") %>' __designer:wfdid="w374"></asp:Label><br />
                    user_pass:
                    <asp:Label ID="user_passLabel" runat="server" Text='<%# Bind("user_pass") %>' __designer:wfdid="w375"></asp:Label><br />
                    user_contact_no:
                    <asp:Label ID="user_contact_noLabel" runat="server" Text='<%# Bind("user_contact_no") %>' __designer:wfdid="w376"></asp:Label><br />
                    f_name:
                    <asp:Label ID="f_nameLabel" runat="server" Text='<%# Bind("f_name") %>' __designer:wfdid="w377"></asp:Label><br />
                    l_name:
                    <asp:Label ID="l_nameLabel" runat="server" Text='<%# Bind("l_name") %>' __designer:wfdid="w378"></asp:Label><br />
                    user_contact_no2:
                    <asp:Label ID="user_contact_no2Label" runat="server" Text='<%# Bind("user_contact_no2") %>' __designer:wfdid="w379"></asp:Label><br />
                    dob:
                    <asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob") %>' __designer:wfdid="w380"></asp:Label><br />
                    country:
                    <asp:Label ID="countryLabel" runat="server" Text='<%# Bind("country") %>' __designer:wfdid="w381"></asp:Label><br />
                    city:
                    <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("city") %>' __designer:wfdid="w382"></asp:Label><br />
                    email_add:
                    <asp:Label ID="email_addLabel" runat="server" Text='<%# Bind("email_add") %>' __designer:wfdid="w383"></asp:Label><br />
                    postal_address:
                    <asp:Label ID="postal_addressLabel" runat="server" Text='<%# Bind("postal_address") %>' __designer:wfdid="w384"></asp:Label><br />
                    <asp:LinkButton ID="EditButton" runat="server" Text="Edit" CommandName="Edit" __designer:wfdid="w385" CausesValidation="False"></asp:LinkButton>
                    <asp:LinkButton ID="DeleteButton" runat="server" Text="Delete" CommandName="Delete" __designer:wfdid="w386" CausesValidation="False"></asp:LinkButton>
                    <asp:LinkButton ID="NewButton" runat="server" Text="New" CommandName="New" __designer:wfdid="w387" CausesValidation="False"></asp:LinkButton>
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" __designer:dtid="8162774324609087" SelectCommand="SELECT [schedule_id], [staff_id], [date], [priority], [status], [task_detail], [staff_comments], [created_on],[scheduled_by] FROM [staff_schedule] WHERE ([schedule_id] = @schedule_id)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" __designer:wfdid="w351" UpdateCommand="UPDATE [staff_schedule] SET [staff_id] = @staff_id, [date] = @date, [priority] = @priority, [status] = @status, [task_detail] = @task_detail, [staff_comments] = @staff_comments, [created_on] = @created_on WHERE [schedule_id] = @schedule_id" InsertCommand="INSERT INTO [staff_schedule] ([staff_id], [date], [priority], [status], [task_detail], [staff_comments], [created_on]) VALUES (@staff_id, @date, @priority, @status, @task_detail, @staff_comments, @created_on)" DeleteCommand="DELETE FROM [staff_schedule] WHERE [schedule_id] = @schedule_id">
                <SelectParameters __designer:dtid="8162774324609088">
                    <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="schedule_id" Type="Decimal" __designer:dtid="8162774324609089"></asp:ControlParameter>
                </SelectParameters>
                <DeleteParameters __designer:dtid="8162774324609090">
                    <asp:Parameter Name="schedule_id" Type="Decimal" __designer:dtid="8162774324609091"></asp:Parameter>
                </DeleteParameters>
                <UpdateParameters __designer:dtid="8162774324609092">
                    <asp:Parameter Name="staff_id" Type="String" __designer:dtid="8162774324609093"></asp:Parameter>
                    <asp:Parameter Name="date" Type="DateTime" __designer:dtid="8162774324609094"></asp:Parameter>
                    <asp:Parameter Name="priority" Type="String" __designer:dtid="8162774324609095"></asp:Parameter>
                    <asp:Parameter Name="status" Type="String" __designer:dtid="8162774324609096"></asp:Parameter>
                    <asp:Parameter Name="task_detail" Type="String" __designer:dtid="8162774324609097"></asp:Parameter>
                    <asp:Parameter Name="staff_comments" Type="String" __designer:dtid="8162774324609098"></asp:Parameter>
                    <asp:Parameter Name="created_on" Type="DateTime" __designer:dtid="8162774324609099"></asp:Parameter>
                    <asp:Parameter Name="schedule_id" Type="Decimal" __designer:dtid="8162774324609100"></asp:Parameter>
                </UpdateParameters>
                <InsertParameters __designer:dtid="8162774324609101">
                    <asp:Parameter Name="staff_id" Type="String" __designer:dtid="8162774324609102"></asp:Parameter>
                    <asp:Parameter Name="date" Type="DateTime" __designer:dtid="8162774324609103"></asp:Parameter>
                    <asp:Parameter Name="priority" Type="String" __designer:dtid="8162774324609104"></asp:Parameter>
                    <asp:Parameter Name="status" Type="String" __designer:dtid="8162774324609105"></asp:Parameter>
                    <asp:Parameter Name="task_detail" Type="String" __designer:dtid="8162774324609106"></asp:Parameter>
                    <asp:Parameter Name="staff_comments" Type="String" __designer:dtid="8162774324609107"></asp:Parameter>
                    <asp:Parameter Name="created_on" Type="DateTime" __designer:dtid="8162774324609108"></asp:Parameter>
                </InsertParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>