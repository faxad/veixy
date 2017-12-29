<%@ Page Language="C#" MasterPageFile="~/user_mp.master" AutoEventWireup="true" CodeFile="user_payment.aspx.cs" Inherits="staff_inbox" Title="Veixy-Payments" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>

    &nbsp;<br />
    &nbsp;<asp:Panel ID="Panel1" runat="server" Height="280px">

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">

            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" Width="597px" Font-Size="Small" DataSourceID="SqlDataSource1" BorderStyle="None" __designer:wfdid="w114" AllowPaging="True" AutoGenerateColumns="False">
                    <RowStyle Height="5px"></RowStyle>
                    <Columns>
                        <asp:BoundField DataField="product_name" HeaderText="Product Title" SortExpression="product_name">
                            <HeaderStyle BorderStyle="None" Width="150px"></HeaderStyle>

                            <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="payment_duration" HeaderText="Duration (Months)" SortExpression="payment_duration">
                            <HeaderStyle BorderStyle="None" Width="50px"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="payment_date" HeaderText="Payment Date" ReadOnly="True" SortExpression="payment_date">
                            <HeaderStyle BorderStyle="None"></HeaderStyle>

                            <ItemStyle HorizontalAlign="Center" BackColor="#F5FAF1"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="amount" HeaderText="Amount Paid" SortExpression="amount">
                            <HeaderStyle BorderStyle="None"></HeaderStyle>

                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="due_date" HeaderText="Due Date" ReadOnly="True" SortExpression="due_date">
                            <HeaderStyle BorderStyle="None"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="amount_due" HeaderText="Due Amount" SortExpression="amount_due">
                            <HeaderStyle BorderStyle="None"></HeaderStyle>

                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="payment_no" HeaderText="Payment #" SortExpression="payment_no">
                            <HeaderStyle BorderStyle="None"></HeaderStyle>

                            <ItemStyle HorizontalAlign="Center" BackColor="#F5FAF1"></ItemStyle>
                        </asp:BoundField>
                    </Columns>

                    <PagerStyle ForeColor="#003399"></PagerStyle>

                    <SelectedRowStyle BackColor="WhiteSmoke"></SelectedRowStyle>

                    <HeaderStyle BackColor="SteelBlue" BorderStyle="None" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <EditRowStyle Height="5px"></EditRowStyle>

                    <AlternatingRowStyle BackColor="#F5FAF1"></AlternatingRowStyle>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            SelectCommand="SELECT [payment_name],product_name, CONVERT (VARCHAR, payment_date, 101) AS  payment_date, [amount],CONVERT (VARCHAR, due_date, 101) AS  due_date, [amount_due], [payment_duration], [payment_no] FROM [cust_payment] WHERE [payment_by]=@payment_by">
            <SelectParameters>
                <asp:QueryStringParameter Name="payment_by" QueryStringField="user_query" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            SelectCommand="SELECT [payment_name], CONVERT (VARCHAR, payment_date, 101) AS  payment_date, [amount],CONVERT (VARCHAR, due_date, 101) AS  due_date, [amount_due], [payment_by], [payment_no] FROM [cust_payment] WHERE [due_date]>=@due_date AND [due_date]<=@due_date2">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="due_date" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox2" Name="due_date2" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <div style="z-index: 102; left: 222px; width: 100px; position: absolute; top: 98px; height: 100px">
        &nbsp;<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2"
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
    <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="TextBox7" PopupPosition="TopLeft">
    </cc1:CalendarExtender>
    <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; width: 592px; color: white; background-color: steelblue">
        <tr>
            <td style="width: 11px; height: 19px"></td>
            <td align="left" colspan="6" style="height: 19px">Payment Panel</td>
        </tr>
    </table>
    <table style="background-color: #f5faf1; color: #333399;">
        <tr>
            <td style="width: 81px; height: 26px"></td>
            <td style="width: 81px; height: 26px">
                <asp:Label ID="Label4" runat="server" Font-Size="Small" ForeColor="#003399" Text="Payee's ID"
                    Width="70px"></asp:Label></td>
            <td style="width: 83px; height: 26px">
                <asp:TextBox ID="TextBox3" runat="server" Width="115px" ReadOnly="True"></asp:TextBox></td>
            <td style="width: 100px; height: 26px">
                <asp:Label ID="Label3" runat="server" Font-Size="Small" ForeColor="#003399" Text="Payment Title"
                    Width="81px"></asp:Label></td>
            <td colspan="3" style="height: 26px">
                <asp:TextBox ID="TextBox8" runat="server" TextMode="MultiLine" Width="246px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 83px; height: 26px"></td>
            <td style="width: 83px; height: 26px">
                <asp:Label ID="Label6" runat="server" Font-Size="Small" ForeColor="#003399" Text="Paid Amount"
                    Width="81px"></asp:Label></td>
            <td style="width: 100px; height: 26px" valign="top">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="Label5" runat="server" Text="Price:"></asp:Label></td>
                                <td style="width: 100px">
                                    <asp:Label ID="Label2" runat="server" Width="79px"></asp:Label></td>
                            </tr>
                        </table>
                        <asp:TextBox ID="TextBox4" runat="server" Width="74px"></asp:TextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td style="height: 26px" align="center">
                <asp:Label ID="Label9" runat="server" Font-Size="Small" ForeColor="#003399" Text="Amount Due"
                    Width="72px"></asp:Label></td>
            <td style="width: 78px; height: 26px">
                <asp:TextBox ID="TextBox6" runat="server" Width="75px"></asp:TextBox></td>
            <td style="width: 63px; height: 26px">
                <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="#003399" Text="Product"
                    Width="52px"></asp:Label></td>
            <td style="width: 100px; height: 26px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3"
                            DataTextField="prod_title" DataValueField="prod_title" Width="130px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 83px; height: 21px"></td>
            <td style="width: 83px; height: 21px">
                <asp:Label ID="Label7" runat="server" Font-Size="Small" ForeColor="#003399" Text="Payment Duration"
                    Width="102px"></asp:Label></td>
            <td style="width: 100px; height: 21px">&nbsp;<asp:UpdatePanel ID="UpdatePanel5" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Width="26px" AutoPostBack="True" OnTextChanged="TextBox5_TextChanged"></asp:TextBox>
                    <asp:Label ID="Label8" runat="server" Font-Size="Small" ForeColor="Silver" Text="months"
                        Width="41px"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
                &nbsp;
            </td>
            <td style="height: 21px" align="center">&nbsp;<asp:Label ID="Label10" runat="server" Font-Size="Small" ForeColor="#003399"
                Text="Due Date" Width="69px"></asp:Label></td>
            <td style="width: 78px; height: 21px">
                <asp:TextBox ID="TextBox7" runat="server" Width="75px"></asp:TextBox></td>
            <td style="width: 63px; height: 21px" align="right"></td>
            <td style="width: 100px; height: 21px">
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Font-Size="Small"
                    ForeColor="#C00000" OnCheckedChanged="CheckBox1_CheckedChanged" Text="New Product"
                    Width="92px" />
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4"
                            DataTextField="prod_name" DataValueField="prod_name" Enabled="False" Width="131px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList><br />
                    </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 83px; height: 21px"></td>
            <td style="width: 83px; height: 21px"></td>
            <td style="width: 100px; height: 21px">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString5 %>"
                    SelectCommand="SELECT [prod_title] FROM [my_product] WHERE user_name=@user_name">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="user_name" QueryStringField="user_query" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td colspan="2" style="height: 21px">
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                    SelectCommand="SELECT [prod_name], [prod_id] FROM [prod_info]"></asp:SqlDataSource>
            </td>
            <td align="right" style="width: 63px; height: 21px" valign="top">
                <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
            <td style="width: 100px; height: 21px" valign="top">
                <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="45px" Font-Size="Small" ForeColor="OliveDrab" BorderWidth="1px" BackColor="Transparent" Font-Bold="True" BorderStyle="None" Font-Underline="False">Confirm</asp:LinkButton></td>
        </tr>
    </table>
    <br />
</asp:Content>