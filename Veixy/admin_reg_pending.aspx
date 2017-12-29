<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_reg_pending.aspx.cs" Inherits="admin_reg_pending" Title="Veixy-Pending Registrations" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellspacing="0" style="width: 825px; height: 27px">
        <tr>
            <td style="width: 203px; height: 21px; background-color: white"></td>
            <td style="width: 27px; height: 21px; background-color: white">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/cp_home.jpg"
                    PostBackUrl="~/admin_main.aspx" /></td>
            <td colspan="3" style="height: 21px; background-color: #f5faf1">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="DimGray" Text="Control Panel"
                    Width="82px"></asp:Label>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="LightGray" Text="--- Pending Registrations"
                    Width="235px"></asp:Label></td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="width: 100px"></td>
            <td style="width: 100px">
                <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="staff_id"
                    DataSourceID="SqlDataSource1" DefaultMode="Edit">
                    <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/Images/next_topic.gif" PreviousPageImageUrl="~/Images/prev_topic.gif" />
                    <EditItemTemplate>
                        <br />
                        <table style="width: 705px">
                            <tr>
                                <td style="font-size: small; width: 1773px; color: #003399; height: 18px"></td>
                                <td style="font-size: small; color: #003399; height: 18px">
                                    <asp:Label ID="Label1" runat="server" Width="77px"></asp:Label></td>
                                <td style="font-size: small; height: 18px"></td>
                                <td style="font-size: small; width: 1217px; color: #003399; height: 18px"></td>
                                <td style="font-size: small; width: 1217px; color: #003399; height: 18px"></td>
                                <td style="font-size: small; width: 17567px; height: 18px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-size: small; width: 1773px; color: #003399"></td>
                                <td style="font-size: small; color: #003399">User ID:
                                </td>
                                <td style="font-size: small">
                                    <asp:Label ID="staff_idLabel1" runat="server" Text='<%# Eval("staff_id") %>' Width="54px"></asp:Label></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 17567px"></td>
                            </tr>
                            <tr>
                                <td style="font-size: small; width: 1773px; color: #003399"></td>
                                <td style="font-size: small; color: #003399">Reg. Status</td>
                                <td style="font-size: small">
                                    <asp:TextBox ID="reg_statusTextBox" runat="server" Text='<%# Bind("reg_status") %>'></asp:TextBox></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 1217px; color: #003399">Postal Address:
                                </td>
                                <td rowspan="3" style="font-size: small; width: 17567px">
                                    <asp:TextBox ID="postal_addressTextBox" runat="server" Height="78px" Text='<%# Bind("postal_address") %>'
                                        TextMode="MultiLine" Width="265px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="font-size: small; width: 1773px; color: #003399; height: 26px"></td>
                                <td style="font-size: small; color: #003399; height: 26px">Password:</td>
                                <td style="font-size: small; height: 26px">
                                    <asp:TextBox ID="staff_passTextBox" runat="server" Text='<%# Bind("staff_pass") %>'></asp:TextBox></td>
                                <td style="font-size: small; width: 1217px; color: #003399; height: 26px"></td>
                                <td style="font-size: small; width: 1217px; color: #003399; height: 26px"></td>
                            </tr>
                            <tr>
                                <td style="font-size: small; width: 1773px; color: #003399"></td>
                                <td style="font-size: small; color: #003399">Contact # 1:</td>
                                <td style="font-size: small">
                                    <asp:TextBox ID="staff_contact_noTextBox" runat="server" Text='<%# Bind("staff_contact_no") %>'></asp:TextBox></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                            </tr>
                            <tr>
                                <td style="font-size: small; width: 1773px; color: #003399"></td>
                                <td style="font-size: small; color: #003399">Contact # 2:</td>
                                <td style="font-size: small">
                                    <asp:TextBox ID="staff_contact_no2TextBox" runat="server" Text='<%# Bind("staff_contact_no2") %>'></asp:TextBox></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 1217px; color: #003399">Status Comments:</td>
                                <td style="font-size: small; width: 17567px" rowspan="3">
                                    <asp:TextBox ID="TextBox1" runat="server" Height="80px" Text='<%# Bind("admin_comments") %>'
                                        TextMode="MultiLine" Width="265px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="font-size: small; width: 1773px; color: #003399"></td>
                                <td style="font-size: small; color: #003399">Post Title:</td>
                                <td style="font-size: small">
                                    <asp:TextBox ID="post_titleTextBox" runat="server" Text='<%# Bind("post_title") %>'></asp:TextBox></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                            </tr>
                            <tr>
                                <td style="font-size: small; width: 1773px; color: #003399"></td>
                                <td style="font-size: small; color: #003399">Staff ID #:</td>
                                <td style="font-size: small">
                                    <asp:TextBox ID="staff_id_noTextBox" runat="server" Text='<%# Bind("staff_id_no") %>'></asp:TextBox></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                            </tr>
                            <tr>
                                <td style="font-size: small; width: 1773px; color: #003399"></td>
                                <td style="font-size: small; color: #003399">Birthdate:</td>
                                <td style="font-size: small">
                                    <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>'></asp:TextBox></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 1217px; color: #003399">
                                    <asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="#003399" Text="New Status"
                                        Width="67px"></asp:Label></td>
                                <td style="font-size: small; width: 17567px">
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem>Pending</asp:ListItem>
                                        <asp:ListItem>Activated</asp:ListItem>
                                        <asp:ListItem>Frozen</asp:ListItem>
                                        <asp:ListItem>Blocked</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="font-size: small; width: 1773px; color: #003399"></td>
                                <td style="font-size: small; color: #003399">Country:
                                </td>
                                <td style="font-size: small">
                                    <asp:TextBox ID="countryTextBox" runat="server" Text='<%# Bind("country") %>'></asp:TextBox></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 17567px" align="center">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-size: small; width: 1773px; color: #003399"></td>
                                <td style="font-size: small; color: #003399">City:
                                </td>
                                <td style="font-size: small">
                                    <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>'></asp:TextBox></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 17567px">&nbsp;<asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg" />
                                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="bar_format" Font-Bold="True"
                                        Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab" Height="18px"
                                        Width="89px" OnClick="LinkButton4_Click">Update Status</asp:LinkButton></td>
                            </tr>
                            <tr>
                                <td style="font-size: small; width: 1773px; color: #003399"></td>
                                <td style="font-size: small; color: #003399">Email Address:</td>
                                <td style="font-size: small">
                                    <asp:TextBox ID="email_addTextBox" runat="server" Text='<%# Bind("email_add") %>'></asp:TextBox></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 17567px"></td>
                            </tr>
                            <tr>
                                <td style="font-size: small; width: 1773px; color: #003399"></td>
                                <td style="font-size: small; color: white">.</td>
                                <td style="font-size: small"></td>
                                <td style="font-size: small; width: 1217px; color: white">.......</td>
                                <td style="font-size: small; width: 1217px; color: #003399"></td>
                                <td style="font-size: small; width: 17567px"></td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        staff_id:
            <asp:TextBox ID="staff_idTextBox" runat="server" Text='<%# Bind("staff_id") %>'>
            </asp:TextBox><br />
                        staff_pass:
            <asp:TextBox ID="staff_passTextBox" runat="server" Text='<%# Bind("staff_pass") %>'>
            </asp:TextBox><br />
                        staff_contact_no:
            <asp:TextBox ID="staff_contact_noTextBox" runat="server" Text='<%# Bind("staff_contact_no") %>'>
            </asp:TextBox><br />
                        staff_contact_no2:
            <asp:TextBox ID="staff_contact_no2TextBox" runat="server" Text='<%# Bind("staff_contact_no2") %>'>
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
                        post_title:
            <asp:TextBox ID="post_titleTextBox" runat="server" Text='<%# Bind("post_title") %>'>
            </asp:TextBox><br />
                        staff_id_no:
            <asp:TextBox ID="staff_id_noTextBox" runat="server" Text='<%# Bind("staff_id_no") %>'>
            </asp:TextBox><br />
                        reg_status:
            <asp:TextBox ID="reg_statusTextBox" runat="server" Text='<%# Bind("reg_status") %>'>
            </asp:TextBox><br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert">
                        </asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel">
                        </asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        staff_id:
            <asp:Label ID="staff_idLabel" runat="server" Text='<%# Eval("staff_id") %>'></asp:Label><br />
                        staff_pass:
            <asp:Label ID="staff_passLabel" runat="server" Text='<%# Bind("staff_pass") %>'></asp:Label><br />
                        staff_contact_no:
            <asp:Label ID="staff_contact_noLabel" runat="server" Text='<%# Bind("staff_contact_no") %>'></asp:Label><br />
                        staff_contact_no2:
            <asp:Label ID="staff_contact_no2Label" runat="server" Text='<%# Bind("staff_contact_no2") %>'></asp:Label><br />
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
                        post_title:
            <asp:Label ID="post_titleLabel" runat="server" Text='<%# Bind("post_title") %>'></asp:Label><br />
                        staff_id_no:
            <asp:Label ID="staff_id_noLabel" runat="server" Text='<%# Bind("staff_id_no") %>'></asp:Label><br />
                        reg_status:
            <asp:Label ID="reg_statusLabel" runat="server" Text='<%# Bind("reg_status") %>'></asp:Label><br />
                    </ItemTemplate>
                </asp:FormView>
            </td>
        </tr>
    </table>
    &nbsp;
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT * FROM [staff_info] WHERE ([reg_status] = @reg_status)" DeleteCommand="DELETE FROM [staff_info] WHERE [staff_id] = @staff_id" InsertCommand="INSERT INTO [staff_info] ([staff_id], [staff_pass], [staff_contact_no], [staff_contact_no2], [dob], [country], [city], [email_add], [postal_address], [post_title], [staff_id_no], [reg_status], [admin_comments], [f_name], [l_name], [acc_status], [chat_stat]) VALUES (@staff_id, @staff_pass, @staff_contact_no, @staff_contact_no2, @dob, @country, @city, @email_add, @postal_address, @post_title, @staff_id_no, @reg_status, @admin_comments, @f_name, @l_name, @acc_status, @chat_stat)" UpdateCommand="UPDATE [staff_info] SET [staff_pass] = @staff_pass, [staff_contact_no] = @staff_contact_no, [staff_contact_no2] = @staff_contact_no2, [dob] = @dob, [country] = @country, [city] = @city, [email_add] = @email_add, [postal_address] = @postal_address, [post_title] = @post_title, [staff_id_no] = @staff_id_no, [reg_status] = @reg_status, [admin_comments] = @admin_comments, [f_name] = @f_name, [l_name] = @l_name, [acc_status] = @acc_status, [chat_stat] = @chat_stat WHERE [staff_id] = @staff_id">
        <SelectParameters>
            <asp:Parameter DefaultValue="Pending" Name="reg_status" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="staff_id" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="staff_pass" Type="String" />
            <asp:Parameter Name="staff_contact_no" Type="String" />
            <asp:Parameter Name="staff_contact_no2" Type="String" />
            <asp:Parameter Name="dob" Type="DateTime" />
            <asp:Parameter Name="country" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="email_add" Type="String" />
            <asp:Parameter Name="postal_address" Type="String" />
            <asp:Parameter Name="post_title" Type="String" />
            <asp:Parameter Name="staff_id_no" Type="Decimal" />
            <asp:Parameter Name="reg_status" Type="String" />
            <asp:Parameter Name="admin_comments" Type="String" />
            <asp:Parameter Name="f_name" Type="String" />
            <asp:Parameter Name="l_name" Type="String" />
            <asp:Parameter Name="acc_status" Type="String" />
            <asp:Parameter Name="chat_stat" Type="Int32" />
            <asp:Parameter Name="staff_id" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="staff_id" Type="String" />
            <asp:Parameter Name="staff_pass" Type="String" />
            <asp:Parameter Name="staff_contact_no" Type="String" />
            <asp:Parameter Name="staff_contact_no2" Type="String" />
            <asp:Parameter Name="dob" Type="DateTime" />
            <asp:Parameter Name="country" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="email_add" Type="String" />
            <asp:Parameter Name="postal_address" Type="String" />
            <asp:Parameter Name="post_title" Type="String" />
            <asp:Parameter Name="staff_id_no" Type="Decimal" />
            <asp:Parameter Name="reg_status" Type="String" />
            <asp:Parameter Name="admin_comments" Type="String" />
            <asp:Parameter Name="f_name" Type="String" />
            <asp:Parameter Name="l_name" Type="String" />
            <asp:Parameter Name="acc_status" Type="String" />
            <asp:Parameter Name="chat_stat" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>