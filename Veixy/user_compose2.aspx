<%@ Page Language="C#" MasterPageFile="~/user_mp.master" AutoEventWireup="true" CodeFile="user_compose2.aspx.cs" Inherits="staff_inbox" Title="Veixy-Compose Ticket" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 593px">
                <tbody>
                    <tr>
                        <td style="width: 373px; height: 137px" colspan="2">
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width: 100px; height: 32px" valign="bottom">
                                            <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" ImageUrl="~/Images/send_img.jpg"></asp:ImageButton></td>
                                        <td style="width: 100px; height: 32px" valign="bottom">
                                            <asp:ImageButton ID="ImageButton2" OnClick="ImageButton2_Click" runat="server" ImageUrl="~/Images/cancel_img.jpg"></asp:ImageButton></td>
                                        <td style="width: 100px; height: 32px"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True" Font-Size="Small">
                                <asp:ListItem Selected="True" Value="1">Compose a new ticket</asp:ListItem>
                                <asp:ListItem Value="2">Post a reply to an existing ticket</asp:ListItem>
                            </asp:RadioButtonList>
                            <table style="font-size: small; width: 556px">
                                <tbody>
                                    <tr>
                                        <td style="width: 112px"></td>
                                        <td style="width: 100px">
                                            <asp:TextBox ID="TextBox1" runat="server" BorderColor="YellowGreen"></asp:TextBox></td>
                                        <td style="width: 143px">(Token #) </td>
                                        <td style="width: 167px">Topic Category</td>
                                        <td style="width: 100px">
                                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="prod_title" DataValueField="prod_title" Width="159px"></asp:DropDownList></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width: 91px"></td>
                                        <td style="width: 190px">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Size="Small" Width="151px" ErrorMessage="Specify your ticket #" ControlToValidate="TextBox1" Enabled="False"></asp:RequiredFieldValidator></td>
                                        <td style="width: 100px"></td>
                                        <td style="width: 100px">
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" Font-Size="Small" ErrorMessage="CustomValidator" ControlToValidate="TextBox2"></asp:CustomValidator></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="font-size: small">
                                <tbody>
                                    <tr>
                                        <td style="width: 100px; height: 26px">Subject:</td>
                                        <td style="width: 99px; height: 26px">
                                            <asp:TextBox ID="TextBox2" runat="server" BorderColor="YellowGreen" Width="495px"></asp:TextBox></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT [prod_title] FROM [my_product] WHERE ([user_name] = @user_name)" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="user_name" QueryStringField="user_query" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <table style="font-size: small; width: 460px">
                                <tbody>
                                    <tr>
                                        <td style="width: 226px; height: 19px"></td>
                                        <td style="width: 100px; height: 19px">
                                            <asp:Label ID="Label1" runat="server" Font-Size="Small" Width="224px" ForeColor="Maroon" BackColor="LemonChiffon" Visible="False"></asp:Label></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div style="z-index: 102; left: 417px; width: 100px; position: absolute; top: 41px; height: 100px">
                                &nbsp;<asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="1">
                                    <ProgressTemplate>
                                        <table>
                                            <tr>
                                                <td style="width: 66px; height: 21px"></td>
                                                <td style="width: 56px; height: 21px">
                                                    <img src="Images/ajax-loader2.gif" /></td>
                                                <td style="width: 100px; height: 21px">
                                                    <img src="Images/still-processing.gif" id="IMG1" onclick="return IMG1_onclick()" /></td>
                                            </tr>
                                        </table>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </td>
                        <td style="width: 104px; height: 137px" colspan="1">&nbsp;
                            <div style="z-index: 101; left: 622px; width: 132px; position: absolute; top: 65px; height: 165px">
                                <img src="Images_Net/livesupport.gif" />
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table style="font-size: small; width: 595px">
                <tbody>
                    <tr>
                        <td style="width: 682px">Message</td>
                        <td style="width: 100px" align="right">
                            <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Font-Size="X-Small" ForeColor="Green" Font-Underline="True">(Refresh All)</asp:LinkButton></td>
                    </tr>
                    <tr>
                        <td style="height: 40px" colspan="2">
                            <asp:TextBox ID="TextBox3" runat="server" BorderColor="YellowGreen" Width="584px" TextMode="MultiLine" Height="225px"></asp:TextBox></td>
                    </tr>
                </tbody>
            </table>
            <table style="width: 591px">
                <tbody>
                    <tr>
                        <td style="width: 351px"></td>
                        <td style="width: 31px">
                            <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="X-Small" Width="51px" ForeColor="SteelBlue" Font-Underline="False" NavigateUrl="~/about_us.aspx">About Us</asp:HyperLink></td>
                        <td>
                            <img src="Images/lint_v.jpg" /></td>
                        <td style="width: 62px">
                            <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="X-Small" Width="53px" ForeColor="SteelBlue" Font-Underline="False" NavigateUrl="~/contact_us.aspx">Contact Us</asp:HyperLink></td>
                        <td>
                            <img src="Images/lint_v.jpg" /></td>
                        <td style="width: 100px">
                            <asp:Label ID="Label221" runat="server" Font-Size="X-Small" ForeColor="Gray" Font-Underline="False" Text="© Veixy.com"></asp:Label></td>
                        <td style="width: 98px"></td>
                    </tr>
                </tbody>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
    <br />
</asp:Content>