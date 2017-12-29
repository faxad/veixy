<%@ Page Language="C#" MasterPageFile="~/top_mp5.master" AutoEventWireup="true" CodeFile="cust_appoint.aspx.cs" Inherits="cust_appoint" Title="Veixy-Appointments" EnableEventValidation="false" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
// <!CDATA[
// ]]>
function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>
    <div style="z-index: 101; left: 4px; width: 421px; position: absolute; top: 5px; height: 346px">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel1" runat="server" Width="431px" __designer:wfdid="w57" Height="202px">
                    <asp:GridView Style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none" ID="GridView1" runat="server" Width="422px" ForeColor="Black" __designer:wfdid="w60" AllowPaging="True" DataSourceID="SqlDataSource1" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="app_no" SelectedIndex="0" BorderStyle="None" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="app_no" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="app_no"></asp:BoundField>
                            <asp:BoundField DataField="app_date" HeaderText="Appointment Data" SortExpression="app_date">
                                <ItemStyle HorizontalAlign="Center" BackColor="WhiteSmoke"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="contact_no" HeaderText="Contact #" SortExpression="contact_no">
                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="app_status" HeaderText="Status" SortExpression="app_status">
                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <table style="width: 751px">
                                <tbody>
                                    <tr>
                                        <td style="width: 151px"></td>
                                        <td style="width: 91px"></td>
                                        <td style="width: 444px"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 151px; height: 19px">
                                            <asp:ImageButton ID="ImageButton3" runat="server" __designer:dtid="9007199254741007" PostBackUrl="~/cust_cappoint.aspx" ImageUrl="~/Images/create_app.jpg" __designer:wfdid="w62"></asp:ImageButton></td>
                                        <td style="width: 91px; height: 19px"></td>
                                        <td style="width: 444px; height: 19px">You have not created any appointments.</td>
                                        <td style="width: 100px; height: 19px"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 151px"></td>
                                        <td style="width: 91px"></td>
                                        <td style="width: 444px"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </EmptyDataTemplate>

                        <SelectedRowStyle BackColor="WhiteSmoke"></SelectedRowStyle>

                        <HeaderStyle BorderStyle="None" CssClass="gv_header" ForeColor="White"></HeaderStyle>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" __designer:wfdid="w61" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" DeleteCommand="DELETE FROM [cust_appoint] WHERE [app_no] = @app_no" InsertCommand="INSERT INTO [cust_appoint] ([app_date], [contact_no], [app_status]) VALUES (@app_date, @contact_no, @app_status)" SelectCommand="SELECT app_no, app_date, contact_no, app_status FROM cust_appoint WHERE (user_name = @user_name) ORDER BY app_no DESC" UpdateCommand="UPDATE [cust_appoint] SET [app_date] = @app_date, [contact_no] = @contact_no, [app_status] = @app_status WHERE [app_no] = @app_no">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="user_session" Name="user_name" Type="String"></asp:SessionParameter>
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="app_no" Type="Decimal"></asp:Parameter>
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="app_date" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="contact_no" Type="String"></asp:Parameter>
                            <asp:Parameter Name="app_status" Type="String"></asp:Parameter>
                            <asp:Parameter Name="app_no" Type="Decimal"></asp:Parameter>
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="app_date" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="contact_no" Type="String"></asp:Parameter>
                            <asp:Parameter Name="app_status" Type="String"></asp:Parameter>
                        </InsertParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="z-index: 101; left: 439px; width: 100px; position: absolute; top: 0px; height: 100px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" BorderStyle="None" DataSourceID="SqlDataSource2" OnItemCreated="DataList1_ItemCreated" __designer:wfdid="w68">
                        <HeaderStyle CssClass="gv_header"></HeaderStyle>
                        <FooterTemplate>
                            <table style="width: 337px" __designer:dtid="9007199254741003">
                                <tbody>
                                    <tr __designer:dtid="9007199254741004">
                                        <td style="width: 643px; height: 41px" __designer:dtid="9007199254741005">
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" __designer:wfdid="w75" DisplayAfter="1" AssociatedUpdatePanelID="UpdatePanel2">
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
                                        </td>
                                        <td style="width: 100px; height: 41px" __designer:dtid="9007199254741006">
                                            <asp:ImageButton ID="ImageButton3" runat="server" __designer:dtid="9007199254741007" PostBackUrl="~/cust_cappoint.aspx" ImageUrl="~/Images/create_app.jpg" __designer:wfdid="w74"></asp:ImageButton></td>
                                    </tr>
                                </tbody>
                            </table>
                        </FooterTemplate>
                        <ItemTemplate>
                            <table style="width: 333px; border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none">
                                <tbody>
                                    <tr>
                                        <td style="background-image: url(Images/my_header.jpg); width: 321px; color: white; height: 19px" colspan="2"><strong>Appointment Detail</strong></td>
                                        <td style="background-image: url(Images/my_header.jpg); width: 3px; color: white; height: 19px" colspan="1">
                                            <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" ImageUrl="~/Images/r_down.jpg" __designer:wfdid="w76" ImageAlign="Top"></asp:ImageButton></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width: 100px">
                                            <asp:TextBox ID="TextBox1" runat="server" Width="321px" Font-Size="Small" Text='<%# Eval("app_detail") %>' Height="150px" __designer:wfdid="w77" TextMode="MultiLine" ReadOnly="True"></asp:TextBox></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="width: 334px">
                                <tbody>
                                    <tr>
                                        <td style="background-image: url(Images/my_header.jpg); width: 277px; color: white; height: 19px" colspan="2"><strong>Reply Detail</strong></td>
                                        <td style="background-image: url(Images/my_header.jpg); color: white; height: 19px" colspan="1">
                                            <asp:ImageButton ID="ImageButton2" OnClick="ImageButton2_Click" runat="server" ImageUrl="~/Images/r_down.jpg" __designer:wfdid="w78" ImageAlign="Top"></asp:ImageButton></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="height: 19px" colspan="2">
                                            <asp:TextBox ID="TextBox2" runat="server" Width="323px" Font-Size="Small" Text='<%# Eval("app_reply") %>' Height="150px" __designer:wfdid="w79" TextMode="MultiLine" ReadOnly="True" Visible="False"></asp:TextBox></td>
                                    </tr>
                                </tbody>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT [app_detail], [app_reply] FROM [cust_appoint] WHERE ([app_no] = @app_no)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" __designer:wfdid="w69">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="app_no" PropertyName="SelectedValue"
                                Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div style="z-index: 102; left: -134px; width: 100px; position: absolute; top: 272px; height: 158px">
            <img src="Images_Net/ATC_1298.jpg" />
        </div>
        &nbsp;
        &nbsp; &nbsp;&nbsp;<br />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel2" runat="server" Width="716px" Height="358px">
                    <br />
                    <div style="z-index: 101; left: 223px; width: 100px; position: absolute; top: 244px; height: 100px">
                        &nbsp;<asp:UpdateProgress ID="UpdateProgress2" runat="server" __designer:wfdid="w23" AssociatedUpdatePanelID="UpdatePanel3" DisplayAfter="1">
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
                    <br />
                    <asp:DataList Style="font-size: small" ID="DataList2" runat="server" DataSourceID="SqlDataSource3" DataKeyField="app_no">
                        <ItemTemplate>
                            <br />
                            <table style="width: 278px">
                                <tbody>
                                    <tr>
                                        <td style="width: 129px"><strong style="color: darkgray">Appointment Details</strong></td>
                                        <td style="width: 131px">
                                            <asp:Image ID="Image1" runat="server" __designer:wfdid="w567" ImageUrl="~/Images/arrow_down.jpg"></asp:Image></td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                            <table style="width: 716px; color: steelblue; height: 72px" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 222px; height: 22px" valign="top"></td>
                                        <td style="height: 22px" valign="top">Appointment #: </td>
                                        <td style="height: 22px" valign="top">
                                            <asp:Label ID="call_ref_noLabel" runat="server" Width="87px" ForeColor="Black" Text='<%# Eval("app_no") %>' __designer:wfdid="w568"></asp:Label></td>
                                        <td style="height: 22px">&nbsp;</td>
                                        <td style="width: 373px; height: 22px"></td>
                                        <td style="width: 57px; height: 22px">&nbsp;</td>
                                        <td style="height: 22px" valign="bottom">&nbsp;</td>
                                        <td style="height: 22px">&nbsp;<br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 222px"></td>
                                        <td>Contact #:
                                            <asp:Label ID="Label2" runat="server" Width="101px" __designer:wfdid="w569"></asp:Label></td>
                                        <td valign="top">
                                            <asp:TextBox ID="TextBox5" runat="server" Width="158px" Text='<%# Eval("contact_no") %>' __designer:wfdid="w570"></asp:TextBox></td>
                                        <td></td>
                                        <td style="width: 373px" align="center"></td>
                                        <td style="width: 57px" align="center">
                                            <asp:Label ID="Label5" runat="server" Width="121px" ForeColor="SteelBlue" Text="Change Date/Time:" __designer:wfdid="w571"></asp:Label></td>
                                        <td align="left" colspan="2">&nbsp;<rad:RadDateTimePicker ID="RadDateTimePicker1" runat="server" __designer:wfdid="w572"></rad:RadDateTimePicker>
                                            <asp:Label ID="Label6" runat="server" Width="198px" ForeColor="#C00000" Text="(mm/dd/yyyy hh:mm:ss am/pm)" __designer:wfdid="w573"></asp:Label></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 33px; height: 36px" valign="middle" rowspan="1"></td>
                                        <td style="width: 100px; height: 36px" valign="middle" rowspan="1">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 171px; height: 17px">
                                                            <asp:Label ID="Label3" runat="server" Width="86px" ForeColor="DarkGray" Text="Description:" __designer:wfdid="w574"></asp:Label></td>
                                                        <td style="width: 100px; height: 17px">
                                                            <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Width="111px" ForeColor="Brown" Font-Underline="False" Font-Size="Small" __designer:wfdid="w575">(Click here to add)</asp:LinkButton></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td style="width: 68px; height: 36px"></td>
                                        <td style="width: 100px; height: 36px">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="Label1" runat="server" ForeColor="DarkGray" Text="Comments:" __designer:wfdid="w576"></asp:Label></td>
                                                        <td style="width: 100px"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 33px"></td>
                                        <td style="width: 100px">
                                            <asp:TextBox ID="TextBox1" runat="server" Width="263px" Text='<%# Eval("app_detail") %>' __designer:wfdid="w577" Height="188px" ReadOnly="True" TextMode="MultiLine"></asp:TextBox></td>
                                        <td style="width: 68px" valign="top"></td>
                                        <td style="width: 100px" valign="top">
                                            <asp:TextBox ID="TextBox3" runat="server" Width="309px" Text='<%# Eval("app_reply") %>' __designer:wfdid="w578" Height="148px" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                                            <table style="width: 298px">
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 291px; height: 20px">
                                                            <asp:CheckBox ID="CheckBox1" runat="server" ForeColor="#C00000" Text="Cancel this appointment" __designer:wfdid="w579"></asp:CheckBox></td>
                                                        <td style="width: 13px; height: 20px">
                                                            <asp:Image ID="Image8" runat="server" __designer:wfdid="w580" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                                        <td style="width: 48px; height: 20px">
                                                            <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="45px" ForeColor="OliveDrab" Font-Underline="False" Font-Size="Small" __designer:wfdid="w581" BorderStyle="None" Font-Bold="True" BorderWidth="1px" BackColor="Transparent">Update</asp:LinkButton></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ItemTemplate>
                    </asp:DataList><asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [app_no], [app_detail], [contact_no], [app_reply] FROM [cust_appoint] WHERE ([app_no] = @app_no)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="app_no" PropertyName="SelectedValue"
                                Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
                <br />
                &nbsp; &nbsp;&nbsp;<br />
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />
        <br />
        <br />
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
                    <asp:Label ID="Label2" runat="server" Font-Size="X-Small" Font-Underline="False"
                        ForeColor="Gray" Text="© Veixy.com"></asp:Label></td>
                <td style="width: 98px"></td>
            </tr>
        </table>
    </div>
</asp:Content>