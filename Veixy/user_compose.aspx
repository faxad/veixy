<%@ Page Language="C#" MasterPageFile="~/user_mp.master" AutoEventWireup="true" CodeFile="user_compose.aspx.cs" Inherits="staff_inbox" Title="Veixy-Compose Ticket" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

        function setMouseOverColor(element) {
            element.style.cursor = 'hand';
        }
    </script>

    &nbsp;<br />
    <br />

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">

        <ContentTemplate>
            <div style="z-index: 101; left: 3px; width: 1px; position: absolute; top: 11px; height: 100px" __designer:dtid="1970324836974593">
                &nbsp;<table __designer:dtid="1970324836974594">
                    <tbody>
                        <tr __designer:dtid="1970324836974595">
                            <td style="font-size: small; width: 373px; height: 137px" colspan="2" __designer:dtid="1970324836974596">
                                <table __designer:dtid="1970324836974597">
                                    <tbody>
                                        <tr __designer:dtid="1970324836974598">
                                            <td style="width: 100px; height: 32px" __designer:dtid="1970324836974599">
                                                <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" __designer:dtid="1970324836974600" ImageUrl="~/Images/send_img.jpg" __designer:wfdid="w492"></asp:ImageButton></td>
                                            <td style="width: 100px; height: 32px" __designer:dtid="1970324836974601">
                                                <asp:ImageButton ID="ImageButton2" runat="server" __designer:dtid="1970324836974602" ImageUrl="~/Images/cancel_img.jpg" __designer:wfdid="w493"></asp:ImageButton></td>
                                            <td style="width: 100px; height: 32px" __designer:dtid="1970324836974603"></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table style="width: 542px">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" __designer:wfdid="w101" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                                                    <asp:ListItem Selected="True" Value="1">Compose a new ticket</asp:ListItem>
                                                    <asp:ListItem Value="2">Post a reply to an existing ticket</asp:ListItem>
                                                </asp:RadioButtonList></td>
                                            <td style="width: 224px" align="center">&nbsp;Topic Category&nbsp;
                                                <asp:DropDownList ID="DropDownList1" runat="server" __designer:wfdid="w503" DataSourceID="SqlDataSource1" DataTextField="prod_name" DataValueField="prod_name"></asp:DropDownList><br __designer:dtid="1970324836974619" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" __designer:dtid="1970324836974632" __designer:wfdid="w498" SelectCommand="SELECT [prod_title] FROM [my_product] WHERE ([user_name] = @user_name)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="user_query" Name="user_name" Type="String"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <table style="width: 552px" __designer:dtid="1970324836974607">
                                    <tbody>
                                        <tr __designer:dtid="1970324836974608">
                                            <td style="width: 44px; height: 43px" __designer:dtid="1970324836974609"></td>
                                            <td style="width: 236px; height: 43px" __designer:dtid="1970324836974610">
                                                <asp:TextBox ID="TextBox1" runat="server" __designer:dtid="1970324836974611" __designer:wfdid="w495" BorderColor="YellowGreen"></asp:TextBox>&nbsp; (Token #)</td>
                                            <td style="height: 43px" __designer:dtid="1970324836974612">
                                                <asp:Label ID="Label1" runat="server" __designer:wfdid="w91" ForeColor="Maroon" BackColor="LemonChiffon" Visible="False" Font-Size="Small" Width="224px"></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table __designer:dtid="1970324836974613">
                                    <tbody>
                                        <tr __designer:dtid="1970324836974614">
                                            <td style="width: 100px; height: 26px" __designer:dtid="1970324836974615">Subject:</td>
                                            <td style="width: 99px; height: 26px" __designer:dtid="1970324836974616">
                                                <asp:TextBox ID="TextBox2" runat="server" __designer:dtid="1970324836974617" __designer:wfdid="w496" BorderColor="YellowGreen" Width="495px"></asp:TextBox></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td style="width: 104px; height: 137px" colspan="1" __designer:dtid="1970324836974618">&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
                <table style="width: 743px" __designer:dtid="1970324836974633">
                    <tbody>
                        <tr __designer:dtid="1970324836974634">
                            <td style="font-size: small; width: 21px" __designer:dtid="1970324836974635">Message</td>
                            <td style="width: 100px" __designer:dtid="1970324836974636"></td>
                        </tr>
                        <tr __designer:dtid="1970324836974637">
                            <td style="height: 40px" colspan="2" __designer:dtid="1970324836974638">
                                <asp:TextBox ID="TextBox3" runat="server" __designer:dtid="1970324836974639" __designer:wfdid="w499" BorderColor="YellowGreen" Width="574px" TextMode="MultiLine" Height="206px"></asp:TextBox></td>
                        </tr>
                    </tbody>
                </table>
                <br __designer:dtid="1970324836974640" />
                <br __designer:dtid="1970324836974641" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    &nbsp; &nbsp; &nbsp;
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