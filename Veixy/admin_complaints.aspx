<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_complaints.aspx.cs" Inherits="admin_accounts" Title="Veixy-Complaints" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function setMouseOverColor(element) {
            element.style.cursor = 'hand';
        }
    </script>

    <table border="0" cellspacing="0" style="width: 825px; height: 27px">
        <tr>
            <td style="width: 203px; height: 21px; background-color: white"></td>
            <td style="width: 27px; height: 21px; background-color: white">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/cp_home.jpg"
                    PostBackUrl="~/admin_main.aspx" /></td>
            <td colspan="3" style="height: 21px; background-color: #f5faf1">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="DimGray" Text="Control Panel"
                    Width="82px"></asp:Label>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="LightGray" Text="--- Complaint Box"
                    Width="235px"></asp:Label></td>
        </tr>
    </table>
    <table style="width: 820px">
        <tr>
            <td style="width: 348px"></td>
            <td style="width: 44px"></td>
            <td></td>
            <td colspan="2" valign="middle">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/i_sign.jpg" />
                <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="#003399" Height="20px"
                    Text="Please select a complaint to update the status" Width="244px"></asp:Label></td>
            <td align="center" style="width: 78px"></td>
            <td style="width: 72px"></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 348px"></td>
            <td style="width: 44px"></td>
            <td></td>
            <td align="center" colspan="2">
                <asp:DropDownList ID="DropDownList2" runat="server" Width="71px">
                    <asp:ListItem Selected="True">Pending</asp:ListItem>
                    <asp:ListItem>Processing</asp:ListItem>
                    <asp:ListItem>Resolved</asp:ListItem>
                    <asp:ListItem>Deferred</asp:ListItem>
                </asp:DropDownList>&nbsp;
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/send_but.jpg" />
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" Height="18px"
                    OnClick="LinkButton4_Click" Width="56px">Update</asp:LinkButton></td>
            <td align="center" style="width: 78px" valign="middle">&nbsp;</td>
            <td style="width: 72px"></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 348px">
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton2_Click"
                    Width="77px">(Turn off filter)</asp:LinkButton></td>
            <td style="width: 44px"></td>
            <td></td>
            <td align="right"></td>
            <td style="width: 302px"></td>
            <td align="right" style="width: 78px">
                <asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="#003399" Text="Filer By"
                    Width="57px"></asp:Label></td>
            <td style="width: 72px">
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>--------</asp:ListItem>
                    <asp:ListItem>Pending</asp:ListItem>
                    <asp:ListItem>Processing</asp:ListItem>
                    <asp:ListItem>Resolved</asp:ListItem>
                    <asp:ListItem>Deferred</asp:ListItem>
                </asp:DropDownList></td>
            <td style="width: 100px">
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton5_Click"
                    Width="33px">Filter</asp:LinkButton></td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server" Height="398px" ScrollBars="Vertical" Width="819px">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" Width="801px" Height="1px" Font-Size="Small" OnRowDataBound="GridView1_RowDataBound" DataKeyNames="complaint_no" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="complaint_no" HeaderText="Complaint No." ReadOnly="True" InsertVisible="False" SortExpression="complaint_no"></asp:BoundField>
                        <asp:BoundField DataField="sender_name" HeaderText="Complaint By" SortExpression="sender_name">
                            <HeaderStyle Width="150px"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="send_date" HeaderText="Date &amp; Time" SortExpression="send_date"></asp:BoundField>
                        <asp:BoundField DataField="complaint_status" HeaderText="Status" SortExpression="complaint_status">
                            <ItemStyle ForeColor="Olive"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Complaint Message">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Width="504px" Text='<%# Bind("complaint_txt") %>' Height="67px" Font-Size="Small" TextMode="MultiLine" __designer:wfdid="w103"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <SelectedRowStyle BackColor="LightSteelBlue" Font-Bold="False" ForeColor="Olive"></SelectedRowStyle>

                    <HeaderStyle BackColor="SteelBlue" ForeColor="White"></HeaderStyle>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            DeleteCommand="DELETE FROM [cust_complaints] WHERE [complaint_no] = @complaint_no" InsertCommand="INSERT INTO [cust_complaints] ([sender_name], [send_date], [complaint_txt], [complaint_status]) VALUES (@sender_name, @send_date, @complaint_txt, @complaint_status)"
            SelectCommand="SELECT * FROM [cust_complaints] WHERE ([sender_name] <> @sender_name)"
            UpdateCommand="UPDATE [cust_complaints] SET [sender_name] = @sender_name, [send_date] = @send_date, [complaint_txt] = @complaint_txt, [complaint_status] = @complaint_status WHERE [complaint_no] = @complaint_no">
            <DeleteParameters>
                <asp:Parameter Name="complaint_no" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="sender_name" Type="String" />
                <asp:Parameter Name="send_date" Type="DateTime" />
                <asp:Parameter Name="complaint_txt" Type="String" />
                <asp:Parameter Name="complaint_status" Type="String" />
                <asp:Parameter Name="complaint_no" Type="Decimal" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="sender_name" Type="String" />
                <asp:Parameter Name="send_date" Type="DateTime" />
                <asp:Parameter Name="complaint_txt" Type="String" />
                <asp:Parameter Name="complaint_status" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="dummy" Name="sender_name" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            DeleteCommand="DELETE FROM [cust_complaints] WHERE [complaint_no] = @complaint_no" InsertCommand="INSERT INTO [cust_complaints] ([sender_name], [send_date], [complaint_txt], [complaint_status]) VALUES (@sender_name, @send_date, @complaint_txt, @complaint_status)"
            SelectCommand="SELECT * FROM [cust_complaints] WHERE ([complaint_status] = @complaint_status)"
            UpdateCommand="UPDATE [cust_complaints] SET [sender_name] = @sender_name, [send_date] = @send_date, [complaint_txt] = @complaint_txt, [complaint_status] = @complaint_status WHERE [complaint_no] = @complaint_no">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="complaint_status" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="complaint_no" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="sender_name" Type="String" />
                <asp:Parameter Name="send_date" Type="DateTime" />
                <asp:Parameter Name="complaint_txt" Type="String" />
                <asp:Parameter Name="complaint_status" Type="String" />
                <asp:Parameter Name="complaint_no" Type="Decimal" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="sender_name" Type="String" />
                <asp:Parameter Name="send_date" Type="DateTime" />
                <asp:Parameter Name="complaint_txt" Type="String" />
                <asp:Parameter Name="complaint_status" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    &nbsp;
</asp:Content>