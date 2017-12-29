<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_accounts.aspx.cs" Inherits="admin_accounts" Title="Veixy-Customer Accounts" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function setMouseOverColor(element) {
            element.style.cursor = 'hand';
        }
    </script>
    <table style="width: 825px; height: 27px;" border="0" cellspacing="0">
        <tr>
            <td style="width: 203px; height: 21px; background-color: white"></td>
            <td style="width: 27px; height: 21px; background-color: white">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/cp_home.jpg"
                    PostBackUrl="~/admin_main.aspx" /></td>
            <td style="height: 21px; background-color: #f5faf1" colspan="3">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="DimGray" Text="Control Panel"
                    Width="82px"></asp:Label>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="LightGray" Text="--- Customer Accounts"
                    Width="235px"></asp:Label></td>
        </tr>
    </table>
    <table style="width: 820px">
        <tr>
            <td style="width: 78px"></td>
            <td style="width: 44px"></td>
            <td style="width: 61px">
                <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="#003399" Text="Filer Text"></asp:Label></td>
            <td style="width: 98px">
                <asp:TextBox ID="TextBox1" runat="server" Width="110px"></asp:TextBox></td>
            <td style="width: 41px">
                <asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="#003399" Text="Filer By"
                    Width="57px"></asp:Label>
            </td>
            <td align="center" style="width: 78px">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>--------</asp:ListItem>
                    <asp:ListItem>User Name</asp:ListItem>
                    <asp:ListItem>Country</asp:ListItem>
                    <asp:ListItem>Email Address</asp:ListItem>
                    <asp:ListItem>First Name</asp:ListItem>
                    <asp:ListItem>Last Name</asp:ListItem>
                </asp:DropDownList></td>
            <td style="width: 105px">
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton5_Click"
                    Width="33px">Filter</asp:LinkButton></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 78px">
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="bar_format" Font-Bold="True"
                    Font-Size="X-Small" Font-Underline="False" ForeColor="OliveDrab" OnClick="LinkButton2_Click"
                    Width="77px">Turn off filter</asp:LinkButton></td>
            <td style="width: 44px"></td>
            <td style="width: 61px"></td>
            <td style="width: 98px"></td>
            <td style="width: 41px"></td>
            <td align="center" style="width: 78px"></td>
            <td style="width: 105px"></td>
            <td style="width: 100px"></td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server" Height="219px" ScrollBars="Vertical" Width="819px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            Font-Size="Small" DataKeyNames="user_id" OnRowDataBound="GridView1_RowDataBound" Width="800px" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="user_id" HeaderText="User ID" ReadOnly="True" SortExpression="user_id">
                    <HeaderStyle Width="85px" BorderStyle="None" />
                </asp:BoundField>
                <asp:BoundField DataField="f_name" HeaderText="First Name" SortExpression="f_name">
                    <HeaderStyle Width="80px" BorderStyle="None" />
                </asp:BoundField>
                <asp:BoundField DataField="l_name" HeaderText="Last Name" SortExpression="l_name">
                    <HeaderStyle Width="80px" BorderStyle="None" />
                </asp:BoundField>
                <asp:BoundField DataField="dob" HeaderText="Date Of Birth" SortExpression="dob">
                    <HeaderStyle Width="90px" BorderStyle="None" />
                </asp:BoundField>
                <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country">
                    <HeaderStyle Width="100px" BorderStyle="None" />
                </asp:BoundField>
                <asp:BoundField DataField="user_contact_no" HeaderText="Contact #" SortExpression="user_contact_no">
                    <HeaderStyle Width="80px" BorderStyle="None" />
                </asp:BoundField>
                <asp:BoundField DataField="email_add" HeaderText="Email Addres" SortExpression="email_add">
                    <HeaderStyle Width="150px" BorderStyle="None" />
                </asp:BoundField>
                <asp:BoundField DataField="acc_status" HeaderText="Status" SortExpression="acc_status">
                    <HeaderStyle BorderStyle="None" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/delete.jpg" ShowDeleteButton="True">
                    <HeaderStyle BorderStyle="None" />
                </asp:CommandField>
            </Columns>
            <HeaderStyle BackColor="SteelBlue" ForeColor="White" />
            <SelectedRowStyle BackColor="#F5FAF1" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            DeleteCommand="DELETE FROM [user_info] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [user_info] ([user_id], [user_pass], [user_contact_no], [user_contact_no2], [dob], [country], [city], [email_add], [postal_address]) VALUES (@user_id, @user_pass, @user_contact_no, @user_contact_no2, @dob, @country, @city, @email_add, @postal_address)"
            SelectCommand="SELECT [user_id], [acc_status], [user_contact_no],[f_name],[l_name], [user_contact_no2], CONVERT (VARCHAR, dob, 101) AS dob, [country], [city], [email_add], [postal_address] FROM [user_info]"
            UpdateCommand="UPDATE [user_info] SET [user_pass] = @user_pass, [user_contact_no] = @user_contact_no, [user_contact_no2] = @user_contact_no2, [dob] = @dob, [country] = @country, [city] = @city, [email_add] = @email_add, [postal_address] = @postal_address WHERE [user_id] = @user_id">
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="user_pass" Type="String" />
                <asp:Parameter Name="user_contact_no" Type="Decimal" />
                <asp:Parameter Name="user_contact_no2" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="email_add" Type="String" />
                <asp:Parameter Name="postal_address" Type="String" />
                <asp:Parameter Name="user_id" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="user_id" Type="String" />
                <asp:Parameter Name="user_pass" Type="String" />
                <asp:Parameter Name="user_contact_no" Type="Decimal" />
                <asp:Parameter Name="user_contact_no2" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="email_add" Type="String" />
                <asp:Parameter Name="postal_address" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            DeleteCommand="DELETE FROM [user_info] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [user_info] ([user_id], [user_pass], [user_contact_no], [user_contact_no2], [dob], [country], [city], [email_add], [postal_address]) VALUES (@user_id, @user_pass, @user_contact_no, @user_contact_no2, @dob, @country, @city, @email_add, @postal_address)"
            SelectCommand="SELECT [user_id], [acc_status], [user_contact_no],[f_name],[l_name], [user_contact_no2], CONVERT (VARCHAR, dob, 101) AS dob, [country], [city], [email_add], [postal_address] FROM [user_info] WHERE [user_id]=@user_id"
            UpdateCommand="UPDATE [user_info] SET [user_pass] = @user_pass, [user_contact_no] = @user_contact_no, [user_contact_no2] = @user_contact_no2, [dob] = @dob, [country] = @country, [city] = @city, [email_add] = @email_add, [postal_address] = @postal_address WHERE [user_id] = @user_id">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="user_id" PropertyName="Text" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="user_pass" Type="String" />
                <asp:Parameter Name="user_contact_no" Type="Decimal" />
                <asp:Parameter Name="user_contact_no2" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="email_add" Type="String" />
                <asp:Parameter Name="postal_address" Type="String" />
                <asp:Parameter Name="user_id" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="user_id" Type="String" />
                <asp:Parameter Name="user_pass" Type="String" />
                <asp:Parameter Name="user_contact_no" Type="Decimal" />
                <asp:Parameter Name="user_contact_no2" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="email_add" Type="String" />
                <asp:Parameter Name="postal_address" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            DeleteCommand="DELETE FROM [user_info] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [user_info] ([user_id], [user_pass], [user_contact_no], [user_contact_no2], [dob], [country], [city], [email_add], [postal_address]) VALUES (@user_id, @user_pass, @user_contact_no, @user_contact_no2, @dob, @country, @city, @email_add, @postal_address)"
            SelectCommand="SELECT [user_id], [acc_status], [user_contact_no],[f_name],[l_name], [user_contact_no2], CONVERT (VARCHAR, dob, 101) AS dob, [country], [city], [email_add], [postal_address] FROM [user_info] WHERE [country]=@country"
            UpdateCommand="UPDATE [user_info] SET [user_pass] = @user_pass, [user_contact_no] = @user_contact_no, [user_contact_no2] = @user_contact_no2, [dob] = @dob, [country] = @country, [city] = @city, [email_add] = @email_add, [postal_address] = @postal_address WHERE [user_id] = @user_id">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="country" PropertyName="Text" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="user_pass" Type="String" />
                <asp:Parameter Name="user_contact_no" Type="Decimal" />
                <asp:Parameter Name="user_contact_no2" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="email_add" Type="String" />
                <asp:Parameter Name="postal_address" Type="String" />
                <asp:Parameter Name="user_id" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="user_id" Type="String" />
                <asp:Parameter Name="user_pass" Type="String" />
                <asp:Parameter Name="user_contact_no" Type="Decimal" />
                <asp:Parameter Name="user_contact_no2" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="email_add" Type="String" />
                <asp:Parameter Name="postal_address" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            DeleteCommand="DELETE FROM [user_info] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [user_info] ([user_id], [user_pass], [user_contact_no], [user_contact_no2], [dob], [country], [city], [email_add], [postal_address]) VALUES (@user_id, @user_pass, @user_contact_no, @user_contact_no2, @dob, @country, @city, @email_add, @postal_address)"
            SelectCommand="SELECT [user_id], [acc_status], [user_contact_no],[f_name],[l_name], [user_contact_no2], CONVERT (VARCHAR, dob, 101) AS dob, [country], [city], [email_add], [postal_address] FROM [user_info] WHERE [f_name]=@f_name"
            UpdateCommand="UPDATE [user_info] SET [user_pass] = @user_pass, [user_contact_no] = @user_contact_no, [user_contact_no2] = @user_contact_no2, [dob] = @dob, [country] = @country, [city] = @city, [email_add] = @email_add, [postal_address] = @postal_address WHERE [user_id] = @user_id">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="f_name" PropertyName="Text" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="user_pass" Type="String" />
                <asp:Parameter Name="user_contact_no" Type="Decimal" />
                <asp:Parameter Name="user_contact_no2" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="email_add" Type="String" />
                <asp:Parameter Name="postal_address" Type="String" />
                <asp:Parameter Name="user_id" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="user_id" Type="String" />
                <asp:Parameter Name="user_pass" Type="String" />
                <asp:Parameter Name="user_contact_no" Type="Decimal" />
                <asp:Parameter Name="user_contact_no2" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="email_add" Type="String" />
                <asp:Parameter Name="postal_address" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            DeleteCommand="DELETE FROM [user_info] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [user_info] ([user_id], [user_pass], [user_contact_no], [user_contact_no2], [dob], [country], [city], [email_add], [postal_address]) VALUES (@user_id, @user_pass, @user_contact_no, @user_contact_no2, @dob, @country, @city, @email_add, @postal_address)"
            SelectCommand="SELECT [user_id], [acc_status], [user_contact_no],[f_name],[l_name], [user_contact_no2], CONVERT (VARCHAR, dob, 101) AS dob, [country], [city], [email_add], [postal_address] FROM [user_info] WHERE [l_name]=@l_name"
            UpdateCommand="UPDATE [user_info] SET [user_pass] = @user_pass, [user_contact_no] = @user_contact_no, [user_contact_no2] = @user_contact_no2, [dob] = @dob, [country] = @country, [city] = @city, [email_add] = @email_add, [postal_address] = @postal_address WHERE [user_id] = @user_id">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="l_name" PropertyName="Text" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="user_pass" Type="String" />
                <asp:Parameter Name="user_contact_no" Type="Decimal" />
                <asp:Parameter Name="user_contact_no2" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="email_add" Type="String" />
                <asp:Parameter Name="postal_address" Type="String" />
                <asp:Parameter Name="user_id" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="user_id" Type="String" />
                <asp:Parameter Name="user_pass" Type="String" />
                <asp:Parameter Name="user_contact_no" Type="Decimal" />
                <asp:Parameter Name="user_contact_no2" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="email_add" Type="String" />
                <asp:Parameter Name="postal_address" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
            DeleteCommand="DELETE FROM [user_info] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [user_info] ([user_id], [user_pass], [user_contact_no], [user_contact_no2], [dob], [country], [city], [email_add], [postal_address]) VALUES (@user_id, @user_pass, @user_contact_no, @user_contact_no2, @dob, @country, @city, @email_add, @postal_address)"
            SelectCommand="SELECT [user_id], [acc_status], [user_contact_no],[f_name],[l_name], [user_contact_no2], CONVERT (VARCHAR, dob, 101) AS dob, [country], [city], [email_add], [postal_address] FROM [user_info] WHERE [email_add]=@email_add"
            UpdateCommand="UPDATE [user_info] SET [user_pass] = @user_pass, [user_contact_no] = @user_contact_no, [user_contact_no2] = @user_contact_no2, [dob] = @dob, [country] = @country, [city] = @city, [email_add] = @email_add, [postal_address] = @postal_address WHERE [user_id] = @user_id">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="email_add" PropertyName="Text" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="user_pass" Type="String" />
                <asp:Parameter Name="user_contact_no" Type="Decimal" />
                <asp:Parameter Name="user_contact_no2" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="email_add" Type="String" />
                <asp:Parameter Name="postal_address" Type="String" />
                <asp:Parameter Name="user_id" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="user_id" Type="String" />
                <asp:Parameter Name="user_pass" Type="String" />
                <asp:Parameter Name="user_contact_no" Type="Decimal" />
                <asp:Parameter Name="user_contact_no2" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="email_add" Type="String" />
                <asp:Parameter Name="postal_address" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="user_id" DataSourceID="SqlDataSource2"
        DefaultMode="Edit">
        <EditItemTemplate>
            <table style="font-size: small; width: 793px">
                <tr>
                    <td style="width: 32px; color: #333399"></td>
                    <td style="width: 100px; color: #333399">User ID:</td>
                    <td style="width: 44px">
                        <asp:Label ID="user_idLabel1" runat="server" Text='<%# Eval("user_id") %>'></asp:Label></td>
                    <td style="width: 100px; color: #333399">Contact # 1:</td>
                    <td style="width: 102px; height: 26px">
                        <asp:TextBox ID="user_contact_noTextBox" runat="server" Text='<%# Bind("user_contact_no") %>'></asp:TextBox></td>
                    <td style="font-size: small; width: 84px; color: #333399">Status:</td>
                    <td style="width: 84px; height: 26px">
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("acc_status") %>'></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 32px; color: #333399"></td>
                    <td style="width: 100px; color: #333399">Password:</td>
                    <td style="width: 44px">
                        <asp:TextBox ID="user_passTextBox" runat="server" Text='<%# Eval("user_pass") %>'></asp:TextBox></td>
                    <td style="width: 100px; color: #333399">Contact # 2:</td>
                    <td style="width: 102px">
                        <asp:TextBox ID="user_contact_no2TextBox" runat="server" Text='<%# Bind("user_contact_no2") %>'></asp:TextBox></td>
                    <td colspan="2" rowspan="2">In order to change the status of the account, select the status below and lick update
                        to save the changes.</td>
                </tr>
                <tr>
                    <td style="width: 32px; color: #333399"></td>
                    <td style="width: 100px; color: #333399">First Name:</td>
                    <td style="width: 44px">
                        <asp:TextBox ID="f_nameTextBox" runat="server" Text='<%# Bind("f_name") %>'></asp:TextBox></td>
                    <td style="width: 100px; color: #333399">Country</td>
                    <td style="width: 102px; height: 26px">
                        <asp:TextBox ID="countryTextBox" runat="server" Text='<%# Bind("country") %>'></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 32px; color: #333399"></td>
                    <td style="width: 100px; color: #333399">Last Name:</td>
                    <td style="width: 44px">
                        <asp:TextBox ID="l_nameTextBox" runat="server" Text='<%# Bind("l_name") %>'></asp:TextBox></td>
                    <td style="width: 100px; color: #333399">City:</td>
                    <td style="width: 102px">
                        <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>'></asp:TextBox></td>
                    <td align="left" colspan="2">
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem Value="Current Status"></asp:ListItem>
                            <asp:ListItem>Pending</asp:ListItem>
                            <asp:ListItem>Activated</asp:ListItem>
                            <asp:ListItem>Frozen</asp:ListItem>
                            <asp:ListItem>Blocked</asp:ListItem>
                        </asp:DropDownList>
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Update" CssClass="bar_format"
                            Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab"
                            OnClick="LinkButton4_Click" Width="88px">Change Status</asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="width: 32px; color: #333399"></td>
                    <td style="width: 100px; color: #333399">Date Of Birth:</td>
                    <td style="width: 44px">
                        <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>'></asp:TextBox></td>
                    <td style="width: 100px; color: #333399">Postal Address</td>
                    <td style="width: 102px">
                        <asp:TextBox ID="postal_addressTextBox" runat="server" Text='<%# Bind("postal_address") %>'
                            TextMode="MultiLine" Width="183px" Height="45px"></asp:TextBox></td>
                    <td style="font-size: small; color: #333399" colspan="2" rowspan="2">Comments:<br />
                        <asp:TextBox ID="TextBox3" runat="server" Height="81px" Text='<%# Bind("admin_comments") %>'
                            TextMode="MultiLine" Width="192px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 32px; color: #333399"></td>
                    <td style="width: 100px; color: #333399">Email Address:</td>
                    <td style="width: 44px">
                        <asp:TextBox ID="email_addTextBox" runat="server" Text='<%# Bind("email_add") %>'></asp:TextBox></td>
                    <td style="width: 100px; color: #333399">&nbsp;</td>
                    <td style="width: 102px" valign="middle">
                        <br />
                        <table>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/cancel.jpg" /></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Cancel" CssClass="bar_format"
                                        Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab"
                                        Width="65px">Cancel</asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/send_but.jpg" /></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Update" CssClass="bar_format"
                                        Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab"
                                        OnClick="LinkButton4_Click" Width="57px">Update</asp:LinkButton></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 32px; color: #333399"></td>
                    <td style="width: 100px; color: #333399"></td>
                    <td style="width: 44px"></td>
                    <td style="width: 100px; color: #333399">&nbsp;</td>
                    <td style="width: 102px">&nbsp; &nbsp;&nbsp;
                    </td>
                    <td style="font-size: small; width: 84px; color: #333399"></td>
                    <td style="width: 84px"></td>
                </tr>
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
            <asp:Label ID="user_idLabel" runat="server" Text='<%# Eval("user_id") %>'></asp:Label><br />
            user_pass:
            <asp:Label ID="user_passLabel" runat="server" Text='<%# Bind("user_pass") %>'></asp:Label><br />
            user_contact_no:
            <asp:Label ID="user_contact_noLabel" runat="server" Text='<%# Bind("user_contact_no") %>'></asp:Label><br />
            f_name:
            <asp:Label ID="f_nameLabel" runat="server" Text='<%# Bind("f_name") %>'></asp:Label><br />
            l_name:
            <asp:Label ID="l_nameLabel" runat="server" Text='<%# Bind("l_name") %>'></asp:Label><br />
            user_contact_no2:
            <asp:Label ID="user_contact_no2Label" runat="server" Text='<%# Bind("user_contact_no2") %>'></asp:Label><br />
            dob:
            <asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob") %>'></asp:Label><br />
            country:
            <asp:Label ID="countryLabel" runat="server" Text='<%# Bind("country") %>'></asp:Label><br />
            city:
            <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("city") %>'></asp:Label><br />
            email_add:
            <asp:Label ID="email_addLabel" runat="server" Text='<%# Bind("email_add") %>'></asp:Label><br />
            postal_address:
            <asp:Label ID="postal_addressLabel" runat="server" Text='<%# Bind("postal_address") %>'></asp:Label><br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit"></asp:LinkButton>
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Delete"></asp:LinkButton>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New"></asp:LinkButton>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        DeleteCommand="DELETE FROM [user_info] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [user_info] ([user_id], [user_pass], [user_contact_no], [user_contact_no2], [dob], [country], [city], [email_add], [postal_address], [f_name], [l_name]) VALUES (@user_id, @user_pass, @user_contact_no, @user_contact_no2, @dob, @country, @city, @email_add, @postal_address, @f_name, @l_name)"
        SelectCommand="SELECT * FROM [user_info] WHERE ([user_id] = @user_id)" UpdateCommand="UPDATE [user_info] SET [admin_comments] = @admin_comments, [user_contact_no] = @user_contact_no, [user_contact_no2] = @user_contact_no2, [dob] = @dob, [country] = @country, [city] = @city, [email_add] = @email_add, [postal_address] = @postal_address, [f_name] = @f_name, [l_name] = @l_name WHERE [user_id] = @user_id">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="user_id" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="user_id" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="admin_comments" />
            <asp:Parameter Name="user_contact_no" Type="Decimal" />
            <asp:Parameter Name="user_contact_no2" Type="Decimal" />
            <asp:Parameter Name="dob" Type="DateTime" />
            <asp:Parameter Name="country" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="email_add" Type="String" />
            <asp:Parameter Name="postal_address" Type="String" />
            <asp:Parameter Name="f_name" Type="String" />
            <asp:Parameter Name="l_name" Type="String" />
            <asp:Parameter Name="user_id" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="user_id" Type="String" />
            <asp:Parameter Name="user_pass" Type="String" />
            <asp:Parameter Name="user_contact_no" Type="Decimal" />
            <asp:Parameter Name="user_contact_no2" Type="Decimal" />
            <asp:Parameter Name="dob" Type="DateTime" />
            <asp:Parameter Name="country" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="email_add" Type="String" />
            <asp:Parameter Name="postal_address" Type="String" />
            <asp:Parameter Name="f_name" Type="String" />
            <asp:Parameter Name="l_name" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>