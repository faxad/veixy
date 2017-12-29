<%@ Page Language="C#" MasterPageFile="~/user_mp.master" AutoEventWireup="true" CodeFile="user_profile.aspx.cs" Inherits="staff_inbox" Title="Veixy-Profile" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>

    &nbsp;<br />
    <br />

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">

        <ContentTemplate>
            <table style="font-weight: bolder; font-size: small; width: 586px; color: white; background-color: steelblue" id="Table2" cellspacing="0" border="0" __designer:dtid="281474976710675">
                <tbody __designer:dtid="281474976710676">
                    <tr __designer:dtid="281474976710677">
                        <td style="height: 23px" colspan="8" __designer:dtid="281474976710678">Customer's Info</td>
                    </tr>
                </tbody>
            </table>
            <table>
                <tbody>
                    <tr>
                        <td style="width: 35px"></td>
                        <td style="width: 45px"></td>
                        <td style="width: 117px">
                            <asp:FormView ID="FormView1" runat="server" DefaultMode="Edit" DataKeyNames="user_id" DataSourceID="SqlDataSource1" __designer:wfdid="w128" Width="343px">
                                <EditItemTemplate>
                                    <br />
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td style="font-size: small; color: #003399">User ID: </td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:Label ID="user_idLabel1" runat="server" __designer:wfdid="w36" Text='<%# Eval("user_id") %>'></asp:Label></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; color: #003399; height: 26px">Password:</td>
                                                <td style="font-size: small; width: 4214px; height: 26px">
                                                    <asp:TextBox ID="user_passTextBox" runat="server" __designer:wfdid="w37" Width="171px" Text='<%# Bind("user_pass") %>' OnTextChanged="user_passTextBox_TextChanged"></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px; height: 26px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; color: #003399">Contact # 1:</td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="user_contact_noTextBox" runat="server" __designer:wfdid="w38" Width="171px" Text='<%# Bind("user_contact_no") %>'></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; color: #003399">Contact # 2:</td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="user_contact_no2TextBox" runat="server" __designer:wfdid="w39" Width="171px" Text='<%# Bind("user_contact_no2") %>'></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; color: #003399">Birthdate:</td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="dobTextBox" runat="server" __designer:wfdid="w40" Width="171px" Text='<%# Bind("dob") %>'></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; color: #003399">Country: </td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="countryTextBox" runat="server" __designer:wfdid="w41" Width="171px" Text='<%# Bind("country") %>'></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; color: #003399">City: </td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="cityTextBox" runat="server" __designer:wfdid="w42" Width="171px" Text='<%# Bind("city") %>'></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; color: #003399">Email Address:</td>
                                                <td style="font-size: small; width: 4214px">
                                                    <asp:TextBox ID="email_addTextBox" runat="server" __designer:wfdid="w43" Width="171px" Text='<%# Bind("email_add") %>'></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; color: #003399; height: 87px" valign="top" align="left">Postal Address: </td>
                                                <td style="font-size: small; width: 4214px; height: 87px">
                                                    <asp:TextBox ID="postal_addressTextBox" runat="server" __designer:wfdid="w44" Width="254px" Height="116px" TextMode="MultiLine" Text='<%# Bind("postal_address") %>'></asp:TextBox></td>
                                                <td style="font-size: small; width: 1700px; height: 87px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; color: #003399" align="right">
                                                    <asp:Label ID="dummy" runat="server" __designer:wfdid="w45" Width="91px"></asp:Label></td>
                                                <td style="font-size: small; width: 4214px" align="right">&nbsp;<asp:Image ID="Image8" runat="server" __designer:dtid="281474976710710" __designer:wfdid="w46" ImageUrl="~/Images/send_but.jpg"></asp:Image>
                                                    <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" __designer:dtid="281474976710711" __designer:wfdid="w47" Width="45px" ForeColor="OliveDrab" Font-Size="Small" BorderWidth="1px" BackColor="Transparent" BorderStyle="None" Font-Underline="False" Font-Bold="True" CommandName="Update">Update</asp:LinkButton></td>
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
                                    <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    user_id:
                                    <asp:Label ID="user_idLabel" runat="server" __designer:wfdid="w27" Text='<%# Eval("user_id") %>'></asp:Label><br />
                                    user_pass:
                                    <asp:Label ID="user_passLabel" runat="server" __designer:wfdid="w28" Text='<%# Bind("user_pass") %>'></asp:Label><br />
                                    user_contact_no:
                                    <asp:Label ID="user_contact_noLabel" runat="server" __designer:wfdid="w29" Text='<%# Bind("user_contact_no") %>'></asp:Label><br />
                                    user_contact_no2:
                                    <asp:Label ID="user_contact_no2Label" runat="server" __designer:wfdid="w30" Text='<%# Bind("user_contact_no2") %>'></asp:Label><br />
                                    dob:
                                    <asp:Label ID="dobLabel" runat="server" __designer:wfdid="w31" Text='<%# Bind("dob") %>'></asp:Label><br />
                                    country:
                                    <asp:Label ID="countryLabel" runat="server" __designer:wfdid="w32" Text='<%# Bind("country") %>'></asp:Label><br />
                                    city:
                                    <asp:Label ID="cityLabel" runat="server" __designer:wfdid="w33" Text='<%# Bind("city") %>'></asp:Label><br />
                                    email_add:
                                    <asp:Label ID="email_addLabel" runat="server" __designer:wfdid="w34" Text='<%# Bind("email_add") %>'></asp:Label><br />
                                    postal_address:
                                    <asp:Label ID="postal_addressLabel" runat="server" __designer:wfdid="w35" Text='<%# Bind("postal_address") %>'></asp:Label><br />
                                </ItemTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </tbody>
            </table>
            &nbsp;&nbsp;
        </ContentTemplate>
    </asp:UpdatePanel>
    &nbsp;
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                SelectCommand="SELECT * FROM [user_info] WHERE ([user_id] = @user_id)" DeleteCommand="DELETE FROM [user_info] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [user_info] ([user_id], [user_pass], [user_contact_no], [user_contact_no2], [dob], [country], [city], [email_add], [postal_address]) VALUES (@user_id, @user_pass, @user_contact_no, @user_contact_no2, @dob, @country, @city, @email_add, @postal_address)" UpdateCommand="UPDATE [user_info] SET [user_pass] = @user_pass, [user_contact_no] = @user_contact_no, [user_contact_no2] = @user_contact_no2, [dob] = @dob, [country] = @country, [city] = @city, [email_add] = @email_add, [postal_address] = @postal_address WHERE [user_id] = @user_id">
                <SelectParameters>
                    <asp:QueryStringParameter Name="user_id" QueryStringField="user_query" Type="String" />
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
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <div style="z-index: 102; left: 222px; width: 100px; position: absolute; top: 98px; height: 100px">
        &nbsp;<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2"
            DisplayAfter="1">
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
                &nbsp;
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    &nbsp;<br />
    <br />
</asp:Content>