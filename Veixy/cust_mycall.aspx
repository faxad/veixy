<%@ Page Language="C#" MasterPageFile="~/top_mp3.master" AutoEventWireup="true" CodeFile="cust_mycall.aspx.cs" Inherits="cust_mycall" Title="Veixy-My Calls" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>
    <div style="z-index: 101; left: 1px; width: 578px; position: absolute; top: -12px; height: 263px">
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            GridLines="Horizontal" BorderStyle="None" DataKeyNames="call_ref_no" ForeColor="Black" OnRowDataBound="GridView1_RowDataBound" SelectedIndex="0" Width="776px" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="call_ref_no" HeaderText="Call ID" InsertVisible="False"
                    ReadOnly="True" SortExpression="call_ref_no" />
                <asp:BoundField DataField="call_date" HeaderText="Requested Date &amp; Time" SortExpression="call_date">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="urgent_call" HeaderText="Call Urgency" SortExpression="urgent_call">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="contact_no" HeaderText="Contact #" SortExpression="contact_no">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="call_init_date" HeaderText="Call Initiated" SortExpression="call_init_date">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="call_status" HeaderText="Call Status" SortExpression="call_status">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/cross_sign.jpg" ShowDeleteButton="True">
                    <ItemStyle BackColor="White" />
                </asp:CommandField>
            </Columns>
            <HeaderStyle BorderStyle="None" CssClass="gv_header" ForeColor="White" />
            <SelectedRowStyle BackColor="#E0E0E0" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            SelectCommand="SELECT [call_date], [contact_no], [call_ref_no], [call_status], [urgent_call], [call_init_date], [user_name] FROM [my_calls] WHERE ([user_name] = @user_name) ORDER BY [call_ref_no] DESC" DeleteCommand="DELETE FROM [my_calls] WHERE [call_ref_no] = @original_call_ref_no" InsertCommand="INSERT INTO [my_calls] ([call_date], [contact_no], [call_status], [urgent_call], [call_init_date], [user_name]) VALUES (@call_date, @contact_no, @call_status, @urgent_call, @call_init_date, @user_name)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [my_calls] SET [call_date] = @call_date, [contact_no] = @contact_no, [call_status] = @call_status, [urgent_call] = @urgent_call, [call_init_date] = @call_init_date, [user_name] = @user_name WHERE [call_ref_no] = @original_call_ref_no">
            <SelectParameters>
                <asp:SessionParameter Name="user_name" SessionField="user_session" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_call_ref_no" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="call_date" Type="DateTime" />
                <asp:Parameter Name="contact_no" Type="String" />
                <asp:Parameter Name="call_status" Type="String" />
                <asp:Parameter Name="urgent_call" Type="String" />
                <asp:Parameter Name="call_init_date" Type="DateTime" />
                <asp:Parameter Name="user_name" Type="String" />
                <asp:Parameter Name="original_call_ref_no" Type="Decimal" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="call_date" Type="DateTime" />
                <asp:Parameter Name="contact_no" Type="String" />
                <asp:Parameter Name="call_status" Type="String" />
                <asp:Parameter Name="urgent_call" Type="String" />
                <asp:Parameter Name="call_init_date" Type="DateTime" />
                <asp:Parameter Name="user_name" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <div style="z-index: 102; left: -154px; width: 167px; position: absolute; top: 291px; height: 1px">
            <img src="Images_Net/csd.gif" />
        </div>
        <br />
        <br />
        <table>
            <tr>
                <td style="width: 204px">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Right" ImageUrl="~/Images/i_sign.jpg" /></td>
                <td style="width: 379px; color: black">&nbsp;You must select the desired call first before applying Delete</td>
            </tr>
        </table>
        <table>
            <tr>
                <td style="width: 100px">
                    <strong style="color: darkgray">Call Details</strong></td>
                <td style="width: 100px"></td>
            </tr>
        </table>
        <table>
            <tr>
                <td style="width: 35px"></td>
                <td style="width: 36px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/arrow_down.jpg" /></td>
            </tr>
        </table>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                Call Title: &nbsp;<asp:Label ID="issue_subjectLabel" runat="server" Style="color: black"
                    Text='<%# Eval("issue_subject") %>' ForeColor="SteelBlue" Font-Size="Small"></asp:Label><br />
                <table>
                    <tr>
                        <td style="width: 393px; height: 19px">Call Request Details:</td>
                        <td style="width: 293px; height: 19px">Call History:</td>
                    </tr>
                </table>
                <table style="width: 755px">
                    <tr>
                        <td style="width: 406px; height: 112px;">
                            <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" Height="102px" Text='<%# Eval("issue_msg") %>'
                                TextMode="MultiLine" Width="348px" ReadOnly="True"></asp:TextBox></td>
                        <td style="width: 100px; height: 112px;">
                            <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" Height="102px" Text='<%# Eval("comments") %>'
                                TextMode="MultiLine" Width="348px" ReadOnly="True"></asp:TextBox></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            SelectCommand="SELECT [issue_subject], [issue_msg], [comments] FROM [my_calls] WHERE ([call_ref_no] = @call_ref_no)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="call_ref_no" PropertyName="SelectedValue"
                    Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
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