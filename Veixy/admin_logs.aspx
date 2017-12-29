<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_logs.aspx.cs" Inherits="admin_logs" Title="Veixy-Logs" %>

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
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="LightGray" Text="--- System Logs"
                    Width="235px"></asp:Label></td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="width: 84px">
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="X-Small" Font-Underline="False" ForeColor="Gray" OnClick="LinkButton5_Click"
                    Width="78px">(Turn Off Filter)</asp:LinkButton></td>
            <td style="width: 465px"></td>
            <td style="width: 68px">Filter By:</td>
            <td style="width: 68px">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="97px">
                    <asp:ListItem Selected="True">Staff</asp:ListItem>
                    <asp:ListItem>Cust</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="width: 68px">
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton4_Click"
                    Width="74px">Apply Filter </asp:LinkButton></td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
        GridLines="Horizontal" Width="815px" AllowPaging="True" PageSize="80">
        <Columns>
            <asp:BoundField DataField="user_id" HeaderText="User's ID" SortExpression="user_id" />
            <asp:BoundField DataField="user_type" HeaderText="User Type" SortExpression="user_type" />
            <asp:BoundField DataField="login_at" HeaderText="LogIn Time" SortExpression="login_at" />
            <asp:BoundField DataField="logout_at" HeaderText="LogOut Time" SortExpression="logout_at" />
            <asp:BoundField DataField="duration" HeaderText="Duration" SortExpression="duration" />
        </Columns>
        <HeaderStyle CssClass="gv_blue_header" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT [user_id], [user_type], [login_at], [logout_at], [duration] FROM [system_log] WHERE user_id<>'dummy' ORDER BY [login_at] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT [user_id], [user_type], [login_at], [logout_at], [duration] FROM [system_log] WHERE ([user_type] = @user_type)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="user_type" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>