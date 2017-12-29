<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_custdir.aspx.cs" Inherits="staff_custdir" Title="Veixy-Customer's Directory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="z-index: 101; left: -1px; width: 100px; position: absolute; top: 8px; height: 100px">
        <img src="Images/cust_dir.jpg" />
    </div>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
        DataKeyNames="user_id" DataSourceID="SqlDataSource1" Font-Size="Small" Height="1px"
        Width="630px">
        <Columns>
            <asp:BoundField DataField="user_id" HeaderText="User ID" ReadOnly="True" SortExpression="user_id" />
            <asp:BoundField DataField="f_name" HeaderText="First Name" SortExpression="f_name" />
            <asp:BoundField DataField="l_name" HeaderText="Last Name" SortExpression="l_name" />
            <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
            <asp:BoundField DataField="user_contact_no" HeaderText="Contact # 1" SortExpression="user_contact_no" />
            <asp:BoundField DataField="user_contact_no2" HeaderText="Contact # 2" SortExpression="user_contact_no2" />
        </Columns>
        <HeaderStyle BackColor="SteelBlue" ForeColor="White" />
        <AlternatingRowStyle BackColor="#F5FAF1" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT [user_id], [f_name], [l_name], [country], [city], [user_contact_no], [user_contact_no2] FROM [user_info] ORDER BY [f_name]"></asp:SqlDataSource>
</asp:Content>