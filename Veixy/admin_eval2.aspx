<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_eval2.aspx.cs" Inherits="admin_eval2" Title="Veixy-Staff Evaluation" %>

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
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="LightGray" Text="--- Global Evaluation"
                    Width="235px"></asp:Label></td>
        </tr>
    </table>
    <br />
    <table style="width: 816px">
        <tr>
            <td style="width: 203px">
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="X-Small" Font-Underline="False" ForeColor="Gray" OnClick="LinkButton5_Click"
                    Width="78px">(Turn Off Filter)</asp:LinkButton></td>
            <td style="width: 660px"></td>
            <td style="width: 268px">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                    SelectCommand="SELECT [staff_id] FROM [staff_info]"></asp:SqlDataSource>
            </td>
            <td style="width: 113px">Filter By:</td>
            <td style="width: 92px">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3"
                    DataTextField="staff_id" DataValueField="staff_id" Width="161px">
                </asp:DropDownList></td>
            <td style="width: 100px">
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton4_Click"
                    Width="74px">Apply Filter </asp:LinkButton></td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
        GridLines="Horizontal" Width="819px">
        <Columns>
            <asp:BoundField DataField="user_id" HeaderText="Staff's ID" SortExpression="user_id" />
            <asp:BoundField DataField="held" HeaderText="Held" SortExpression="held">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="force_unheld" HeaderText="Forced Unhold" SortExpression="force_unheld">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="rec_made" HeaderText="Recommendations Made" SortExpression="rec_made">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="rec_accept" HeaderText="Recommendations Accepted" SortExpression="rec_accept">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="msg_sent" HeaderText="Messages Sent" SortExpression="msg_sent">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle CssClass="gv_blue_header" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT [user_id], [rep_date], [held], [rec_made], [force_unheld], [rec_accept], [msg_sent] FROM [eval_tab2] WHERE ([user_id] <> @user_id)">
        <SelectParameters>
            <asp:Parameter DefaultValue="dummy" Name="user_id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT [user_id], [rep_date], [held], [rec_made], [force_unheld], [rec_accept], [msg_sent] FROM [eval_tab2] WHERE ([user_id] = @user_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="user_id" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>