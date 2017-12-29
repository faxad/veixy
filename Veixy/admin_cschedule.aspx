<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_cschedule.aspx.cs" Inherits="admin_cschedule" Title="Veixy-Create Schedule" EnableEventValidation="false" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="font-size: small; z-index: 103; left: 276px; width: 519px; position: absolute; top: 30px; height: 29px">
        <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="#003399" Text="Displaying schedule from"
            Width="158px"></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="DarkGoldenrod" Width="152px"></asp:Label>
        <asp:Label ID="Label7" runat="server" Font-Size="Small" ForeColor="#003399" Width="14px">to</asp:Label>
        <asp:Label ID="Label8" runat="server" Font-Size="Small" ForeColor="DarkGoldenrod" Width="178px"></asp:Label>
    </div>
    <table border="0" cellspacing="0" style="width: 825px; height: 27px">
        <tr>
            <td style="width: 203px; height: 21px; background-color: white"></td>
            <td style="width: 27px; height: 21px; background-color: white">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/cp_home.jpg"
                    PostBackUrl="~/admin_main.aspx" /></td>
            <td colspan="3" style="height: 21px; background-color: #f5faf1">
                <asp:Label ID="Label14" runat="server" Font-Bold="True" ForeColor="DimGray" Text="Control Panel"
                    Width="82px"></asp:Label>
                <asp:Label ID="Label13" runat="server" Font-Bold="True" ForeColor="LightGray" Text="--- Schedule Manager"
                    Width="235px"></asp:Label></td>
        </tr>
    </table>
    <br />
    <table style="width: 820px; height: 204px">
        <tr>
            <td style="width: 100px; height: 241px" valign="top">
                <table>
                    <tr>
                        <td style="width: 23px">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/i_sign.jpg" /></td>
                        <td style="width: 23px">
                            <asp:Label ID="Label15" runat="server" Font-Size="Small" Style="color: black; font-family: Calibri"
                                Text="Please specify a time span" Width="169px"></asp:Label></td>
                    </tr>
                </table>
                <rad:RadCalendar ID="RadCalendar3" runat="server" DayNameFormat="Short"
                    Font-Names="Arial,Verdana,Tahoma" ForeColor="Black" Skin="Outlook" Style="border-left-color: #ececec; border-bottom-color: #ececec; border-top-color: #ececec; border-right-color: #ececec"
                    UseColumnHeadersAsSelectors="False" Width="264px" BorderColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px" EnableViewState="False" SelectedDate="">
                    <TitleStyle BackColor="SteelBlue" Font-Bold="True" ForeColor="White" />
                </rad:RadCalendar>
                <table style="width: 229px">
                    <tr>
                        <td style="width: 100px">
                            <div style="z-index: 102; left: 464px; width: 100px; position: absolute; top: 118px; height: 100px">
                                &nbsp;<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                                    DisplayAfter="1">
                                    <ProgressTemplate>
                                        <table>
                                            <tr>
                                                <td style="width: 66px; height: 21px"></td>
                                                <td style="width: 56px; height: 21px">
                                                    <img src="Images/ajax-loader2.gif" /></td>
                                                <td style="width: 100px; height: 21px">
                                                    <img src="Images/still-loading.gif" /></td>
                                            </tr>
                                        </table>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                <div style="z-index: 102; left: 168px; width: 100px; position: absolute; top: 181px; height: 100px">
                                    &nbsp;<asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2"
                                        DisplayAfter="1">
                                        <ProgressTemplate>
                                            <table>
                                                <tr>
                                                    <td style="width: 66px; height: 21px"></td>
                                                    <td style="width: 56px; height: 21px">
                                                        <img src="Images/ajax-loader2.gif" /></td>
                                                    <td style="width: 100px; height: 21px">
                                                        <img src="Images/still-loading.gif" /></td>
                                                </tr>
                                            </table>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                            </div>
                            <table style="width: 256px">
                                <tr>
                                    <td style="width: 24px">
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/insert.jpg" /></td>
                                    <td>
                                        <asp:LinkButton ID="LinkButton22" runat="server" CommandName="Update" CssClass="bar_format"
                                            Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="Firebrick"
                                            OnClick="LinkButton22_Click" Width="111px">Display Schedule</asp:LinkButton></td>
                                    <td align="right" style="width: 100px">
                                        <asp:LinkButton ID="LinkButton32" runat="server" CssClass="bar_format" Font-Bold="True"
                                            Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton32_Click"
                                            Width="76px">(Clear Selection)</asp:LinkButton></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 100px; height: 19px;"></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td style="width: 100px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                </table>
            </td>
            <td style="width: 100px; height: 241px; font-size: small;" valign="top">
                <table style="width: 544px">
                    <tr>
                        <td style="width: 485px; font-size: small;">
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="bar_format" Font-Bold="True"
                                Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton2_Click"
                                Width="76px">(Reset Filter)</asp:LinkButton></td>
                        <td style="width: 100px">
                            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("status") %>'>
                                <asp:ListItem Selected="True">Select a status</asp:ListItem>
                                <asp:ListItem>Delay</asp:ListItem>
                                <asp:ListItem>Done</asp:ListItem>
                                <asp:ListItem>Not Possible</asp:ListItem>
                                <asp:ListItem>Not Done</asp:ListItem>
                                <asp:ListItem>Not Checked</asp:ListItem>
                                <asp:ListItem>Processing</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 100px">
                            <asp:LinkButton ID="LinkButton12" runat="server" CommandName="Delete" CssClass="bar_format"
                                Font-Bold="True" Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab"
                                OnClick="LinkButton12_Click1" Width="70px">Apply Filter</asp:LinkButton></td>
                    </tr>
                </table>
                <asp:Panel ID="Panel1" runat="server" Height="219px" ScrollBars="Vertical" Width="549px" Font-Size="Small">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView Style="font-size: small" ID="GridView1" runat="server" Width="532px" Font-Size="Small" Font-Names="Book Antiqua" DataSourceID="SqlDataSource1" DataKeyNames="schedule_id" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="schedule_id" HeaderText="SID" ReadOnly="True" InsertVisible="False" SortExpression="schedule_id">
                                        <HeaderStyle Width="55px" Font-Size="Small"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="staff_id" HeaderText="Staff ID" SortExpression="staff_id">
                                        <HeaderStyle Width="110px" Font-Size="Small"></HeaderStyle>
                                        <ItemStyle Font-Size="Small" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date">
                                        <HeaderStyle Width="190px" Font-Size="Small"></HeaderStyle>
                                        <ItemStyle Font-Size="Small" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="priority" HeaderText="Priority" SortExpression="priority">
                                        <HeaderStyle Width="60px" Font-Size="Small"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status">
                                        <HeaderStyle Width="90px" Font-Size="Small"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="scheduled_by" HeaderText="Scheduled By" SortExpression="scheduled_by">
                                        <HeaderStyle Width="110px" Font-Size="Small"></HeaderStyle>
                                    </asp:BoundField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td style="width: 171px"></td>
                                                <td style="width: 23px">
                                                    <asp:Label ID="Label9" runat="server" Width="149px" ForeColor="Silver" Text="No schedule available"></asp:Label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </EmptyDataTemplate>

                                <SelectedRowStyle BackColor="#F5FAF1"></SelectedRowStyle>

                                <HeaderStyle BackColor="SteelBlue" ForeColor="White" Font-Size="Small"></HeaderStyle>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" UpdateCommand="UPDATE [staff_schedule] SET [staff_id] = @staff_id, [date] = @date, [priority] = @priority, [status] = @status, [scheduled_by] = @scheduled_by WHERE [schedule_id] = @schedule_id" SelectCommand="SELECT [schedule_id], [staff_id], [date], [priority], [status], [scheduled_by] FROM [staff_schedule] WHERE (([date] >= @date) AND ([date] <= @date2))" InsertCommand="INSERT INTO [staff_schedule] ([staff_id], [date], [priority], [status], [scheduled_by]) VALUES (@staff_id, @date, @priority, @status, @scheduled_by)" DeleteCommand="DELETE FROM [staff_schedule] WHERE [schedule_id] = @schedule_id" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                                <DeleteParameters>
                                    <asp:Parameter Name="schedule_id" Type="Decimal" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="staff_id" Type="String" />
                                    <asp:Parameter Name="date" Type="DateTime" />
                                    <asp:Parameter Name="priority" Type="String" />
                                    <asp:Parameter Name="status" Type="String" />
                                    <asp:Parameter Name="scheduled_by" Type="String" />
                                    <asp:Parameter Name="schedule_id" Type="Decimal" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="staff_id" Type="String" />
                                    <asp:Parameter Name="date" Type="DateTime" />
                                    <asp:Parameter Name="priority" Type="String" />
                                    <asp:Parameter Name="status" Type="String" />
                                    <asp:Parameter Name="scheduled_by" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label2" Name="date" PropertyName="Text" Type="DateTime" />
                                    <asp:ControlParameter ControlID="Label8" Name="date2" PropertyName="Text" Type="DateTime" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" UpdateCommand="UPDATE [staff_schedule] SET [staff_id] = @staff_id, [date] = @date, [priority] = @priority, [status] = @status, [scheduled_by] = @scheduled_by WHERE [schedule_id] = @schedule_id" SelectCommand="SELECT [schedule_id], [staff_id], [date], [priority], [status], [scheduled_by] FROM [staff_schedule] WHERE (([date] >= @date) AND ([date] <= @date2)) AND [status]=@status" InsertCommand="INSERT INTO [staff_schedule] ([staff_id], [date], [priority], [status], [scheduled_by]) VALUES (@staff_id, @date, @priority, @status, @scheduled_by)" DeleteCommand="DELETE FROM [staff_schedule] WHERE [schedule_id] = @schedule_id" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label2" PropertyName="Text" Name="date" Type="DateTime"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="Label8" PropertyName="Text" Name="date2" Type="DateTime"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="status"></asp:ControlParameter>
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="schedule_id" Type="Decimal"></asp:Parameter>
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="staff_id" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="date" Type="DateTime"></asp:Parameter>
                                    <asp:Parameter Name="priority" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="status" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="scheduled_by" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="schedule_id" Type="Decimal"></asp:Parameter>
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="staff_id" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="date" Type="DateTime"></asp:Parameter>
                                    <asp:Parameter Name="priority" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="status" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="scheduled_by" Type="String"></asp:Parameter>
                                </InsertParameters>
                            </asp:SqlDataSource>
                            &nbsp;&nbsp;
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
                <div style="z-index: 104; left: 358px; width: 100px; position: absolute; top: 277px; height: 20px">
                    <table>
                        <tr>
                            <td style="width: 61px">
                                <asp:Label ID="Label101" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="DimGray"
                                    Text="Schedule Detail" Width="102px"></asp:Label></td>
                            <td style="width: 54px">
                                <img src="Images/arrow_down.jpg" style="width: 19px; height: 12px" /></td>
                        </tr>
                    </table>
                </div>
                <div style="z-index: 105; left: 345px; width: 9px; position: absolute; top: 302px; height: 100px">
                    <img src="Images/v_mid.jpg" style="height: 205px" />
                </div>
                &nbsp;</td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:FormView ID="FormView1" runat="server" Width="404px" DataKeyNames="schedule_id" DataSourceID="SqlDataSource2" DefaultMode="Edit" OnItemCreated="FormView1_ItemCreated" OnDataBound="FormView1_DataBound" OnPageIndexChanging="FormView1_PageIndexChanging">
                <EditItemTemplate>
                    <table style="font-size: small; width: 960px">
                        <tbody>
                            <tr>
                                <td style="width: 261755px; color: #333399; height: 18px"></td>
                                <td style="width: 100px; color: #333399; height: 18px">.</td>
                                <td style="width: 197px; height: 18px"></td>
                                <td style="width: 100px; color: #333399; height: 18px"></td>
                                <td style="width: 100px" rowspan="1"></td>
                            </tr>
                            <tr>
                                <td style="width: 261755px; color: #333399; height: 18px"></td>
                                <td style="width: 100px; color: #333399; height: 18px">Schedule ID:</td>
                                <td style="width: 197px; height: 18px">
                                    <asp:Label ID="user_idLabel1" runat="server" Text='<%# Eval("schedule_id") %>' __designer:wfdid="w421" OnInit="user_idLabel1_Init"></asp:Label></td>
                                <td style="width: 100px; color: #333399; height: 18px"></td>
                                <td style="width: 100px" rowspan="2">
                                    <asp:TextBox ID="f_nameTextBox" runat="server" __designer:wfdid="w422" Visible="False">11/11/2010 11:11:11 AM</asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 261755px; color: #333399"></td>
                                <td style="width: 100px; color: #333399">Schedule By:</td>
                                <td style="width: 197px">
                                    <asp:TextBox ID="user_passTextBox" runat="server" Text='<%# Bind("scheduled_by") %>' __designer:wfdid="w87" ReadOnly="True"></asp:TextBox></td>
                                <td style="width: 100px; color: #333399"></td>
                            </tr>
                            <tr>
                                <td style="width: 261755px; color: #333399"></td>
                                <td style="width: 100px; color: #333399">Date:</td>
                                <td style="width: 197px">
                                    <asp:Label ID="Label11" runat="server" Text="Scheduled:" ForeColor="#333399" Font-Size="X-Small" __designer:wfdid="w424"></asp:Label>
                                    <asp:Label ID="Label12" runat="server" Width="123px" Text='<%# Eval("date") %>' ForeColor="Black" Font-Size="X-Small" __designer:wfdid="w425" OnInit="Label12_Init"></asp:Label>
                                    <rad:RadDateTimePicker ID="RadDateTimePicker2" __designer:wfdid="w426" runat="server" Culture="English (United States)" Skin>
                                        <TimeView Skin=""></TimeView>

                                        <DateInput Skin=""></DateInput>
                                    </rad:RadDateTimePicker>
                                </td>
                                <td style="width: 100px; color: #333399">Detail:<asp:LinkButton ID="LinkButton4" OnClick="LinkButton4_Click" runat="server" Width="62px" ForeColor="Brown" Font-Underline="False" Font-Size="X-Small" __designer:wfdid="w427">(Edit Detail)</asp:LinkButton></td>
                                <td style="width: 100px" rowspan="2">
                                    <asp:TextBox ID="email_addTextBox" runat="server" Width="236px" Text='<%# Bind("task_detail") %>' Height="75px" __designer:wfdid="w428" TextMode="MultiLine" ReadOnly="True"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 261755px; color: #333399; height: 24px"></td>
                                <td style="width: 100px; color: #333399; height: 24px">Priority:</td>
                                <td style="width: 197px; height: 24px">
                                    <asp:DropDownList ID="DropDownList33" runat="server" SelectedValue='<%# Bind("priority") %>' __designer:wfdid="w429">
                                        <asp:ListItem>Low</asp:ListItem>
                                        <asp:ListItem>Normal</asp:ListItem>
                                        <asp:ListItem>High</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td style="width: 100px; color: #333399; height: 24px"></td>
                            </tr>
                            <tr>
                                <td style="width: 261755px; color: #333399"></td>
                                <td style="width: 100px; color: #333399">Status:<asp:LinkButton ID="LinkButton2" runat="server" Width="89px" ForeColor="OliveDrab" Font-Underline="False" Font-Size="Small" Font-Bold="True" CssClass="bar_format" __designer:wfdid="w430"></asp:LinkButton></td>
                                <td style="width: 197px">
                                    <asp:DropDownList ID="DropDownList11" runat="server" SelectedValue='<%# Bind("status") %>' __designer:wfdid="w431">
                                        <asp:ListItem Selected="True">Delay</asp:ListItem>
                                        <asp:ListItem>Done</asp:ListItem>
                                        <asp:ListItem>Not Possible</asp:ListItem>
                                        <asp:ListItem>Not Done</asp:ListItem>
                                        <asp:ListItem>Not Checked</asp:ListItem>
                                        <asp:ListItem>Processing</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td style="width: 100px; color: #333399">Comments:<asp:LinkButton ID="LinkButton3" OnClick="LinkButton3_Click" runat="server" Width="75px" ForeColor="Brown" Font-Underline="False" Font-Size="X-Small" __designer:wfdid="w432">(Edit Comments)</asp:LinkButton></td>
                                <td style="width: 100px" rowspan="2">
                                    <asp:TextBox ID="user_contact_noTextBox" runat="server" Width="236px" Text='<%# Bind("staff_comments") %>' Height="75px" __designer:wfdid="w433" TextMode="MultiLine" ReadOnly="True"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 261755px; color: #333399; height: 20px"></td>
                                <td style="width: 100px; color: #333399; height: 20px"></td>
                                <td valign="top" colspan="2" rowspan="2">
                                    <table style="width: 155px">
                                        <tbody>
                                            <tr>
                                                <td style="width: 27px; height: 20px">
                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/delete.jpg" __designer:wfdid="w434"></asp:Image></td>
                                                <td style="width: 110px; height: 20px">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" Width="39px" ForeColor="OliveDrab" Font-Underline="False" Font-Size="Small" Font-Bold="True" CssClass="bar_format" CommandName="Delete" __designer:wfdid="w435">Delete</asp:LinkButton></td>
                                                <td style="width: 27px; height: 20px">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/send_but.jpg" __designer:wfdid="w436"></asp:Image></td>
                                                <td style="width: 100px; height: 20px">
                                                    <asp:LinkButton ID="LinkButton15" OnClick="LinkButton15_Click" runat="server" Width="39px" ForeColor="OliveDrab" Font-Underline="False" Font-Size="Small" Font-Bold="True" CssClass="bar_format" __designer:wfdid="w437">Update</asp:LinkButton></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" __designer:wfdid="w438" TargetControlID="f_nameTextBox" PopupPosition="TopLeft">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 261755px; color: #333399"></td>
                                <td style="width: 100px; color: #333399"></td>
                                <td style="width: 100px"></td>
                            </tr>
                        </tbody>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    user_id:
            <asp:TextBox ID="user_idTextBox" runat="server" Text='<%# Bind("user_id") %>'>
            </asp:TextBox><br />
                    user_pass:
            <asp:TextBox ID="user_passTextBox" runat="server" Text='<%# Bind("user_pass") %>'>
            </asp:TextBox><br />
                    user_contact_no:
            <asp:TextBox ID="user_contact_noTextBox" runat="server" Text='<%# Bind("user_contact_no") %>'>
            </asp:TextBox><br />
                    f_name:
            <asp:TextBox ID="f_nameTextBox" runat="server" Text='<%# Bind("f_name") %>'>
            </asp:TextBox><br />
                    l_name:
            <asp:TextBox ID="l_nameTextBox" runat="server" Text='<%# Bind("l_name") %>'>
            </asp:TextBox><br />
                    user_contact_no2:
            <asp:TextBox ID="user_contact_no2TextBox" runat="server" Text='<%# Bind("user_contact_no2") %>'>
            </asp:TextBox><br />
                    dob:
            <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>'>
            </asp:TextBox><br />
                    country:
            <asp:TextBox ID="countryTextBox" runat="server" Text='<%# Bind("country") %>'>
            </asp:TextBox><br />
                    city:
            <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>'>
            </asp:TextBox><br />
                    email_add:
            <asp:TextBox ID="email_addTextBox" runat="server" Text='<%# Bind("email_add") %>'>
            </asp:TextBox><br />
                    postal_address:
            <asp:TextBox ID="postal_addressTextBox" runat="server" Text='<%# Bind("postal_address") %>'>
            </asp:TextBox><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert">
                    </asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel">
                    </asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    user_id:
                    <asp:Label ID="user_idLabel" runat="server" Text='<%# Eval("user_id") %>' __designer:wfdid="w407"></asp:Label><br />
                    user_pass:
                    <asp:Label ID="user_passLabel" runat="server" Text='<%# Bind("user_pass") %>' __designer:wfdid="w408"></asp:Label><br />
                    user_contact_no:
                    <asp:Label ID="user_contact_noLabel" runat="server" Text='<%# Bind("user_contact_no") %>' __designer:wfdid="w409"></asp:Label><br />
                    f_name:
                    <asp:Label ID="f_nameLabel" runat="server" Text='<%# Bind("f_name") %>' __designer:wfdid="w410"></asp:Label><br />
                    l_name:
                    <asp:Label ID="l_nameLabel" runat="server" Text='<%# Bind("l_name") %>' __designer:wfdid="w411"></asp:Label><br />
                    user_contact_no2:
                    <asp:Label ID="user_contact_no2Label" runat="server" Text='<%# Bind("user_contact_no2") %>' __designer:wfdid="w412"></asp:Label><br />
                    dob:
                    <asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob") %>' __designer:wfdid="w413"></asp:Label><br />
                    country:
                    <asp:Label ID="countryLabel" runat="server" Text='<%# Bind("country") %>' __designer:wfdid="w414"></asp:Label><br />
                    city:
                    <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("city") %>' __designer:wfdid="w415"></asp:Label><br />
                    email_add:
                    <asp:Label ID="email_addLabel" runat="server" Text='<%# Bind("email_add") %>' __designer:wfdid="w416"></asp:Label><br />
                    postal_address:
                    <asp:Label ID="postal_addressLabel" runat="server" Text='<%# Bind("postal_address") %>' __designer:wfdid="w417"></asp:Label><br />
                    <asp:LinkButton ID="EditButton" runat="server" Text="Edit" CommandName="Edit" __designer:wfdid="w418" CausesValidation="False"></asp:LinkButton>
                    <asp:LinkButton ID="DeleteButton" runat="server" Text="Delete" CommandName="Delete" __designer:wfdid="w419" CausesValidation="False"></asp:LinkButton>
                    <asp:LinkButton ID="NewButton" runat="server" Text="New" CommandName="New" __designer:wfdid="w420" CausesValidation="False"></asp:LinkButton>
                </ItemTemplate>
            </asp:FormView>
            &nbsp;
            <div style="z-index: 101; left: 17px; width: 100px; position: absolute; top: 254px; height: 100px">
                <table>
                    <tbody>
                        <tr>
                            <td style="width: 100px"></td>
                            <td style="width: 61px">
                                <asp:Label ID="Label10" runat="server" Width="102px" Text="Create Schedule" ForeColor="DimGray" Font-Size="Small" Font-Bold="True" __designer:wfdid="w323"></asp:Label></td>
                            <td style="width: 54px">
                                <img style="width: 19px; height: 12px" src="Images/arrow_down.jpg" /></td>
                            <td style="width: 100px"></td>
                        </tr>
                        <tr>
                            <td style="width: 100px"></td>
                            <td style="width: 61px">
                                <asp:Label ID="Label3" runat="server" Width="81px" Text="Date & Time:" ForeColor="#003399" Font-Size="Small" __designer:wfdid="w324"></asp:Label>
                            </td>
                            <td style="width: 54px">
                                <rad:RadDateTimePicker ID="RadDateTimePicker1" __designer:wfdid="w325" runat="server"></rad:RadDateTimePicker>
                            </td>
                            <td style="width: 100px"></td>
                        </tr>
                        <tr>
                            <td style="width: 100px"></td>
                            <td style="width: 61px">
                                <asp:Label ID="Label4" runat="server" Width="86px" Text="Schedule For:" ForeColor="#003399" Font-Size="Small" __designer:wfdid="w326"></asp:Label>
                            </td>
                            <td style="width: 54px">
                                <asp:DropDownList ID="DropDownList2" runat="server" Width="113px" DataSourceID="SqlDataSource11" __designer:wfdid="w327" DataValueField="staff_id" DataTextField="staff_id"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource11" runat="server" SelectCommand="SELECT [staff_id] FROM [staff_info]" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" __designer:wfdid="w328"></asp:SqlDataSource>
                            </td>
                            <td style="width: 100px"></td>
                        </tr>
                        <tr>
                            <td style="width: 100px"></td>
                            <td style="width: 61px">
                                <asp:Label ID="Label5" runat="server" Width="86px" Text="Priority:" ForeColor="#003399" Font-Size="Small" __designer:wfdid="w329"></asp:Label>
                            </td>
                            <td style="width: 54px" align="right">
                                <asp:DropDownList ID="DropDownList3" runat="server" __designer:wfdid="w330">
                                    <asp:ListItem>Low</asp:ListItem>
                                    <asp:ListItem Selected="True">Normal</asp:ListItem>
                                    <asp:ListItem>High</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width: 100px"></td>
                        </tr>
                    </tbody>
                </table>
                <table style="width: 314px">
                    <tbody>
                        <tr>
                            <td style="width: 212px">
                                <asp:Label ID="Label6" runat="server" Width="70px" Text="Task Detail:" ForeColor="#003399" Font-Size="Small" __designer:wfdid="w331"></asp:Label></td>
                            <td style="width: 16px">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/send_but.jpg" __designer:wfdid="w332"></asp:Image></td>
                            <td style="width: 24px">
                                <asp:LinkButton ID="LinkButton14" OnClick="LinkButton14_Click" runat="server" Width="100px" ForeColor="OliveDrab" Font-Underline="False" Font-Size="Small" Font-Bold="True" CssClass="bar_format" CommandName="Update" __designer:wfdid="w333">Create Schedule</asp:LinkButton></td>
                        </tr>
                    </tbody>
                </table>
                <table>
                    <tbody>
                        <tr>
                            <td style="width: 100px; height: 119px">
                                <asp:TextBox ID="TextBox3" runat="server" Width="301px" Height="131px" __designer:wfdid="w334" TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            &nbsp;&nbsp;
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        DeleteCommand="DELETE FROM [staff_schedule] WHERE [schedule_id] = @schedule_id" InsertCommand="INSERT INTO [staff_schedule] ([staff_id], [date], [priority], [status], [task_detail], [staff_comments], [created_on]) VALUES (@staff_id, @date, @priority, @status, @task_detail, @staff_comments, @created_on)"
        SelectCommand="SELECT [schedule_id], [staff_id], [date], [priority], [status], [task_detail], [staff_comments], [created_on],[scheduled_by] FROM [staff_schedule] WHERE ([schedule_id] = @schedule_id)" UpdateCommand="UPDATE [staff_schedule] SET [staff_id] = @staff_id, [date] = @date, [priority] = @priority, [status] = @status, [task_detail] = @task_detail, [staff_comments] = @staff_comments, [created_on] = @created_on WHERE [schedule_id] = @schedule_id">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="schedule_id" PropertyName="SelectedValue"
                Type="Decimal" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="schedule_id" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="staff_id" Type="String" />
            <asp:Parameter Name="date" Type="DateTime" />
            <asp:Parameter Name="priority" Type="String" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="task_detail" Type="String" />
            <asp:Parameter Name="staff_comments" Type="String" />
            <asp:Parameter Name="created_on" Type="DateTime" />
            <asp:Parameter Name="schedule_id" Type="Decimal" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="staff_id" Type="String" />
            <asp:Parameter Name="date" Type="DateTime" />
            <asp:Parameter Name="priority" Type="String" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="task_detail" Type="String" />
            <asp:Parameter Name="staff_comments" Type="String" />
            <asp:Parameter Name="created_on" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>