<%@ Page Language="C#" MasterPageFile="~/top_mp5.master" AutoEventWireup="true" CodeFile="cust_cappoint.aspx.cs" Inherits="cust_appoint" Title="Veixy-Create Appointment" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel2" runat="server" Width="585px" Height="358px">
                <table style="width: 278px">
                    <tbody>
                        <tr>
                            <td style="width: 129px"><strong style="color: darkgray">Create Appointment</strong></td>
                            <td style="width: 131px">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/arrow_down.jpg"></asp:Image></td>
                        </tr>
                    </tbody>
                </table>
                <div style="z-index: 102; left: -134px; width: 100px; position: absolute; top: 272px; height: 158px" __designer:dtid="4785074604081157">
                    <img src="Images_Net/ATC_1298.jpg" __designer:dtid="4785074604081158" />
                </div>
                <br />
                <table>
                    <tbody>
                        <tr>
                            <td style="width: 44px">
                                <asp:Label ID="Label5" runat="server" Width="67px" ForeColor="SteelBlue" Text="Date/Time:"></asp:Label></td>
                            <td style="width: 100px">
                                <rad:RadDateTimePicker ID="RadDateTimePicker1" runat="server">
                                </rad:RadDateTimePicker>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 44px"></td>
                            <td style="width: 100px">
                                <asp:Label ID="Label6" runat="server" Width="198px" ForeColor="#C00000" Text="(mm/dd/yyyy hh:mm:ss am/pm)"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
                <table>
                    <tbody>
                        <tr>
                            <td style="width: 65px">Contact #:</td>
                            <td style="width: 206px">
                                <asp:TextBox ID="TextBox2" runat="server" Width="101px"></asp:TextBox></td>
                            <td style="width: 40px">
                                <asp:Label ID="Label4" runat="server" Width="52px" ForeColor="SteelBlue" Text="Status:"></asp:Label></td>
                            <td style="width: 100px">
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="103px" Enabled="False">
                                    <asp:ListItem>-----</asp:ListItem>
                                    <asp:ListItem Selected="True">Pending</asp:ListItem>
                                    <asp:ListItem>Approved</asp:ListItem>
                                    <asp:ListItem>Closed</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                    </tbody>
                </table>
                <table cellspacing="0">
                    <tbody>
                        <tr>
                            <td style="width: 100px">
                                <asp:Label ID="Label3" runat="server" ForeColor="DarkGray" Text="Description:"></asp:Label></td>
                            <td style="width: 68px">
                                <asp:Label ID="Label2" runat="server" Width="72px"></asp:Label></td>
                            <td style="width: 100px"></td>
                        </tr>
                        <tr>
                            <td valign="top" colspan="3">
                                <asp:TextBox ID="TextBox1" runat="server" Width="487px" Text='<%# Eval("app_detail") %>' Height="188px" TextMode="MultiLine"></asp:TextBox>&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
                <table>
                    <tbody>
                        <tr>
                            <td style="width: 311px; height: 20px"></td>
                            <td style="width: 100px; height: 20px" align="right">
                                <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                            <td style="height: 20px">
                                <asp:LinkButton ID="LinkButton7" OnClick="LinkButton7_Click" runat="server" Width="59px" ForeColor="OliveDrab" Font-Underline="False" Font-Size="Small" Font-Bold="True" BorderWidth="1px" BorderStyle="None" BackColor="Transparent">Create</asp:LinkButton></td>
                        </tr>
                    </tbody>
                </table>
            </asp:Panel>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div style="z-index: 101; left: 509px; width: 202px; position: absolute; top: 0px; height: 390px">
        <img src="Images_Net/Apt_time.jpg" />
    </div>
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
                <asp:Label ID="Label29" runat="server" Font-Size="X-Small" Font-Underline="False"
                    ForeColor="Gray" Text="© Veixy.com"></asp:Label></td>
            <td style="width: 98px"></td>
        </tr>
    </table>
</asp:Content>