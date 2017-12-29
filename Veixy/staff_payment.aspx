<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_payment.aspx.cs" Inherits="staff_inbox" Title="Veixy-Payments" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table cellspacing="0" width="632">
                <tbody>
                    <tr>
                        <td style="width: 98px; height: 26px">
                            <div style="z-index: 101; left: 5px; width: 100px; position: absolute; top: 6px; height: 100px" __designer:dtid="2814749767106731">
                                <img src="Images/staff_payment.jpg" />
                            </div>
                        </td>
                        <td style="height: 26px" align="center" colspan="3"></td>
                        <td style="width: 100px; height: 26px"></td>
                    </tr>
                    <tr>
                        <td style="width: 98px; height: 26px"></td>
                        <td style="height: 26px" align="center" colspan="3">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="222px" Font-Size="Small" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">Payments Made</asp:ListItem>
                                <asp:ListItem>Due Payments</asp:ListItem>
                            </asp:RadioButtonList>&nbsp;
                            <asp:Label ID="Label2" runat="server" Width="278px" Font-Size="Small" Text="Specify the dates to view the payment history" ForeColor="#003399"></asp:Label></td>
                        <td style="width: 100px; height: 26px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 98px; height: 26px"></td>
                        <td style="width: 100px; height: 26px">
                            <asp:TextBox ID="TextBox1" runat="server" Width="110px" Font-Size="Small"></asp:TextBox>
                        </td>
                        <td style="width: 100px; height: 26px">
                            <asp:Label ID="Label5" runat="server" Width="67px" Font-Size="Small" Text="Start Date" ForeColor="LightGray"></asp:Label></td>
                        <td style="width: 111px; height: 26px">
                            <asp:TextBox ID="TextBox2" runat="server" Width="110px" Font-Size="Small"></asp:TextBox>
                        </td>
                        <td style="width: 100px; height: 26px">
                            <asp:Label ID="Label1" runat="server" Width="57px" Font-Size="Small" Text="End Date" ForeColor="LightGray"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 98px; height: 26px"></td>
                        <td style="height: 26px" colspan="2">
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox1"></cc1:CalendarExtender>
                        </td>
                        <td style="height: 26px" colspan="2">
                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TextBox2">
                            </cc1:CalendarExtender>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/hold_pic.jpg"></asp:Image>
                            <asp:LinkButton ID="LinkButton8" OnClick="LinkButton7_Click" runat="server" Width="84px" Font-Size="Small" ForeColor="OliveDrab" Font-Underline="False" BorderStyle="None" Font-Bold="True" BackColor="Transparent" BorderWidth="1px">View Payments</asp:LinkButton></td>
                    </tr>
                </tbody>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table style="font-weight: bolder; font-size: small; color: white; background-color: steelblue; width: 635px;" id="TABLE1" cellspacing="0" border="0">
        <tbody>
            <tr>
                <td style="width: 976px; height: 23px">Product Title</td>
                <td style="width: 822px; height: 23px" align="right">User ID</td>
                <td style="width: 728px; height: 23px" align="center">Payment Date</td>
                <td style="width: 626px; height: 23px" align="center">Amount Paid</td>
                <td align="center" style="width: 842px; height: 23px">Due Date</td>
                <td align="center" style="width: 444px; height: 23px">Amount Due</td>
                <td style="height: 23px" align="center"></td>
                <td style="width: 398px; height: 23px" align="center">Payment ID</td>
            </tr>
        </tbody>
    </table>
    <asp:Panel ID="Panel1" runat="server" Height="277px" ScrollBars="Vertical" Width="632px">

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">

            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" Width="613px" Font-Size="Small" BorderStyle="None" ShowHeader="False" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" __designer:wfdid="w856">
                    <RowStyle Height="5px"></RowStyle>
                    <Columns>
                        <asp:BoundField DataField="product_name" HeaderText="product_name" SortExpression="product_name">
                            <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="payment_by" HeaderText="payment_by" SortExpression="payment_by"></asp:BoundField>
                        <asp:BoundField DataField="payment_date" HeaderText="payment_date" ReadOnly="True" SortExpression="payment_date"></asp:BoundField>
                        <asp:BoundField DataField="amount" HeaderText="amount" SortExpression="amount"></asp:BoundField>
                        <asp:BoundField DataField="due_date" HeaderText="due_date" ReadOnly="True" SortExpression="due_date"></asp:BoundField>
                        <asp:BoundField DataField="amount_due" HeaderText="amount_due" SortExpression="amount_due"></asp:BoundField>
                        <asp:BoundField DataField="payment_no" HeaderText="payment_no" SortExpression="payment_no">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                    </Columns>

                    <SelectedRowStyle BackColor="WhiteSmoke"></SelectedRowStyle>

                    <HeaderStyle BackColor="SteelBlue" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <EditRowStyle Height="5px"></EditRowStyle>

                    <AlternatingRowStyle BackColor="WhiteSmoke"></AlternatingRowStyle>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        &nbsp;
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT [product_name], CONVERT (VARCHAR, payment_date, 101) AS  payment_date, [amount],CONVERT (VARCHAR, due_date, 101) AS  due_date, [amount_due], [payment_by], [payment_no] FROM [cust_payment] WHERE [payment_date]>=@payment_date AND [payment_date]<=@payment_date2">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="payment_date" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox2" Name="payment_date2" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            SelectCommand="SELECT [payment_name], CONVERT (VARCHAR, payment_date, 101) AS  payment_date, [amount],CONVERT (VARCHAR, due_date, 101) AS  due_date, [amount_due], [payment_by], [payment_no] FROM [cust_payment] WHERE [due_date]>=@due_date AND [due_date]<=@due_date2">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="due_date" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox2" Name="due_date2" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        </asp:ScriptManagerProxy>
        <div style="z-index: 102; left: 222px; width: 100px; position: absolute; top: 98px; height: 100px">
            &nbsp;<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                DisplayAfter="1">
                <ProgressTemplate>
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
    </asp:Panel>
    &nbsp;
    <br />
    <br />
    <br />
    <br />
</asp:Content>