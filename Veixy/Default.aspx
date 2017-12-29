<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>

<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>

<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<%@ Register Assembly="RadSplitter.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script language="javascript" type="text/javascript">
function File1_onclick() {

}
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <br />
            <br />
            <rad:RadCalendar ID="RadCalendar3" runat="server" DayNameFormat="Short" EnableNavigationAnimation="True"
                Font-Names="Arial, Verdana, Tahoma" ForeColor="Black" Skin="Outlook" Style="border-left-color: #ececec; border-bottom-color: #ececec; border-top-color: #ececec; border-right-color: #ececec"
                UseColumnHeadersAsSelectors="False" Width="449px">
                <TitleStyle BackColor="SteelBlue" Font-Bold="True" ForeColor="White" />
            </rad:RadCalendar>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" /><br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" BorderColor="RoyalBlue"
                Font-Size="Small" Height="16px" RepeatDirection="Horizontal" Width="218px">
                <asp:ListItem Selected="True">Single Recipient</asp:ListItem>
                <asp:ListItem>Multiple Clients</asp:ListItem>
                <asp:ListItem>Client Group</asp:ListItem>
                <asp:ListItem>Staff Members</asp:ListItem>
            </asp:RadioButtonList><br />
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="prod_id" DataSourceID="SqlDataSource2"
                DefaultMode="Edit">
                <EditItemTemplate>
                    prod_id:
                <asp:Label ID="prod_idLabel1" runat="server" Text='<%# Eval("prod_id") %>'></asp:Label><br />
                    prod_name:
                <asp:TextBox ID="prod_nameTextBox" runat="server" Text='<%# Bind("prod_name") %>'></asp:TextBox><br />
                    product_category:
                <asp:TextBox ID="product_categoryTextBox" runat="server" Text='<%# Bind("product_category") %>'></asp:TextBox><br />
                    product_cost:
                <asp:TextBox ID="product_costTextBox" runat="server" Text='<%# Bind("product_cost") %>'></asp:TextBox><br />
                    payment_method:
                <asp:TextBox ID="payment_methodTextBox" runat="server" Text='<%# Bind("payment_method") %>'></asp:TextBox><br />
                    product_detail:
                <asp:TextBox ID="product_detailTextBox" runat="server" Text='<%# Bind("product_detail") %>'></asp:TextBox><br />
                    product_img1:
                <asp:TextBox ID="product_img1TextBox" runat="server" Text='<%# Bind("product_img1") %>'></asp:TextBox><br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    prod_name:
                <asp:TextBox ID="prod_nameTextBox" runat="server" Text='<%# Bind("prod_name") %>'></asp:TextBox><br />
                    product_category:
                <asp:TextBox ID="product_categoryTextBox" runat="server" Text='<%# Bind("product_category") %>'></asp:TextBox><br />
                    product_cost:
                <asp:TextBox ID="product_costTextBox" runat="server" Text='<%# Bind("product_cost") %>'></asp:TextBox><br />
                    payment_method:
                <asp:TextBox ID="payment_methodTextBox" runat="server" Text='<%# Bind("payment_method") %>'></asp:TextBox><br />
                    product_detail:
                <asp:TextBox ID="product_detailTextBox" runat="server" Text='<%# Bind("product_detail") %>'></asp:TextBox><br />
                    product_img1:
                <asp:TextBox ID="product_img1TextBox" runat="server" Text='<%# Bind("product_img1") %>'></asp:TextBox><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert"></asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    prod_id:
                <asp:Label ID="prod_idLabel" runat="server" Text='<%# Eval("prod_id") %>'></asp:Label><br />
                    prod_name:
                <asp:Label ID="prod_nameLabel" runat="server" Text='<%# Bind("prod_name") %>'></asp:Label><br />
                    product_category:
                <asp:Label ID="product_categoryLabel" runat="server" Text='<%# Bind("product_category") %>'></asp:Label><br />
                    product_cost:
                <asp:Label ID="product_costLabel" runat="server" Text='<%# Bind("product_cost") %>'></asp:Label><br />
                    payment_method:
                <asp:Label ID="payment_methodLabel" runat="server" Text='<%# Bind("payment_method") %>'></asp:Label><br />
                    product_detail:
                <asp:Label ID="product_detailLabel" runat="server" Text='<%# Bind("product_detail") %>'></asp:Label><br />
                    product_img1:
                <asp:Label ID="product_img1Label" runat="server" Text='<%# Bind("product_img1") %>'></asp:Label><br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit"></asp:LinkButton>
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                        Text="Delete"></asp:LinkButton>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                        Text="New"></asp:LinkButton>
                </ItemTemplate>
            </asp:FormView>
            &nbsp;
        <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                DeleteCommand="DELETE FROM [prod_info] WHERE [prod_id] = @prod_id" InsertCommand="INSERT INTO [prod_info] ([prod_name], [product_category], [product_cost], [payment_method], [product_detail], [product_img1]) VALUES (@prod_name, @product_category, @product_cost, @payment_method, @product_detail, @product_img1)"
                SelectCommand="SELECT * FROM [prod_info]" UpdateCommand="UPDATE [prod_info] SET [prod_name] = @prod_name, [product_category] = @product_category, [product_cost] = @product_cost, [payment_method] = @payment_method, [product_detail] = @product_detail, [product_img1] = @product_img1 WHERE [prod_id] = @prod_id">
                <DeleteParameters>
                    <asp:Parameter Name="prod_id" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="prod_name" Type="String" />
                    <asp:Parameter Name="product_category" Type="String" />
                    <asp:Parameter Name="product_cost" Type="Decimal" />
                    <asp:Parameter Name="payment_method" Type="String" />
                    <asp:Parameter Name="product_detail" Type="String" />
                    <asp:Parameter Name="product_img1" Type="Object" />
                    <asp:Parameter Name="prod_id" Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="prod_name" Type="String" />
                    <asp:Parameter Name="product_category" Type="String" />
                    <asp:Parameter Name="product_cost" Type="Decimal" />
                    <asp:Parameter Name="payment_method" Type="String" />
                    <asp:Parameter Name="product_detail" Type="String" />
                    <asp:Parameter Name="product_img1" Type="Object" />
                </InsertParameters>
            </asp:SqlDataSource>
            &nbsp;
        <input id="File1" type="file" onclick="return File1_onclick()" /><br />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Button" /><br />
            &nbsp;<br />
            <br />
            <br />
            <table>
                <tr>
                    <td style="width: 100px; height: 17px">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/cancel.jpg" /></td>
                    <td style="width: 100px; height: 17px">
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Cancel" CssClass="bar_format"
                            Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab"
                            Width="65px">Cancel</asp:LinkButton></td>
                    <td style="width: 100px; height: 17px">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/send_but.jpg" /></td>
                    <td style="width: 100px; height: 17px">
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Update" CssClass="bar_format"
                            Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" Width="57px">Update</asp:LinkButton></td>
                </tr>
            </table>
            <br />
            <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; width: 585px; color: white; background-color: steelblue">
                <tr>
                    <td style="width: 45px; height: 19px"></td>
                    <td style="width: 92px; height: 19px">Complaint #</td>
                    <td align="center" style="width: 115px; height: 19px">Complaint By</td>
                    <td align="center" style="width: 126px; height: 19px">Date</td>
                    <td align="center" style="width: 125px; height: 19px">Complaint Text</td>
                    <td align="center" style="width: 77px; height: 19px">Status</td>
                    <td align="center" style="width: 30px; height: 19px"></td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="token_no"
                DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="token_no" HeaderText="token_no" ReadOnly="True" SortExpression="token_no" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                </Columns>
            </asp:GridView>
            &nbsp;
        <asp:Calendar ID="Calendar2" runat="server" SelectionMode="DayWeekMonth"></asp:Calendar>
            &nbsp;
        <rad:RadCalendar ID="RadCalendar1" runat="server" Font-Names="Arial,Verdana,Tahoma"
            ForeColor="Black" SelectedDate="" Style="border-left-color: #ececec; border-bottom-color: #ececec; border-top-color: #ececec; border-right-color: #ececec">
        </rad:RadCalendar>
            <rad:RadCalendar ID="RadCalendar2" runat="server" Font-Names="Arial, Verdana, Tahoma"
                ForeColor="Black" Style="border-left-color: #ececec; border-bottom-color: #ececec; border-top-color: #ececec; border-right-color: #ececec">
            </rad:RadCalendar>
            <br />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Button" />
            <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT * FROM [test_1]"></asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" Height="107px" Width="190px"></asp:Calendar>
                    &nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>&amp;<asp:TextBox ID="TextBox1"
                    runat="server"></asp:TextBox>&nbsp;
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" /><br />
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox1">
                    </cc1:CalendarExtender>
                    &nbsp;
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TextBox2">
                </cc1:CalendarExtender>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="payment_date" HeaderText="payment_date" SortExpression="payment_date" />
                            <asp:BoundField DataField="payment_name" HeaderText="payment_name" SortExpression="payment_name" />
                            <asp:BoundField DataField="due_date" HeaderText="due_date" SortExpression="due_date" />
                            <asp:BoundField DataField="amount" HeaderText="amount" SortExpression="amount" />
                            <asp:BoundField DataField="amount_due" HeaderText="amount_due" SortExpression="amount_due" />
                            <asp:BoundField DataField="payment_by" HeaderText="payment_by" SortExpression="payment_by" />
                            <asp:BoundField DataField="payment_no" HeaderText="payment_no" SortExpression="payment_no" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                        SelectCommand="SELECT [payment_date], [payment_name], [due_date], [amount], [amount_due], [payment_by], [payment_no] FROM [cust_payment] WHERE (([payment_date] <= @payment_date) AND ([payment_date] >= @payment_date2))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="payment_date" PropertyName="Text"
                                Type="DateTime" />
                            <asp:ControlParameter ControlID="TextBox2" Name="payment_date2" PropertyName="Text"
                                Type="DateTime" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            <br />
            &nbsp;&nbsp;<br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>