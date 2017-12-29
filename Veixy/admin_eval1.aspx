<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_eval1.aspx.cs" Inherits="admin_eval1" Title="Veixy-Staff Evaluation" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table border="0" cellspacing="0" style="width: 825px; height: 27px">
        <tr>
            <td style="width: 203px; height: 21px; background-color: white"></td>
            <td style="width: 27px; height: 21px; background-color: white">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/cp_home.jpg"
                    PostBackUrl="~/admin_main.aspx" /></td>
            <td colspan="3" style="height: 21px; background-color: #f5faf1">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="DimGray" Text="Control Panel"
                    Width="82px"></asp:Label>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="LightGray" Text="--- Timed Evaluation"
                    Width="235px"></asp:Label></td>
        </tr>
    </table>
    <br />
    <table>
        <tr>
            <td style="width: 274px"></td>
            <td style="width: 240px" valign="top">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Over All View</asp:ListItem>
                    <asp:ListItem>Time Based View</asp:ListItem>
                </asp:RadioButtonList></td>
            <td style="width: 100px" valign="top"></td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="width: 192px; height: 26px"></td>
            <td style="width: 105px; height: 26px">
                <rad:RadDateTimePicker ID="RadDateTimePicker1" runat="server" Enabled="False" Width="176px">
                    <TimeView Skin="">
                    </TimeView>
                    <DateInput Skin="">
                    </DateInput>
                </rad:RadDateTimePicker>
            </td>
            <td align="center" style="width: 39px; height: 26px">to</td>
            <td style="width: 100px; height: 26px">
                <rad:RadDateTimePicker ID="RadDateTimePicker2" runat="server" Enabled="False" Width="176px">
                    <TimeView Skin="">
                    </TimeView>
                    <DateInput Skin="">
                    </DateInput>
                </rad:RadDateTimePicker>
            </td>
            <td style="width: 20px; height: 26px"></td>
            <td style="width: 20px; height: 26px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/send_but.jpg" /></td>
            <td style="width: 20px; height: 26px">
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Update" CssClass="bar_format"
                    Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="#400000"
                    OnClick="LinkButton1_Click" Width="102px">Generate Report</asp:LinkButton></td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="width: 39px">View:</td>
            <td style="width: 42px">
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton2_Click"
                    Width="44px">Recent</asp:LinkButton></td>
            <td>|</td>
            <td style="width: 68px">
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton3_Click"
                    Width="44px">Complete</asp:LinkButton></td>
            <td style="width: 377px">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                    SelectCommand="SELECT [staff_id] FROM [staff_info]"></asp:SqlDataSource>
            </td>
            <td style="width: 68px">Filter By:</td>
            <td style="width: 68px">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3"
                    DataTextField="staff_id" DataValueField="staff_id" Width="97px">
                </asp:DropDownList>
            </td>
            <td style="width: 68px">
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton4_Click"
                    Width="74px">Apply Filter </asp:LinkButton></td>
        </tr>
        <tr>
            <td style="width: 39px"></td>
            <td style="width: 42px"></td>
            <td></td>
            <td style="width: 68px"></td>
            <td style="width: 377px"></td>
            <td style="width: 68px"></td>
            <td align="center" style="width: 68px"></td>
            <td style="width: 68px">
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="X-Small" Font-Underline="False" ForeColor="Gray" OnClick="LinkButton5_Click"
                    Width="78px">(Turn Off Filter)</asp:LinkButton></td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="width: 100px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                    GridLines="Horizontal" Width="812px">
                    <Columns>
                        <asp:BoundField DataField="user_id" HeaderText="Staff ID" ReadOnly="True" SortExpression="user_id" />
                        <asp:BoundField DataField="report_date" HeaderText="Report Date" ReadOnly="True"
                            SortExpression="report_date">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="s_date" HeaderText="Date From" SortExpression="s_date">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="e_date" HeaderText="Date Till" SortExpression="e_date">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="lock_count" HeaderText="Locks" SortExpression="lock_count">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="unlock_count" HeaderText="Unlocks" SortExpression="unlock_count">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="calls_ans" HeaderText="Calls" SortExpression="calls_ans">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="schedule" HeaderText="Schedules" SortExpression="schedule">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="gv_blue_header" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT [user_id], [s_date], [report_date], [e_date], [lock_count], [unlock_count], [calls_ans], [schedule] FROM [eval_tab3] WHERE ([user_id] <> @user_id)">
        <SelectParameters>
            <asp:Parameter DefaultValue="dummy" Name="user_id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT a.user_id, a.s_date, a.report_date, a.e_date, a.lock_count, a.unlock_count, a.calls_ans, a.schedule FROM eval_tab3 AS a INNER JOIN (SELECT MAX(report_date) AS max_date, user_id FROM eval_tab3 WHERE (user_id <> 'dummy') GROUP BY user_id) AS max_res ON a.user_id = max_res.user_id AND a.report_date = max_res.max_date"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT [user_id], [s_date], [report_date], [e_date], [lock_count], [unlock_count], [calls_ans], [schedule] FROM [eval_tab3] WHERE ([user_id] = @user_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="user_id" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT     a.user_id, a.s_date, a.report_date, a.e_date, a.lock_count, a.unlock_count, a.calls_ans, a.schedule&#13;&#10;FROM         eval_tab3 AS a INNER JOIN&#13;&#10;                          (SELECT     MAX(report_date) AS max_date, user_id&#13;&#10;                            FROM          eval_tab3 WHERE user_id=@nn &#13;&#10;                            GROUP BY user_id) AS max_res ON a.user_id = max_res.user_id AND a.report_date = max_res.max_date">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="nn" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>