<%@ Page Language="C#" MasterPageFile="~/user_mp.master" AutoEventWireup="true" CodeFile="user_apps.aspx.cs" Inherits="user_apps" Title="Veixy-Appointments" EnableEventValidation="false" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>

    &nbsp;
    <div style="z-index: 101; left: 1px; width: 112px; position: absolute; top: 56px; height: 379px">
        <asp:Panel ID="Panel1" runat="server" Height="154px" ScrollBars="Vertical" Width="597px">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" Width="580px" Height="1px" __designer:wfdid="w1073" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" ShowHeader="False" AutoGenerateColumns="False" DataKeyNames="app_no" DataSourceID="SqlDataSource1" Font-Size="Small">
                        <RowStyle Height="5px"></RowStyle>
                        <Columns>
                            <asp:BoundField DataField="app_no" HeaderText="app_no" ReadOnly="True" InsertVisible="False" SortExpression="app_no">
                                <ItemStyle HorizontalAlign="Center" Width="104px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="lock_by" HeaderText="lock_by" SortExpression="lock_by">
                                <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="app_date" HeaderText="app_date" SortExpression="app_date">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="app_status" HeaderText="app_status" SortExpression="app_status">
                                <ItemStyle HorizontalAlign="Center" Width="125px"></ItemStyle>
                            </asp:BoundField>
                        </Columns>

                        <SelectedRowStyle BackColor="#F5FAF1"></SelectedRowStyle>

                        <HeaderStyle BackColor="SteelBlue" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    </asp:GridView>
                    &nbsp;&nbsp;
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT [lock_by], [app_date], [app_no], [app_status] FROM [cust_appoint] WHERE [user_name] = @user_name">
                <SelectParameters>
                    <asp:QueryStringParameter Name="user_name" QueryStringField="user_query" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;
            <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            </asp:ScriptManagerProxy>
            <div style="z-index: 102; left: 207px; width: 100px; position: absolute; top: 64px; height: 100px">
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
            </div>
        </asp:Panel>
        <div style="z-index: 102; left: 5px; width: 1px; position: absolute; top: 182px; height: 169px">
            &nbsp;<br />
            &nbsp;
        </div>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel2" runat="server" Width="597px" ScrollBars="Vertical" Height="253px">
                    <asp:DataList Style="font-size: small" ID="DataList1" runat="server" DataSourceID="SqlDataSource2" DataKeyField="app_no">
                        <ItemTemplate>
                            <table style="width: 1px; height: 72px" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="height: 26px"></td>
                                        <td style="width: 84px; height: 26px"></td>
                                        <td style="width: 83px; height: 26px">
                                            <asp:Label ID="Label2" runat="server" Width="76px" __designer:wfdid="w1"></asp:Label></td>
                                        <td style="width: 123px; height: 26px">
                                            <asp:Label ID="Label5" runat="server" Width="39px" __designer:wfdid="w2" Text=" Date/Time" ForeColor="#003399"></asp:Label></td>
                                        <td style="width: 55px; height: 26px"></td>
                                        <td style="width: 193px; height: 26px" colspan="2">
                                            <rad:RadDateTimePicker ID="RadDateTimePicker1" __designer:wfdid="w3" ForeColor="Gray" runat="server" Culture="English (United States)" Skin>
                                                <TimeView ForeColor="Black" BackColor="WhiteSmoke" BorderColor="Silver" Skin="">
                                                    <AlternatingTimeStyle BackColor="WhiteSmoke"></AlternatingTimeStyle>
                                                </TimeView>

                                                <DateInput Skin=""></DateInput>

                                                <Calendar DayNameFormat="FirstTwoLetters" DefaultCellPadding="1" DefaultCellSpacing="1" BackColor="Gainsboro" ForeColor="OliveDrab">
                                                    <CalendarTableStyle BackColor="WhiteSmoke" Font-Size="Medium" ForeColor="DarkOliveGreen"></CalendarTableStyle>

                                                    <OtherMonthDayStyle BackColor="WhiteSmoke"></OtherMonthDayStyle>

                                                    <FastNavigationStyle BackColor="WhiteSmoke"></FastNavigationStyle>
                                                </Calendar>
                                            </rad:RadDateTimePicker>
                                        </td>
                                        <td style="width: 193px; height: 26px" colspan="1"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 22px">Appointment&nbsp;#: </td>
                                        <td style="width: 84px; height: 22px">
                                            <asp:Label ID="call_ref_noLabel" runat="server" Width="87px" __designer:wfdid="w4" Text='<%# Eval("app_no") %>'></asp:Label></td>
                                        <td style="width: 83px; height: 22px"></td>
                                        <td style="width: 123px; height: 22px"></td>
                                        <td style="width: 55px; height: 22px"></td>
                                        <td style="height: 22px; background-color: #f5faf1" colspan="3">Enter recommended staff's ID</td>
                                    </tr>
                                    <tr>
                                        <td>Contact #:</td>
                                        <td style="width: 84px">
                                            <asp:TextBox ID="TextBox5" runat="server" Width="103px" __designer:wfdid="w5" Text='<%# Eval("contact_no") %>'></asp:TextBox></td>
                                        <td style="width: 83px" align="center"></td>
                                        <td style="width: 123px" align="left" colspan="1"></td>
                                        <td style="width: 55px" align="right">&nbsp; </td>
                                        <td style="width: 193px; height: 22px; background-color: #f5faf1" colspan="2">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:TextBox ID="TextBox2" runat="server" Width="94px" Height="10px" Font-Size="X-Small" __designer:wfdid="w6" ForeColor="RoyalBlue"></asp:TextBox></td>
                                                        <td style="width: 100px">
                                                            <asp:LinkButton ID="LinkButton5" OnClick="LinkButton5_Click" runat="server" Width="77px" Font-Size="Small" __designer:wfdid="w7" ForeColor="OliveDrab" Font-Bold="True" Font-Underline="False" CssClass="bar_format">Recommend</asp:LinkButton></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td style="width: 193px; height: 22px; background-color: #f5faf1" colspan="1"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 89px">
                                            <asp:Label ID="Label3" runat="server" __designer:wfdid="w8" Text="Description:" ForeColor="#003399"></asp:Label>
                                        </td>
                                        <td style="width: 100px">
                                            <table style="width: 279px" cellspacing="0" cellpadding="0" border="0" __designer:dtid="562949953421402">
                                                <tbody>
                                                    <tr __designer:dtid="562949953421403">
                                                        <td style="width: 188px" __designer:dtid="562949953421404">
                                                            <asp:Label ID="Label1" runat="server" __designer:dtid="562949953421405" Width="59px" __designer:wfdid="w9" Text="Comments:" ForeColor="#003399"></asp:Label></td>
                                                        <td style="width: 100px" __designer:dtid="562949953421406">
                                                            <asp:LinkButton ID="LinkButton4" OnClick="LinkButton4_Click" runat="server" __designer:dtid="562949953421407" Width="102px" Font-Size="Small" __designer:wfdid="w10" ForeColor="Brown" Font-Underline="False">(Click here to add)</asp:LinkButton></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 89px; height: 180px" valign="top">
                                            <asp:TextBox ID="TextBox1" runat="server" Width="270px" Height="151px" __designer:wfdid="w11" Text='<%# Eval("app_detail") %>' TextMode="MultiLine" ReadOnly="True"></asp:TextBox></td>
                                        <td style="width: 100px; height: 180px" valign="top">
                                            <asp:TextBox ID="TextBox3" runat="server" Width="277px" Height="79px" __designer:wfdid="w12" Text='<%# Eval("app_reply") %>' TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                                            <table style="width: 277px">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label4" runat="server" Width="42px" __designer:wfdid="w13" Text="Status:" ForeColor="#003399"></asp:Label></td>
                                                        <td style="width: 192px">&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Width="97px" __designer:wfdid="w14">
                                                            <asp:ListItem Selected="True">-----</asp:ListItem>
                                                            <asp:ListItem>Pending</asp:ListItem>
                                                            <asp:ListItem>Approved</asp:ListItem>
                                                            <asp:ListItem>Closed</asp:ListItem>
                                                        </asp:DropDownList></td>
                                                        <td style="width: 44px">
                                                            <asp:Label ID="status" runat="server" Width="1px" __designer:wfdid="w15" ForeColor="#003399"></asp:Label></td>
                                                        <td style="width: 19px"></td>
                                                        <td style="width: 100px"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="Image3" runat="server" __designer:wfdid="w16" ImageUrl="~/Images/reply_pic.jpg"></asp:Image></td>
                                                        <td style="width: 192px">
                                                            <asp:LinkButton ID="LinkButton3" OnClick="LinkButton3_Click" runat="server" Width="97px" Font-Size="Small" __designer:wfdid="w17" ForeColor="DarkRed" Font-Bold="True" Font-Underline="False" CssClass="bar_format">New Appointment</asp:LinkButton>
                                                        </td>
                                                        <td style="width: 44px">
                                                            <asp:Image ID="Image1" runat="server" __designer:wfdid="w18" ImageUrl="~/Images/delete.jpg"></asp:Image></td>
                                                        <td style="width: 19px">
                                                            <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" runat="server" Width="13px" Font-Size="Small" __designer:wfdid="w19" ForeColor="OliveDrab" Font-Bold="True" Font-Underline="False" CssClass="bar_format">Delete</asp:LinkButton></td>
                                                        <td style="width: 100px"></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 21px">
                                                            <asp:Image ID="Image2" runat="server" __designer:wfdid="w20" ImageUrl="~/Images/lok_grey.jpg"></asp:Image></td>
                                                        <td style="width: 192px; height: 21px">
                                                            <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Width="38px" Font-Size="Small" __designer:wfdid="w21" ForeColor="OliveDrab" Font-Bold="True" Font-Underline="False" CssClass="bar_format">Lock</asp:LinkButton></td>
                                                        <td style="width: 44px; height: 21px">
                                                            <asp:Image ID="Image8" runat="server" __designer:wfdid="w22" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                                        <td style="width: 19px; height: 21px">
                                                            <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="45px" Font-Size="Small" __designer:wfdid="w23" ForeColor="OliveDrab" BorderWidth="1px" BackColor="Transparent" Font-Bold="True" BorderStyle="None" Font-Underline="False">Update</asp:LinkButton></td>
                                                        <td style="width: 100px; height: 21px"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <div style="z-index: 101; left: 179px; width: 198px; position: absolute; top: 222px; height: 22px" class="txt_boxx" __designer:dtid="844424930131981">
                        <table style="width: 318px" __designer:dtid="844424930131982">
                            <tbody>
                                <tr __designer:dtid="844424930131983">
                                    <td style="font-size: small; color: gainsboro; height: 23px" colspan="2" __designer:dtid="844424930131984">
                                        <asp:Label ID="Label7" runat="server" __designer:dtid="844424930131985" Width="287px" __designer:wfdid="w4" Text="Select an appointment to view the details"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT [app_no], [app_detail], [contact_no], [app_reply],[app_date] FROM [cust_appoint] WHERE ([app_no] = @app_no)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="app_no" Type="Decimal"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="Panel3" runat="server" Width="585px" Height="146px">
                            <table style="font-size: small; width: 278px">
                                <tbody>
                                    <tr>
                                        <td style="width: 129px"><strong style="color: darkgray">Create Appointment</strong></td>
                                        <td style="width: 131px"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="font-size: small">
                                <tbody>
                                    <tr>
                                        <td style="width: 44px">
                                            <asp:Label ID="Label5" runat="server" Width="67px" __designer:wfdid="w119" Text="Date/Time:" ForeColor="#003399"></asp:Label>
                                        </td>
                                        <td style="width: 100px">&nbsp;&nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 44px">
                                            <rad:RadDateTimePicker ID="RadDateTimePicker2" __designer:wfdid="w49" runat="server"></rad:RadDateTimePicker>
                                        </td>
                                        <td style="width: 100px"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="font-size: small">
                                <tbody>
                                    <tr>
                                        <td style="font-size: small; width: 65px">Contact #:</td>
                                        <td style="width: 206px">
                                            <asp:TextBox ID="TextBox22" runat="server" Width="101px"></asp:TextBox></td>
                                        <td style="width: 40px">
                                            <asp:Label ID="Label4" runat="server" Width="52px" Text="Status:" ForeColor="#003399"></asp:Label></td>
                                        <td style="width: 100px">
                                            <asp:DropDownList ID="DropDownList11" runat="server" Width="103px" Enabled="False">
                                                <asp:ListItem>-----</asp:ListItem>
                                                <asp:ListItem Selected="True">Pending</asp:ListItem>
                                                <asp:ListItem>Approved</asp:ListItem>
                                                <asp:ListItem>Closed</asp:ListItem>
                                            </asp:DropDownList></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width: 148px">
                                            <asp:Label ID="Label3" runat="server" Font-Size="Small" Text="Description:" ForeColor="DarkGray"></asp:Label></td>
                                        <td style="width: 276px" align="right">
                                            <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                        <td style="width: 56px">
                                            <asp:LinkButton ID="LinkButton17" OnClick="LinkButton17_Click" runat="server" Width="96px" Font-Size="Small" ForeColor="OliveDrab" BorderWidth="1px" BackColor="Transparent" Font-Bold="True" BorderStyle="None" Font-Underline="False">Create Schedule</asp:LinkButton></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="font-size: small" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="height: 132px" valign="top" colspan="3">
                                            <asp:TextBox ID="TextBox11" runat="server" Width="528px" Height="130px" Text='<%# Eval("app_detail") %>' TextMode="MultiLine"></asp:TextBox>&nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div style="z-index: 102; left: 3px; width: 582px; position: absolute; top: 36px; height: 23px">
        <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; color: white; background-color: steelblue"
            width="597">
            <tr>
                <td style="width: 14px; height: 19px"></td>
                <td style="width: 82px; height: 19px">Appointment #</td>
                <td align="center" style="width: 86px; height: 19px">Locked By</td>
                <td align="center" style="width: 159px; height: 19px">Appointment
                    Date</td>
                <td align="center" style="width: 124px; height: 19px">Appointment
                    Status</td>
            </tr>
        </table>
    </div>
</asp:Content>