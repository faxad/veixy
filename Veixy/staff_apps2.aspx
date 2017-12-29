<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_apps2.aspx.cs" Inherits="staff_apps" Title="Untitled Page" EnableEventValidation="false" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

        function setMouseOverColor(element) {
            element.style.cursor = 'hand';
        }

        function IMG2_onclick() {

        }
    </script>

    &nbsp;
    <div style="z-index: 101; left: 1px; width: 112px; position: absolute; top: 56px; height: 379px">
        <asp:Panel ID="Panel1" runat="server" Height="158px" ScrollBars="Vertical" Width="633px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" Width="616px" Height="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" ShowHeader="False" AutoGenerateColumns="False" DataKeyNames="app_no" DataSourceID="SqlDataSource3" Font-Size="Small">
                        <RowStyle Height="5px"></RowStyle>
                        <Columns>
                            <asp:BoundField DataField="app_no" HeaderText="app_no" ReadOnly="True" InsertVisible="False" SortExpression="app_no">
                                <ItemStyle HorizontalAlign="Center" Width="104px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name">
                                <ItemStyle HorizontalAlign="Center" Width="150px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="app_date" HeaderText="app_date" SortExpression="app_date"></asp:BoundField>
                            <asp:BoundField DataField="app_status" HeaderText="app_status" SortExpression="app_status">
                                <ItemStyle HorizontalAlign="Center" Width="125px"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <table style="width: 583px">
                                <tbody>
                                    <tr>
                                        <td style="width: 151px"></td>
                                        <td></td>
                                        <td style="width: 444px"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 151px; height: 19px"></td>
                                        <td style="width: 151px; height: 19px"></td>
                                        <td style="width: 444px; height: 19px">There are no new appointments</td>
                                        <td style="width: 100px; height: 19px"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 151px"></td>
                                        <td></td>
                                        <td style="width: 444px"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </EmptyDataTemplate>

                        <SelectedRowStyle BackColor="WhiteSmoke"></SelectedRowStyle>

                        <HeaderStyle BackColor="SteelBlue" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    </asp:GridView>
                    <div style="z-index: 101; left: 224px; width: 100px; position: absolute; top: 48px; height: 100px">
                        &nbsp;<asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="1" AssociatedUpdatePanelID="UpdatePanel1">
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
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [user_name], [app_date], [app_no], [app_status] FROM [cust_appoint] WHERE (([lock_by] = @lock_by) AND ([app_status] NOT LIKE '%' + @app_status + '%'))">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="none" Name="lock_by" Type="String" />
                            <asp:Parameter DefaultValue="Closed" Name="app_status" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div style="z-index: 101; left: 185px; width: 198px; position: absolute; top: 222px; height: 22px" class="txt_boxx">
                        <table style="width: 318px">
                            <tbody>
                                <tr>
                                    <td style="font-size: small; color: gainsboro; height: 23px" colspan="2">
                                        <asp:Label ID="Label5" runat="server" Width="287px" __designer:wfdid="w111" Text="Select an appointment to view the details"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="TextBox2"
                WatermarkText="Enter staff's ID ">
            </cc1:TextBoxWatermarkExtender>
        </asp:Panel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel2" runat="server" Width="632px" ScrollBars="Vertical" Height="255px">
                    <asp:DataList Style="font-size: small" ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" DataSourceID="SqlDataSource2" OnLoad="DataList1_Load" DataKeyField="app_no">
                        <ItemTemplate>
                            <table style="width: 596px">
                                <tbody>
                                    <tr>
                                        <td style="width: 7px">
                                            <asp:Label ID="Label6" runat="server" Font-Size="Small" __designer:wfdid="w154" Text="Viewing:" ForeColor="OliveDrab" Font-Bold="True"></asp:Label></td>
                                        <td style="font-size: 12pt; width: 7px; color: #000000">
                                            <asp:Label ID="Label2" runat="server" Width="83px" Font-Size="X-Small" __designer:wfdid="w151" Text="All Appointments" ForeColor="DarkGoldenrod" Font-Underline="True" Font-Bold="True"></asp:Label></td>
                                        <td style="width: 254px">
                                            <img style="width: 20px; height: 20px" id="IMG2" onclick="return IMG2_onclick()" src="Images/a_up.jpg" />&nbsp;</td>
                                        <td style="width: 29px">
                                            <asp:Label ID="Label11" runat="server" __designer:dtid="2814749767106743" Font-Size="X-Small" __designer:wfdid="w122" Text="Scheduled:" ForeColor="#333399"></asp:Label></td>
                                        <td style="width: 100px">
                                            <asp:Label ID="Label12" runat="server" __designer:dtid="2814749767106745" Width="123px" Font-Size="X-Small" __designer:wfdid="w123" Text='<%# Eval("app_date") %>' ForeColor="Black"></asp:Label></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="width: 602px">
                                <tbody>
                                    <tr>
                                        <td style="width: 100px">Appointment #:</td>
                                        <td style="width: 100px">
                                            <asp:Label ID="call_ref_noLabel" runat="server" Width="91px" __designer:wfdid="w103" Text='<%# Eval("app_no") %>'></asp:Label></td>
                                        <td style="width: 47px"></td>
                                        <td style="width: 11px">
                                            <asp:Image ID="Image2" runat="server" __designer:wfdid="w104" ImageUrl="~/Images/lok_grey.jpg"></asp:Image>
                                        </td>
                                        <td style="width: 34px">
                                            <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Width="42px" Font-Size="Small" __designer:wfdid="w105" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" CssClass="bar_format">Lock</asp:LinkButton>
                                        </td>
                                        <td style="width: 20px">
                                            <asp:Image ID="Image1" runat="server" __designer:wfdid="w106" ImageUrl="~/Images/delete.jpg"></asp:Image></td>
                                        <td style="width: 58px">
                                            <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" runat="server" Width="14px" Font-Size="Small" __designer:wfdid="w107" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" CssClass="bar_format">Delete</asp:LinkButton></td>
                                        <td style="width: 100px">
                                            <rad:RadDateTimePicker ID="RadDateTimePicker1" __designer:wfdid="w108" Skin Culture="English (United States)" runat="server">
                                                <TimeView Skin=""></TimeView>

                                                <DateInput Skin=""></DateInput>
                                            </rad:RadDateTimePicker>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="width: 600px">
                                <tbody>
                                    <tr>
                                        <td style="width: 118px">Contact #: </td>
                                        <td style="width: 176px">
                                            <asp:TextBox ID="TextBox2" runat="server" __designer:wfdid="w109" Text='<%# Eval("contact_no") %>'></asp:TextBox></td>
                                        <td style="width: 206px"></td>
                                        <td style="width: 86px">
                                            <asp:TextBox ID="TextBox5" runat="server" Width="94px" Height="10px" Font-Size="X-Small" __designer:wfdid="w110" ForeColor="RoyalBlue"></asp:TextBox></td>
                                        <td style="width: 74px">
                                            <asp:LinkButton ID="LinkButton3" OnClick="LinkButton5_Click" runat="server" Width="68px" Font-Size="Small" __designer:wfdid="w111" ForeColor="OliveDrab" Font-Underline="False" Font-Bold="True" CssClass="bar_format">Recommend</asp:LinkButton></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="width: 368px" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="height: 21px">
                                            <asp:Label ID="Label3" runat="server" __designer:wfdid="w112" Text="Description:" ForeColor="#003399"></asp:Label></td>
                                        <td style="width: 100px; height: 21px" align="left">
                                            <asp:Label ID="dmy" runat="server" __designer:wfdid="w113"></asp:Label></td>
                                        <td style="width: 100px; height: 21px" align="left">
                                            <table style="width: 279px" cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 151px">
                                                            <asp:Label ID="Label1" runat="server" Width="59px" __designer:wfdid="w114" Text="Comments:" ForeColor="#003399"></asp:Label></td>
                                                        <td style="width: 100px">
                                                            <asp:LinkButton ID="LinkButton4" OnClick="LinkButton4_Click" runat="server" Width="102px" Font-Size="Small" __designer:wfdid="w115" ForeColor="Brown" Font-Underline="False" Enabled="False">(Click here to add)</asp:LinkButton></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:TextBox ID="TextBox1" runat="server" Width="277px" Height="129px" __designer:wfdid="w116" Text='<%# Eval("app_detail") %>' TextMode="MultiLine" ReadOnly="True"></asp:TextBox></td>
                                        <td style="width: 100px" valign="top"></td>
                                        <td style="width: 100px" valign="top">
                                            <asp:TextBox ID="TextBox3" runat="server" Width="277px" Height="99px" __designer:wfdid="w117" Text='<%# Eval("app_reply") %>' TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                                            <table style="width: 280px">
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Image ID="Image8" runat="server" __designer:wfdid="w118" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                                        <td style="width: 100px">
                                                            <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="45px" Font-Size="Small" __designer:wfdid="w119" ForeColor="OliveDrab" BorderWidth="1px" BackColor="Transparent" BorderStyle="None" Font-Underline="False" Font-Bold="True" Enabled="False">Update</asp:LinkButton></td>
                                                        <td style="width: 494px"></td>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="Label4" runat="server" Width="44px" __designer:wfdid="w120" Text="Status:" ForeColor="#003399"></asp:Label></td>
                                                        <td style="width: 100px">
                                                            <asp:DropDownList ID="DropDownList1" runat="server" Width="103px" __designer:wfdid="w121">
                                                                <asp:ListItem Selected="True">-----</asp:ListItem>
                                                                <asp:ListItem>Pending</asp:ListItem>
                                                                <asp:ListItem>Approved</asp:ListItem>
                                                                <asp:ListItem>Closed</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ItemTemplate>
                    </asp:DataList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [app_no], [app_detail], [contact_no], [app_reply],[app_date] FROM [cust_appoint] WHERE ([app_no] = @app_no)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="app_no" Type="Decimal"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="z-index: 102; left: 273px; width: 100px; position: absolute; top: 141px; height: 100px">
            &nbsp;<asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2"
                DisplayAfter="1">
                <ProgressTemplate>
                    <table>
                        <tbody>
                            <tr>
                                <td style="width: 717px; height: 21px"></td>
                                <td style="width: 56px; height: 21px">
                                    <img src="Images/ajax-loader2.gif" /></td>
                                <td style="width: 100px; height: 21px">
                                    <img id="IMG1" onclick="return IMG1_onclick()" src="Images/still-processing.gif" /></td>
                            </tr>
                        </tbody>
                    </table>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
        <br />
        <br />
    </div>
    <div style="z-index: 102; left: 0px; width: 582px; position: absolute; top: 35px; height: 23px"
        id="DIV1" onclick="return DIV1_onclick()">
        <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; width: 632px; color: white; background-color: steelblue">
            <tr>
                <td style="width: 14px; height: 19px"></td>
                <td style="width: 92px; height: 19px">Appointment #</td>
                <td align="center" style="width: 103px; height: 19px">Request
                    From</td>
                <td align="center" style="width: 159px; height: 19px">Appointment
                    Date</td>
                <td align="center" style="width: 124px; height: 19px">Appointment
                    Status</td>
            </tr>
        </table>
    </div>
</asp:Content>