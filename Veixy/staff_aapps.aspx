<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_aapps.aspx.cs" Inherits="staff_aapps" Title="Veixy-Locked Appointments" EnableEventValidation="false" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

function setMouseOverColor(element)
{
    element.style.cursor='hand';
}

function IMG2_onclick() {

}
    </script>

    &nbsp;
    <div style="z-index: 101; left: 1px; width: 112px; position: absolute; top: 56px; height: 379px">
        <asp:Panel ID="Panel1" runat="server" Height="158px" ScrollBars="Vertical" Width="633px">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="app_no"
                DataSourceID="SqlDataSource4" Font-Size="Small" Height="1px" OnRowDataBound="GridView1_RowDataBound"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowHeader="False" Width="616px">
                <RowStyle Height="5px" />
                <Columns>
                    <asp:BoundField DataField="app_no" HeaderText="app_no" InsertVisible="False" ReadOnly="True"
                        SortExpression="app_no">
                        <ItemStyle HorizontalAlign="Center" Width="104px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name">
                        <ItemStyle HorizontalAlign="Center" Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="app_date" HeaderText="app_date" SortExpression="app_date">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="app_status" HeaderText="app_status" SortExpression="app_status">
                        <ItemStyle ForeColor="SteelBlue" HorizontalAlign="Center" Width="125px" />
                    </asp:BoundField>
                </Columns>
                <EmptyDataTemplate>
                    <table style="width: 583px">
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
                    </table>
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="WhiteSmoke" />
                <HeaderStyle BackColor="SteelBlue" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT [user_name], [app_date], [app_no], [app_status] FROM [cust_appoint] WHERE (([lock_by] = @lock_by) AND ([app_status] NOT LIKE '%' + @app_status + '%')) ORDER BY app_no ASC">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="lock_by" SessionField="user_session"
                        Type="String" />
                    <asp:Parameter DefaultValue="Closed" Name="app_status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="txt_boxx" style="z-index: 101; left: 185px; width: 198px; position: absolute; top: 222px; height: 22px">
                <table style="width: 318px">
                    <tr>
                        <td colspan="2" style="font-size: small; color: gainsboro; height: 23px">
                            <asp:Label ID="Label5" runat="server" Text="Select an appointment to view the details"
                                Width="287px"></asp:Label></td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="app_no" DataSourceID="SqlDataSource2"
            OnLoad="DataList1_Load" OnSelectedIndexChanged="DataList1_SelectedIndexChanged"
            Style="font-size: small" OnItemDataBound="DataList1_ItemDataBound">
            <ItemTemplate>
                <table style="width: 598px">
                    <tr>
                        <td style="width: 7px; height: 25px">&nbsp;<asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="OliveDrab"
                            Text="Viewing:"></asp:Label></td>
                        <td style="font-size: 12pt; width: 77px; color: #000000; height: 25px">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Small" Font-Underline="True"
                                ForeColor="DarkGoldenrod" Text="Locked Appointments" Width="101px"></asp:Label></td>
                        <td style="width: 394px; height: 25px">
                            <img id="IMG2" onclick="return IMG2_onclick()" src="Images/a_up.jpg" style="width: 20px; height: 20px" />&nbsp;</td>
                        <td style="width: 28px; height: 25px">
                            <asp:Label ID="Label11" runat="server" Font-Size="X-Small" ForeColor="#333399" Text="Scheduled:"></asp:Label></td>
                        <td style="width: 100px; height: 25px">
                            <asp:Label ID="Label12" runat="server" Font-Size="X-Small" ForeColor="Black" Text='<%# Eval("app_date") %>'
                                Width="123px"></asp:Label></td>
                    </tr>
                </table>
                <table style="width: 602px">
                    <tr>
                        <td style="width: 100px">Appointment #:</td>
                        <td style="width: 100px">
                            <asp:Label ID="call_ref_noLabel" runat="server" Text='<%# Eval("app_no") %>' Width="91px"></asp:Label></td>
                        <td style="width: 47px"></td>
                        <td style="width: 11px">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/un_lok.jpg" /></td>
                        <td style="width: 34px">&nbsp;<asp:LinkButton ID="LinkButton51" runat="server" CssClass="bar_format" Font-Bold="True"
                            Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton51_Click"
                            Width="50px">Un-Lock</asp:LinkButton></td>
                        <td style="width: 20px">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/delete.jpg" /></td>
                        <td style="width: 58px">
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="bar_format" Font-Bold="True"
                                Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton2_Click"
                                Width="14px">Delete</asp:LinkButton></td>
                        <td style="width: 100px">
                            <rad:RadDateTimePicker ID="RadDateTimePicker1" runat="server" Culture="English (United States)"
                                Skin="">
                                <TimeView Skin="">
                                </TimeView>
                                <DateInput Skin="">
                                </DateInput>
                            </rad:RadDateTimePicker>
                        </td>
                    </tr>
                </table>
                <table style="width: 600px">
                    <tr>
                        <td style="width: 118px">Contact #:
                        </td>
                        <td style="width: 176px">
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("contact_no") %>'></asp:TextBox></td>
                        <td style="width: 206px">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                                SelectCommand="SELECT [user_id], [user_type] FROM [activ_users] WHERE ([user_type] = @user_type)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="staff" Name="user_type" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="width: 86px">
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1"
                                DataTextField="user_id" DataValueField="user_id" Width="131px" OnDataBound="DropDownList2_DataBound">
                            </asp:DropDownList></td>
                        <td style="width: 74px">
                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="bar_format" Font-Bold="True"
                                Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton5_Click"
                                Width="68px">Recommend</asp:LinkButton></td>
                    </tr>
                </table>
                <table cellspacing="0" style="width: 368px">
                    <tr>
                        <td style="height: 21px">
                            <asp:Label ID="Label3" runat="server" ForeColor="#003399" Text="Description:"></asp:Label></td>
                        <td align="left" style="width: 100px; height: 21px">
                            <asp:Label ID="d" runat="server"></asp:Label></td>
                        <td align="left" style="width: 100px; height: 21px">
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 307px">
                                <tr>
                                    <td style="width: 215px">
                                        <asp:Label ID="Label1" runat="server" ForeColor="#003399" Text="Comments:" Width="59px"></asp:Label></td>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="LinkButton4" runat="server" Font-Size="Small" Font-Underline="False"
                                            ForeColor="Brown" OnClick="LinkButton4_Click" Width="102px">(Click here to add)</asp:LinkButton></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:TextBox ID="TextBox1" runat="server" Height="129px" ReadOnly="True" Text='<%# Eval("app_detail") %>'
                                TextMode="MultiLine" Width="310px"></asp:TextBox></td>
                        <td style="width: 100px" valign="top"></td>
                        <td style="width: 100px" valign="top">
                            <asp:TextBox ID="TextBox3" runat="server" Height="100px" ReadOnly="True" Text='<%# Eval("app_reply") %>'
                                TextMode="MultiLine" Width="308px"></asp:TextBox>
                            <table style="width: 319px">
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg" /></td>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="LinkButton7" runat="server" BackColor="Transparent" BorderStyle="None"
                                            BorderWidth="1px" Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab"
                                            OnClick="LinkButton7_Click" Width="45px">Update</asp:LinkButton></td>
                                    <td style="width: 494px"></td>
                                    <td style="width: 100px">
                                        <asp:Label ID="Label4" runat="server" ForeColor="#003399" Text="Status:" Width="44px"></asp:Label></td>
                                    <td style="width: 100px">
                                        <asp:DropDownList ID="DropDownList1" runat="server" Width="103px">
                                            <asp:ListItem Selected="True">-----</asp:ListItem>
                                            <asp:ListItem>Pending</asp:ListItem>
                                            <asp:ListItem>Approved</asp:ListItem>
                                            <asp:ListItem>Closed</asp:ListItem>
                                        </asp:DropDownList></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            SelectCommand="SELECT [app_no], [app_detail], [contact_no], [app_reply],[app_date] FROM [cust_appoint] WHERE ([app_no] = @app_no)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="app_no" PropertyName="SelectedValue"
                    Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </div>
    <div style="z-index: 102; left: 0px; width: 582px; position: absolute; top: 35px; height: 23px"
        id="DIV1" onclick="return DIV1_onclick()">
        <table border="0" cellspacing="0" style="font-weight: bolder; font-size: small; width: 632px; color: white; background-color: steelblue">
            <tr>
                <td style="width: 14px; height: 19px"></td>
                <td style="width: 92px; height: 19px">Appointment #
                    <div style="z-index: 101; left: 1px; width: 100px; position: absolute; top: -30px; height: 100px">
                        <img src="Images/loc_apps.jpg" />
                    </div>
                </td>
                <td align="center" style="width: 140px; height: 19px">Request
                    From</td>
                <td align="center" style="width: 198px; height: 19px">Appointment
                    Date</td>
                <td align="center" style="width: 124px; height: 19px">Appointment
                    Status</td>
            </tr>
        </table>
    </div>
</asp:Content>