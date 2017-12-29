<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_staffdir.aspx.cs" Inherits="staff_custdir" Title="Veixy-Staff Directory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="z-index: 101; left: 5px; width: 100px; position: absolute; top: 3px; height: 100px">
        <img src="Images/staff_dir.jpg" />
    </div>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="Small" Height="1px"
        Width="630px">
        <Columns>
            <asp:BoundField DataField="staff_id" HeaderText="Staff ID" ReadOnly="True" SortExpression="staff_id" />
            <asp:BoundField DataField="f_name" HeaderText="First Name" SortExpression="f_name" />
            <asp:BoundField DataField="l_name" HeaderText="Last Name" SortExpression="l_name" />
            <asp:BoundField DataField="post_title" HeaderText="Job Designation" SortExpression="post_title" />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
            <asp:BoundField DataField="staff_contact_no" HeaderText="Contact # 1" SortExpression="staff_contact_no" />
            <asp:BoundField DataField="staff_contact_no2" HeaderText="Contact # 2" SortExpression="staff_contact_no2" />
            <asp:BoundField DataField="email_add" HeaderText="Email Address" SortExpression="email_add" />
        </Columns>
        <HeaderStyle BackColor="SteelBlue" ForeColor="White" />
        <AlternatingRowStyle BackColor="#F5FAF1" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT [staff_id], [staff_contact_no], [staff_contact_no2], [email_add], [staff_id_no], [post_title], [city], [l_name], [f_name] FROM [staff_info]"></asp:SqlDataSource>
</asp:Content>