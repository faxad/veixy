<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_eval3.aspx.cs" Inherits="admin_eval3" Title="Veixy-Staff Evaluation" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellspacing="0" style="width: 825px; height: 27px">
        <tr>
            <td style="width: 203px; height: 21px; background-color: white"></td>
            <td style="width: 27px; height: 21px; background-color: white">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/cp_home.jpg"
                    PostBackUrl="~/admin_main.aspx" /></td>
            <td colspan="3" style="height: 21px; background-color: #f5faf1">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="DimGray" Text="Control Panel"
                    Width="82px"></asp:Label>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="LightGray" Text="--- 4 Factor Evaluation"
                    Width="235px"></asp:Label></td>
        </tr>
    </table>
    <br />
    <table>
        <tr>
            <td style="width: 39px"></td>
            <td style="width: 21px"></td>
            <td style="width: 40px"></td>
            <td style="width: 25px"></td>
            <td style="width: 377px">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                    RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">View Most Recent</asp:ListItem>
                    <asp:ListItem>View Complete History</asp:ListItem>
                </asp:RadioButtonList></td>
            <td style="width: 68px"></td>
            <td align="center" style="width: 68px"></td>
            <td style="width: 68px"></td>
        </tr>
        <tr>
            <td style="width: 39px">
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="X-Small" Font-Underline="False" ForeColor="Gray" OnClick="LinkButton5_Click"
                    Width="78px">(Turn Off Filter)</asp:LinkButton></td>
            <td style="width: 21px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/send_but.jpg" /></td>
            <td style="width: 40px">
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Update" CssClass="bar_format"
                    Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="#400000"
                    OnClick="LinkButton1_Click" Width="102px">Generate Report</asp:LinkButton></td>
            <td style="width: 25px"></td>
            <td style="width: 377px">&nbsp;<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT [staff_id] FROM [staff_info]"></asp:SqlDataSource>
            </td>
            <td style="width: 68px">Filter By:</td>
            <td align="center" style="width: 68px">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3"
                    DataTextField="staff_id" DataValueField="staff_id" Width="97px">
                </asp:DropDownList></td>
            <td style="width: 68px">
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton4_Click"
                    Width="74px">Apply Filter </asp:LinkButton></td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
        GridLines="Horizontal" Width="818px">
        <Columns>
            <asp:BoundField DataField="user_id" HeaderText="User's ID" ReadOnly="True" SortExpression="user_id" />
            <asp:BoundField DataField="rep_date" HeaderText="Report Time" ReadOnly="True" SortExpression="rep_date" />
            <asp:BoundField DataField="perf" HeaderText="Performance (%)" SortExpression="perf">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="dis_sat" HeaderText="Customer's Dissatisfaction (%)" SortExpression="dis_sat">
                <ItemStyle HorizontalAlign="Center" Width="140px" />
            </asp:BoundField>
            <asp:BoundField DataField="t_work" HeaderText="Team Work (Points)" SortExpression="t_work">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="interact" HeaderText="Interaction (Points)" SortExpression="interact">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle CssClass="gv_blue_header" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT [user_id], [rep_date], [perf], [dis_sat], [t_work], [interact] FROM [eval_tab4] WHERE ([user_id] <> @user_id) ORDER BY [rep_date] DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="dummy" Name="user_id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT [user_id], [rep_date], [perf], [dis_sat], [t_work], [interact] FROM [eval_tab4] WHERE user_id=@uid  ORDER BY [rep_date] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="uid" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT a.user_id, a.rep_date, a.perf, a.dis_sat, a.t_work, a.interact FROM eval_tab4 AS a INNER JOIN (SELECT MAX(rep_date) AS max_date, user_id FROM eval_tab4 WHERE (user_id <> 'dummy') GROUP BY user_id) AS max_res ON a.user_id = max_res.user_id AND a.rep_date = max_res.max_date"></asp:SqlDataSource>
</asp:Content>