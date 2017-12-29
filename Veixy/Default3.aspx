<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" EnableEventValidation="false" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<script language="javascript" type="text/javascript">
    var oldgridSelectedColor;
    function setMouseOverColor(element) {
        oldgridSelectedColor = element.style.backgroundColor;
        element.style.backgroundColor = 'yellow';
        element.style.cursor = 'hand';
    }
    function setMouseOutColor(element) {
        element.style.backgroundColor = oldgridSelectedColor;
        element.style.textDecoration = 'none';
    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="My_StyleSheet.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox3" runat="server">12/23/2008</asp:TextBox>
            <asp:TextBox ID="TextBox4" runat="server">10:05:00 AM</asp:TextBox><br />
            &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="call_ref_no"
                DataSourceID="SqlDataSource6">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="contact_no" HeaderText="contact_no" SortExpression="contact_no" />
                    <asp:BoundField DataField="call_ref_no" HeaderText="call_ref_no" InsertVisible="False"
                        ReadOnly="True" SortExpression="call_ref_no" />
                    <asp:BoundField DataField="call_status" HeaderText="call_status" SortExpression="call_status" />
                    <asp:BoundField DataField="call_date" HeaderText="call_date" SortExpression="call_date" />
                    <asp:BoundField DataField="call_init_date" HeaderText="call_init_date" SortExpression="call_init_date" />
                    <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name" />
                    <asp:BoundField DataField="urgent_call" HeaderText="urgent_call" SortExpression="urgent_call" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                DeleteCommand="DELETE FROM [my_calls] WHERE [call_ref_no] = @original_call_ref_no"
                InsertCommand="INSERT INTO [my_calls] ([contact_no], [call_status], [call_date], [call_init_date], [user_name], [urgent_call]) VALUES (@contact_no, @call_status, @call_date, @call_init_date, @user_name, @urgent_call)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [contact_no], [call_ref_no], [call_status], [call_date], [call_init_date], [user_name], [urgent_call] FROM [my_calls]"
                UpdateCommand="UPDATE [my_calls] SET [contact_no] = @contact_no, [call_status] = @call_status, [call_date] = @call_date, [call_init_date] = @call_init_date, [user_name] = @user_name, [urgent_call] = @urgent_call WHERE [call_ref_no] = @original_call_ref_no">
                <DeleteParameters>
                    <asp:Parameter Name="original_call_ref_no" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="contact_no" Type="String" />
                    <asp:Parameter Name="call_status" Type="String" />
                    <asp:Parameter Name="call_date" Type="DateTime" />
                    <asp:Parameter Name="call_init_date" Type="DateTime" />
                    <asp:Parameter Name="user_name" Type="String" />
                    <asp:Parameter Name="urgent_call" Type="String" />
                    <asp:Parameter Name="original_call_ref_no" Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="contact_no" Type="String" />
                    <asp:Parameter Name="call_status" Type="String" />
                    <asp:Parameter Name="call_date" Type="DateTime" />
                    <asp:Parameter Name="call_init_date" Type="DateTime" />
                    <asp:Parameter Name="user_name" Type="String" />
                    <asp:Parameter Name="urgent_call" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
        <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                <asp:ListItem Selected="True" Value="/2000">2000</asp:ListItem>
                <asp:ListItem Value="/2001">2001</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:GridView ID="GridView7" runat="server" DataSourceID="SqlDataSource11" DataKeyNames="payment_no">
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT [payment_no], [payment_name], [payment_by], [amount], CONVERT (VARCHAR, payment_date, 101) AS p_date, CONVERT (VARCHAR, due_date, 101) AS d_date, [amount_due] FROM [cust_payment] WHERE [payment_date]<=@p_date">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox8" Name="p_date" PropertyName="Text" />
                </SelectParameters>
                <FilterParameters>
                    <asp:ControlParameter ControlID="Calendar2" Name="newparameter" PropertyName="SelectedDates" />
                </FilterParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label><br />
            <br />
            <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Button" BackColor="#C00000" />
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator><br />
            <br />
            <asp:Panel ID="Panel1" runat="server" Height="200px" ScrollBars="Vertical" Width="237px">
                &nbsp;
            <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataKeyNames="token_no"
                DataSourceID="SqlDataSource8" ForeColor="Red">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="token_no" HeaderText="token_no" ReadOnly="True" SortExpression="token_no" />
                    <asp:BoundField DataField="msg_subject" HeaderText="msg_subject" SortExpression="msg_subject" />
                </Columns>
            </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                    SelectCommand="SELECT [token_no], [msg_subject] FROM [cust_inbox]"></asp:SqlDataSource>
                <a name="abc"></a>
                fa<br />
                a<br />
                f<br />
                f<br />
                f<br />
                f<br />
                f<br />
                g<br />
                hg<br />
                g<br />
                g<br />
                <br />
                fsaf<br />
                <br />
                s<br />
                ds<br />
                sf<br />
                <a href="#abc">TOP </a>
            </asp:Panel>
            <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="TextBox6"
                WatermarkText="Enter staff's ID">
            </cc1:TextBoxWatermarkExtender>
            <asp:TextBox ID="TextBox6" runat="server" ForeColor="#8080FF"></asp:TextBox><br />
            <br />
            <br />
            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Panel ID="Panel2" runat="server" Height="244px" ScrollBars="Vertical" Width="229px">
            &nbsp;<asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource10">
            </asp:DataList><asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT * FROM [act_onbox] WHERE ([token_no] = @token_no)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView6" Name="token_no" PropertyName="SelectedValue"
                        Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT [token_no], [act_msg], [msg_date], [msg_from] FROM [act_onbox] WHERE ([token_no] = @token_no)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView6" Name="token_no" PropertyName="SelectedValue"
                        Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Button" />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White"
                        BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="172px"
                        NextPrevFormat="FullMonth" Width="229px">
                        <SelectedDayStyle BackColor="YellowGreen" ForeColor="White" />
                        <TodayDayStyle BorderColor="GreenYellow" BorderStyle="Solid" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" CssClass="gv_header"
                            Font-Bold="True" Font-Size="12pt" ForeColor="White" />
                    </asp:Calendar>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            &nbsp;<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Button" /><br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>&nbsp;
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
            &nbsp;
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <asp:Button ID="Button7" runat="server" Text="Button" /><br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label><br />
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" DeleteCommand="DELETE FROM [staff_loc] WHERE [loc_sno] = @original_loc_sno AND [loc_type] = @original_loc_type AND [user_loc_id] = @original_user_loc_id AND [loc_topic] = @original_loc_topic"
                InsertCommand="INSERT INTO [staff_loc] ([loc_type], [user_loc_id], [loc_topic]) VALUES (@loc_type, @user_loc_id, @loc_topic)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [loc_type], [user_loc_id], [loc_topic], [loc_sno] FROM [staff_loc]"
                UpdateCommand="UPDATE [staff_loc] SET [loc_type] = @loc_type, [user_loc_id] = @user_loc_id, [loc_topic] = @loc_topic WHERE [loc_sno] = @original_loc_sno AND [loc_type] = @original_loc_type AND [user_loc_id] = @original_user_loc_id AND [loc_topic] = @original_loc_topic">
                <DeleteParameters>
                    <asp:Parameter Name="original_loc_sno" Type="Decimal" />
                    <asp:Parameter Name="original_loc_type" Type="String" />
                    <asp:Parameter Name="original_user_loc_id" Type="Decimal" />
                    <asp:Parameter Name="original_loc_topic" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="loc_type" Type="String" />
                    <asp:Parameter Name="user_loc_id" Type="Decimal" />
                    <asp:Parameter Name="loc_topic" Type="String" />
                    <asp:Parameter Name="original_loc_sno" Type="Decimal" />
                    <asp:Parameter Name="original_loc_type" Type="String" />
                    <asp:Parameter Name="original_user_loc_id" Type="Decimal" />
                    <asp:Parameter Name="original_loc_topic" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="loc_type" Type="String" />
                    <asp:Parameter Name="user_loc_id" Type="Decimal" />
                    <asp:Parameter Name="loc_topic" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            &nbsp;
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BorderStyle="None"
            DataKeyNames="loc_sno" DataSourceID="SqlDataSource7" GridLines="None" AllowPaging="True" PageSize="4">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="loc_type" HeaderText="loc_type" SortExpression="loc_type">
                    <HeaderStyle BackColor="#FFE0C0" />
                </asp:BoundField>
                <asp:BoundField DataField="user_loc_id" HeaderText="user_loc_id" SortExpression="user_loc_id" />
                <asp:BoundField DataField="loc_topic" HeaderText="loc_topic" SortExpression="loc_topic" />
                <asp:BoundField DataField="loc_sno" HeaderText="loc_sno" InsertVisible="False" ReadOnly="True"
                    SortExpression="loc_sno" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings PageButtonCount="4" />
        </asp:GridView>
            &nbsp;&nbsp;&nbsp;<br />
            &nbsp;<br />
            <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" Height="152px"
                Width="298px" ScrollBars="Both" tabPosition="right-h">
                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                    <ContentTemplate>
                        dfdsf
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                    <ContentTemplate>
                        fsdfsdf
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                </cc1:TabPanel>
            </cc1:TabContainer><br />
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="token_no"
                DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" BorderStyle="None" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="126px">
                <Columns>
                    <asp:BoundField DataField="token_no" HeaderText="token_no" ReadOnly="True" SortExpression="token_no" />
                    <asp:BoundField DataField="sent_from" HeaderText="sent_from" SortExpression="sent_from" />
                    <asp:BoundField DataField="msg_subject" HeaderText="msg_subject" SortExpression="msg_subject" />
                    <asp:BoundField DataField="img_url" HeaderText="img_url" SortExpression="img_url" />
                    <asp:BoundField DataField="img_url2" HeaderText="img_url2" SortExpression="img_url2" />
                    <asp:BoundField DataField="start_date" HeaderText="start_date" SortExpression="start_date" />
                    <asp:BoundField DataField="open_close" HeaderText="open_close" SortExpression="open_close" />
                    <asp:BoundField DataField="held_by" HeaderText="held_by" SortExpression="held_by" />
                    <asp:BoundField DataField="association" HeaderText="association" SortExpression="association" />
                    <asp:BoundField DataField="lock_by" HeaderText="lock_by" SortExpression="lock_by" />
                </Columns>
                <RowStyle BorderStyle="None" CssClass="row_bg" />
                <HeaderStyle BorderStyle="None" CssClass="gv_header" ForeColor="White" Height="1px" Width="512px" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString3 %>"
                SelectCommand="SELECT * FROM [cust_inbox]"></asp:SqlDataSource>
            <br />
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                    token_no2:
                <asp:Label ID="token_no2Label" runat="server" Text='<%# Eval("token_no2") %>'></asp:Label><br />
                    act_msg:
                <asp:Label ID="act_msgLabel" runat="server" Text='<%# Eval("act_msg") %>'></asp:Label><br />
                    <br />
                </ItemTemplate>
            </asp:DataList>-+&nbsp;
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString4 %>"
            SelectCommand="SELECT * FROM [act_onbox] WHERE ([token_no2] = @token_no2)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="token_no2" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
            <br />
            <br />
            <div style="text-align: left">
                <br />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <rad:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" GridLines="None"
                    OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" OnItemCommand="RadGrid1_ItemCommand" Skin="Ice">
                    <ClientSettings>
                        <Selecting AllowRowSelect="True"></Selecting>
                    </ClientSettings>

                    <MasterTableView DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                        <RowIndicatorColumn Visible="False" DataType="System.String">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </RowIndicatorColumn>

                        <ExpandCollapseColumn Visible="False" Resizable="False" DataType="System.String">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </ExpandCollapseColumn>
                        <Columns>
                            <rad:GridBoundColumn DataField="token_no" DataType="System.Decimal" HeaderText="token_no"
                                SortExpression="token_no" UniqueName="token_no">
                            </rad:GridBoundColumn>
                            <rad:GridBoundColumn DataField="sent_from" DataType="System.String" HeaderText="sent_from"
                                SortExpression="sent_from" UniqueName="sent_from">
                            </rad:GridBoundColumn>
                            <rad:GridBoundColumn DataField="msg_subject" DataType="System.String" HeaderText="msg_subject"
                                SortExpression="msg_subject" UniqueName="msg_subject">
                            </rad:GridBoundColumn>
                            <rad:GridBoundColumn DataField="msg_flag" DataType="System.String" HeaderText="msg_flag"
                                SortExpression="msg_flag" UniqueName="msg_flag">
                            </rad:GridBoundColumn>
                            <rad:GridBoundColumn DataField="img_url" DataType="System.String" HeaderText="img_url"
                                SortExpression="img_url" UniqueName="img_url">
                            </rad:GridBoundColumn>
                        </Columns>

                        <EditFormSettings>
                            <EditColumn DataType="System.String"></EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                </rad:RadGrid>
                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource3">
                    <ItemTemplate>
                        token_no2:
                <asp:Label ID="token_no2Label" runat="server" Text='<%# Eval("token_no2") %>'></asp:Label><br />
                        act_msg:
                <asp:Label ID="act_msgLabel" runat="server" Text='<%# Eval("act_msg") %>'></asp:Label><br />
                        <br />
                    </ItemTemplate>
                </asp:DataList><asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString4 %>"
                    SelectCommand="SELECT * FROM [act_onbox] WHERE ([token_no2] = @token_no2)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadGrid1" Name="token_no2" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                &nbsp;<table>
                    <tr>
                        <td style="width: 100px">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="token_no"
                                DataSourceID="SqlDataSource4">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox2" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                                    <asp:BoundField DataField="token_no" HeaderText="token_no" InsertVisible="False"
                                        ReadOnly="True" SortExpression="token_no" />
                                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                    <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConflictDetection="CompareAllValues"
                                ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" DeleteCommand="DELETE FROM [test_1] WHERE [token_no] = @original_token_no AND [name] = @original_name AND [fname] = @original_fname"
                                InsertCommand="INSERT INTO [test_1] ([name], [fname]) VALUES (@name, @fname)"
                                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [test_1]"
                                UpdateCommand="UPDATE [test_1] SET [name] = @name, [fname] = @fname WHERE [token_no] = @original_token_no AND [name] = @original_name AND [fname] = @original_fname">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_token_no" Type="Int32" />
                                    <asp:Parameter Name="original_name" Type="String" />
                                    <asp:Parameter Name="original_fname" Type="String" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="name" Type="String" />
                                    <asp:Parameter Name="fname" Type="String" />
                                    <asp:Parameter Name="original_token_no" Type="Int32" />
                                    <asp:Parameter Name="original_name" Type="String" />
                                    <asp:Parameter Name="original_fname" Type="String" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="name" Type="String" />
                                    <asp:Parameter Name="fname" Type="String" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Delete" />
                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Button" /></td>
                        <td style="width: 100px">
                            <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource5">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConflictDetection="CompareAllValues"
                                ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" DeleteCommand="DELETE FROM [test_2] WHERE [test2_pk] = @original_test2_pk AND [token_no] = @original_token_no AND [sub1] = @original_sub1 AND [sub2] = @original_sub2 AND [sub3] = @original_sub3"
                                InsertCommand="INSERT INTO [test_2] ([token_no], [sub1], [sub2], [sub3]) VALUES (@token_no, @sub1, @sub2, @sub3)"
                                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [test_2] WHERE ([token_no] = @token_no)"
                                UpdateCommand="UPDATE [test_2] SET [token_no] = @token_no, [sub1] = @sub1, [sub2] = @sub2, [sub3] = @sub3 WHERE [test2_pk] = @original_test2_pk AND [token_no] = @original_token_no AND [sub1] = @original_sub1 AND [sub2] = @original_sub2 AND [sub3] = @original_sub3">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView2" Name="token_no" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="original_test2_pk" Type="Int32" />
                                    <asp:Parameter Name="original_token_no" Type="Int32" />
                                    <asp:Parameter Name="original_sub1" Type="Decimal" />
                                    <asp:Parameter Name="original_sub2" Type="Decimal" />
                                    <asp:Parameter Name="original_sub3" Type="Decimal" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="token_no" Type="Int32" />
                                    <asp:Parameter Name="sub1" Type="Decimal" />
                                    <asp:Parameter Name="sub2" Type="Decimal" />
                                    <asp:Parameter Name="sub3" Type="Decimal" />
                                    <asp:Parameter Name="original_test2_pk" Type="Int32" />
                                    <asp:Parameter Name="original_token_no" Type="Int32" />
                                    <asp:Parameter Name="original_sub1" Type="Decimal" />
                                    <asp:Parameter Name="original_sub2" Type="Decimal" />
                                    <asp:Parameter Name="original_sub3" Type="Decimal" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="token_no" Type="Int32" />
                                    <asp:Parameter Name="sub1" Type="Decimal" />
                                    <asp:Parameter Name="sub2" Type="Decimal" />
                                    <asp:Parameter Name="sub3" Type="Decimal" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td style="width: 100px">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                <asp:ListItem Value="40">40 marks</asp:ListItem>
                                <asp:ListItem Value="20">20 Marks</asp:ListItem>
                                <asp:ListItem Value="10">10 Marks</asp:ListItem>
                            </asp:RadioButtonList>suject 1</td>
                        <td style="width: 100px">Token Number<br />
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                        <td style="width: 100px">subject 2<br />
                            <asp:RadioButton ID="RadioButton1" runat="server" Text="15 marks" />
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="25 marks" /></td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                                <asp:ListItem Value="22">22 marks</asp:ListItem>
                                <asp:ListItem Value="33">33 marks</asp:ListItem>
                            </asp:CheckBoxList></td>
                        <td style="width: 100px">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" /></td>
                        <td style="width: 100px"></td>
                    </tr>
                </table>
                <br />
                &nbsp;
        <br />
            </div>
        </div>
    </form>
</body>
</html>