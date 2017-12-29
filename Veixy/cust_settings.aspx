<%@ Page Language="C#" MasterPageFile="~/top_mp.master" AutoEventWireup="true" CodeFile="cust_settings.aspx.cs" Inherits="cust_settings" Title="Veixy-Settings" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table style="font-weight: bolder; font-size: small; width: 586px; color: white; background-color: steelblue" id="Table2" cellspacing="0" border="0">
                <tbody>
                    <tr>
                        <td style="height: 23px" colspan="8">Personal Information</td>
                    </tr>
                </tbody>
            </table>
            <table>
                <tbody>
                    <tr>
                        <td style="width: 35px"></td>
                        <td style="width: 21px"></td>
                        <td style="width: 117px">
                            <asp:FormView ID="FormView1" runat="server" Width="371px" DataSourceID="SqlDataSource1" DataKeyNames="user_id" DefaultMode="Edit">
                                <EditItemTemplate>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td style="font-size: small; width: 123px; color: #003399">User ID: </td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:Label ID="user_idLabel1" runat="server" Text='<%# Eval("user_id") %>' __designer:wfdid="w123"></asp:Label></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 123px; color: #003399">First Name:</td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="TextBox1" runat="server" Width="171px" Text='<%# Bind("f_name") %>' __designer:wfdid="w124"></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 123px; color: #003399">Last Name:&nbsp;</td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="TextBox2" runat="server" Width="171px" Text='<%# Bind("l_name") %>' __designer:wfdid="w125"></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 123px; color: #003399; height: 26px">Password:</td>
                                                <td style="font-size: small; width: 4214px; height: 26px">
                                                    <asp:TextBox ID="user_passTextBox" runat="server" Width="171px" Text='<%# Bind("user_pass") %>' TextMode="Password" __designer:wfdid="w126"></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px; height: 26px">
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" Width="125px" ControlToValidate="TextBox3" ControlToCompare="user_passTextBox" ErrorMessage="Password match fail" __designer:wfdid="w127"></asp:CompareValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="user_passTextBox" ErrorMessage="Enter password" __designer:wfdid="w128"></asp:RequiredFieldValidator></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 123px; color: #003399; height: 26px">Re-Type Password:</td>
                                                <td style="font-size: small; width: 4214px; height: 26px">
                                                    <asp:TextBox ID="TextBox3" runat="server" Width="171px" Text='<%# Bind("user_pass") %>' TextMode="Password" __designer:wfdid="w129"></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px; height: 26px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 123px; color: #003399">Contact # 1:</td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="user_contact_noTextBox" runat="server" Width="171px" Text='<%# Bind("user_contact_no") %>' __designer:wfdid="w130"></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 123px; color: #003399">Contact # 2:</td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="user_contact_no2TextBox" runat="server" Width="171px" Text='<%# Bind("user_contact_no2") %>' __designer:wfdid="w131"></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 123px; color: #003399">Birthdate:</td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="dobTextBox" runat="server" Width="171px" Text='<%# Bind("dob") %>' __designer:wfdid="w132"></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 123px; color: #003399">Country: </td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="countryTextBox" runat="server" Width="171px" Text='<%# Bind("country") %>' __designer:wfdid="w133"></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 123px; color: #003399">City: </td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="cityTextBox" runat="server" Width="171px" Text='<%# Bind("city") %>' __designer:wfdid="w134"></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 123px; color: #003399">Email Address:</td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="email_addTextBox" runat="server" Width="171px" Text='<%# Bind("email_add") %>' __designer:wfdid="w135"></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 123px; color: #003399; height: 87px" valign="top" align="left">Postal Address: </td>
                                                <td style="font-size: small; width: 4214px; height: 87px">
                                                    <asp:TextBox ID="postal_addressTextBox" runat="server" Width="209px" Text='<%# Bind("postal_address") %>' Height="77px" TextMode="MultiLine" __designer:wfdid="w136"></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px; height: 87px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 123px; color: #003399" align="right">
                                                    <asp:Label ID="dummy" runat="server" Width="129px" __designer:wfdid="w137"></asp:Label></td>
                                                <td style="font-size: small; width: 4214px" align="right">&nbsp;<asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg" __designer:wfdid="w138"></asp:Image>
                                                    <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="45px" ForeColor="OliveDrab" Font-Underline="False" Font-Size="Small" Font-Bold="True" BorderWidth="1px" BorderStyle="None" BackColor="Transparent" CommandName="Update" __designer:wfdid="w139">Update</asp:LinkButton></td>
                                                <td style="font-size: small; width: 1700px" align="right"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    &nbsp;
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    user_id:
                                    <asp:TextBox Text='<%# Bind("user_id") %>' runat="server" ID="user_idTextBox" /><br />
                                    user_pass:
                                    <asp:TextBox Text='<%# Bind("user_pass") %>' runat="server" ID="user_passTextBox" /><br />
                                    user_contact_no:
                                    <asp:TextBox Text='<%# Bind("user_contact_no") %>' runat="server" ID="user_contact_noTextBox" /><br />
                                    user_contact_no2:
                                    <asp:TextBox Text='<%# Bind("user_contact_no2") %>' runat="server" ID="user_contact_no2TextBox" /><br />
                                    dob:
                                    <asp:TextBox Text='<%# Bind("dob") %>' runat="server" ID="dobTextBox" /><br />
                                    country:
                                    <asp:TextBox Text='<%# Bind("country") %>' runat="server" ID="countryTextBox" /><br />
                                    city:
                                    <asp:TextBox Text='<%# Bind("city") %>' runat="server" ID="cityTextBox" /><br />
                                    email_add:
                                    <asp:TextBox Text='<%# Bind("email_add") %>' runat="server" ID="email_addTextBox" /><br />
                                    postal_address:
                                    <asp:TextBox Text='<%# Bind("postal_address") %>' runat="server" ID="postal_addressTextBox" /><br />
                                    <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                                    <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    user_id:
                                    <asp:Label ID="user_idLabel" runat="server" Text='<%# Eval("user_id") %>' __designer:wfdid="w114"></asp:Label><br />
                                    user_pass:
                                    <asp:Label ID="user_passLabel" runat="server" Text='<%# Bind("user_pass") %>' __designer:wfdid="w115"></asp:Label><br />
                                    user_contact_no:
                                    <asp:Label ID="user_contact_noLabel" runat="server" Text='<%# Bind("user_contact_no") %>' __designer:wfdid="w116"></asp:Label><br />
                                    user_contact_no2:
                                    <asp:Label ID="user_contact_no2Label" runat="server" Text='<%# Bind("user_contact_no2") %>' __designer:wfdid="w117"></asp:Label><br />
                                    dob:
                                    <asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob") %>' __designer:wfdid="w118"></asp:Label><br />
                                    country:
                                    <asp:Label ID="countryLabel" runat="server" Text='<%# Bind("country") %>' __designer:wfdid="w119"></asp:Label><br />
                                    city:
                                    <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("city") %>' __designer:wfdid="w120"></asp:Label><br />
                                    email_add:
                                    <asp:Label ID="email_addLabel" runat="server" Text='<%# Bind("email_add") %>' __designer:wfdid="w121"></asp:Label><br />
                                    postal_address:
                                    <asp:Label ID="postal_addressLabel" runat="server" Text='<%# Bind("postal_address") %>' __designer:wfdid="w122"></asp:Label><br />
                                </ItemTemplate>
                            </asp:FormView>
                            <asp:Label ID="Label1" runat="server" Width="251px" ForeColor="Maroon" Text="Settings Updated" __designer:wfdid="w113" Visible="False"></asp:Label></td>
                    </tr>
                </tbody>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" UpdateCommand="UPDATE [user_info] SET [user_pass] = @user_pass, [user_contact_no] = @user_contact_no, [user_contact_no2] = @user_contact_no2, [dob] = @dob, [country] = @country, [city] = @city, [email_add] = @email_add, [postal_address] = @postal_address WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [user_info] ([user_id], [user_pass], [user_contact_no], [user_contact_no2], [dob], [country], [city], [email_add], [postal_address]) VALUES (@user_id, @user_pass, @user_contact_no, @user_contact_no2, @dob, @country, @city, @email_add, @postal_address)" DeleteCommand="DELETE FROM [user_info] WHERE [user_id] = @user_id" SelectCommand="SELECT * FROM [user_info] WHERE ([user_id] = @user_id)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                <SelectParameters>
                    <asp:SessionParameter Name="user_id" SessionField="user_session" Type="String" />
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
            <table style="font-weight: bolder; font-size: small; width: 586px; color: white; background-color: steelblue" id="Table1" cellspacing="0" border="0">
                <tbody>
                    <tr>
                        <td style="height: 23px" colspan="8">Application Behavior</td>
                    </tr>
                </tbody>
            </table>
            <table>
                <tbody>
                    <tr>
                        <td style="width: 680px; height: 31px"></td>
                        <td style="font-size: small; width: 2011px; color: #003399; height: 31px">Email alert on ticket open/close:</td>
                        <td style="font-size: small; width: 716px; height: 31px">
                            <asp:CheckBox ID="CheckBox1" runat="server"></asp:CheckBox></td>
                        <td style="font-size: small; width: 4214px; height: 31px"></td>
                    </tr>
                    <tr>
                        <td style="width: 680px"></td>
                        <td style="font-size: small; width: 2011px; color: #003399">SMS alert on ticket open/close:</td>
                        <td style="font-size: small; width: 716px">
                            <asp:CheckBox ID="CheckBox2" runat="server"></asp:CheckBox></td>
                        <td style="font-size: small; width: 4214px"></td>
                    </tr>
                    <tr>
                        <td style="width: 680px; height: 22px"></td>
                        <td style="font-size: small; width: 2011px; color: #003399; height: 22px">Product/Services email alert:&nbsp;</td>
                        <td style="font-size: small; width: 716px; height: 22px">
                            <asp:CheckBox ID="CheckBox3" runat="server"></asp:CheckBox></td>
                        <td style="font-size: small; width: 4214px; height: 22px"></td>
                    </tr>
                    <tr>
                        <td style="width: 680px"></td>
                        <td style="font-size: small; width: 2011px; color: #003399">SMS alert on ticket progress:</td>
                        <td style="font-size: small; width: 716px; height: 26px">
                            <asp:CheckBox ID="CheckBox4" runat="server"></asp:CheckBox></td>
                        <td style="font-size: small; width: 4214px; height: 26px"></td>
                    </tr>
                    <tr>
                        <td style="width: 680px"></td>
                        <td style="font-size: small; width: 2011px; color: #003399">Payment alerts:</td>
                        <td style="font-size: small; width: 716px; height: 26px">
                            <asp:CheckBox ID="CheckBox5" runat="server"></asp:CheckBox></td>
                        <td style="font-size: small; width: 4214px; height: 26px"></td>
                    </tr>
                    <tr>
                        <td style="width: 680px"></td>
                        <td style="font-size: small; width: 2011px; color: #003399">Appointment alerts:</td>
                        <td style="font-size: small; width: 716px">
                            <asp:CheckBox ID="CheckBox6" runat="server"></asp:CheckBox></td>
                        <td style="font-size: small; width: 4214px"></td>
                    </tr>
                    <tr>
                        <td style="width: 680px"></td>
                        <td style="font-size: small; width: 2011px; color: #003399">Call alerts:</td>
                        <td style="font-size: small; width: 716px">
                            <asp:CheckBox ID="CheckBox7" runat="server"></asp:CheckBox></td>
                        <td style="font-size: small; width: 4214px"></td>
                    </tr>
                    <tr>
                        <td style="width: 680px"></td>
                        <td style="font-size: small; width: 2011px; color: #003399">Message alerts:</td>
                        <td style="font-size: small; width: 716px">
                            <asp:CheckBox ID="CheckBox8" runat="server"></asp:CheckBox></td>
                        <td style="font-size: small; width: 4214px"></td>
                    </tr>
                </tbody>
            </table>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" __designer:wfdid="w141">
                <ContentTemplate>
                    <table style="width: 477px">
                        <tbody>
                            <tr>
                                <td style="width: 471px; height: 20px"></td>
                                <td style="width: 8px; height: 20px">
                                    <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg" __designer:wfdid="w142"></asp:Image></td>
                                <td style="width: 100px; height: 20px">
                                    <asp:LinkButton ID="LinkButton17" OnClick="LinkButton17_Click" runat="server" Width="45px" ForeColor="OliveDrab" Font-Underline="False" Font-Size="Small" Font-Bold="True" BorderWidth="1px" BorderStyle="None" BackColor="Transparent" __designer:wfdid="w143">Update</asp:LinkButton></td>
                            </tr>
                        </tbody>
                    </table>
                    <asp:Label ID="Label13" runat="server" Width="251px" ForeColor="Maroon" Text="Settings Updated" __designer:wfdid="w144" Visible="False"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>
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
</asp:Content>