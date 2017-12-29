<%@ Page Language="C#" MasterPageFile="~/top_mp7.master" AutoEventWireup="true" CodeFile="cust_payment.aspx.cs" Inherits="cust_payment" Title="Veixy-Payments" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="z-index: 101; left: 0px; width: 779px; position: absolute; top: 0px; height: 100px; color: steelblue;">
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            SelectCommand="SELECT CONVERT (VARCHAR, due_date, 101) AS due_date, [amount], CONVERT (VARCHAR, payment_date, 101) AS payment_date, [payment_duration], [amount_due], [payment_by], [product_name], [payment_no] FROM [cust_payment] WHERE payment_by=@payment_by ORDER BY payment_no DESC">
            <SelectParameters>
                <asp:SessionParameter Name="payment_by" SessionField="user_session" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None"
            DataSourceID="SqlDataSource3" GridLines="Horizontal" Width="778px">
            <FooterStyle BorderStyle="None" />
            <RowStyle BorderStyle="None" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="payment_no" HeaderText="Payment #" InsertVisible="False"
                    ReadOnly="True" SortExpression="payment_no" />
                <asp:BoundField DataField="product_name" HeaderText="Product Title" SortExpression="product_name">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="payment_by" HeaderText="Payee's Name" SortExpression="payment_by">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="payment_date" HeaderText="Payment Date" SortExpression="payment_date">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="amount" HeaderText="Amount Paid" SortExpression="amount">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="payment_duration" HeaderText="Duration*" SortExpression="payment_duration">
                    <HeaderStyle Width="10px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="amount_due" HeaderText="Amount Due" SortExpression="amount_due">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="gv_header" ForeColor="White" />
        </asp:GridView>
        <table>
            <tr>
                <td style="width: 54px">Duration*:
                </td>
                <td style="width: 123px; color: black">Duration in months&nbsp;</td>
            </tr>
        </table>
        <br />
        <table style="width: 591px">
            <tr>
                <td style="width: 351px"></td>
                <td style="width: 31px">
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="X-Small" Font-Underline="False"
                        ForeColor="SteelBlue" NavigateUrl="~/about_us.aspx" Width="51px">About Us</asp:HyperLink></td>
                <td>
                    <img src="Images/lint_v.jpg" /></td>
                <td style="width: 62px">
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="X-Small" Font-Underline="False"
                        ForeColor="SteelBlue" NavigateUrl="~/contact_us.aspx" Width="53px">Contact Us</asp:HyperLink></td>
                <td>
                    <img src="Images/lint_v.jpg" /></td>
                <td style="width: 100px">
                    <asp:Label ID="Label221" runat="server" Font-Size="X-Small" Font-Underline="False"
                        ForeColor="Gray" Text="© Veixy.com"></asp:Label></td>
                <td style="width: 98px"></td>
            </tr>
        </table>
    </div>
</asp:Content>