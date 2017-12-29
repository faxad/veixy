<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_edit_prof.aspx.cs" Inherits="staff_edit_prof" Title="Veixy-Edit Profile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    &nbsp;
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="font-size: small; width: 628px">
                <tbody>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px">.</td>
                        <td style="width: 101px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px" valign="middle">
                            <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Font-Underline="False" Font-Bold="True" CssClass="bar_format" CommandName="Update" Font-Size="Small" ForeColor="OliveDrab" Height="18px" Width="98px">Load My Profile</asp:LinkButton>
                            (click </td>
                        <td valign="bottom" colspan="2">here to load profile)</td>
                        <td style="width: 100px; color: #000000" align="right">
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="SteelBlue" Width="144px" Text="Staff Profile"></asp:Label></td>
                    </tr>
                    <tr style="color: #000000">
                        <td style="width: 10px"></td>
                        <td style="width: 136px">Staff ID:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="20">.</asp:TextBox></td>
                        <td colspan="2">&nbsp;<asp:Label ID="Label1" runat="server" ForeColor="Red" Width="89px"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Invalid Selection" ControlToValidate="TextBox1"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px">Password:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox2" runat="server" Width="149px" MaxLength="20"></asp:TextBox></td>
                        <td style="width: 133px">Re-type Password:</td>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox3" runat="server" Width="140px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px">First Name:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox4" runat="server" MaxLength="20"></asp:TextBox></td>
                        <td colspan="2">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password match error" ControlToValidate="TextBox3" ControlToCompare="TextBox2"></asp:CompareValidator></td>
                    </tr>
                    <tr style="color: #000000">
                        <td style="width: 10px"></td>
                        <td style="width: 136px">Last &nbsp;Name:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox5" runat="server" MaxLength="20"></asp:TextBox></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px">Birthdate:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
                        <td colspan="2">
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox13"></cc1:CalendarExtender>
                            <asp:RangeValidator ID="RangeValidator4" runat="server" ErrorMessage="Invalid Date" ControlToValidate="TextBox13" Type="Date" MaximumValue="01/01/2020" MinimumValue="01/01/1930"></asp:RangeValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px">Country:</td>
                        <td style="width: 101px">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="137px">
                                <asp:ListItem>Pakistan</asp:ListItem>
                                <asp:ListItem>India</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px">City:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox6" runat="server" MaxLength="20"></asp:TextBox></td>
                        <td style="width: 127px">
                            <asp:Label ID="Label2" runat="server" ForeColor="Red" Width="131px"></asp:Label></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px">Contact No:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox7" runat="server" MaxLength="18"></asp:TextBox></td>
                        <td style="width: 127px">Alternate Contact No:</td>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox8" runat="server" Width="140px" MaxLength="18"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px">Email Address:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
                        <td style="width: 127px">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email Format" ControlToValidate="TextBox9" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px">Staff Identification No:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox11" runat="server" MaxLength="18" ReadOnly="True"></asp:TextBox></td>
                        <td style="color: darkgray" valign="middle" align="left" colspan="2">
                            <img style="width: 19px; height: 18px" src="Images/i_sign.jpg" />
                            A notification to the administrator will be</td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px">Designation Title:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox12" runat="server" MaxLength="20"></asp:TextBox></td>
                        <td style="color: darkgray" colspan="2">&nbsp; &nbsp; &nbsp; &nbsp;sent regarding any change in the profile. </td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px">Postal Address:</td>
                        <td style="width: 101px" rowspan="4">
                            <asp:TextBox ID="TextBox10" runat="server" Height="68px" MaxLength="500" TextMode="MultiLine"></asp:TextBox></td>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px"></td>
                        <td align="center" colspan="2">
                            <asp:Label ID="Label4" runat="server" ForeColor="Red" Width="156px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px"></td>
                        <td style="width: 101px" align="right">
                            <table style="width: 178px">
                                <tbody>
                                    <tr>
                                        <td style="width: 1294px">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                        <td style="width: 100px">
                                            <asp:LinkButton ID="LinkButton14" OnClick="LinkButton14_Click" runat="server" Font-Underline="False" Font-Bold="True" CssClass="bar_format" CommandName="Update" Font-Size="Small" ForeColor="OliveDrab" Height="21px" Width="89px">Update Profile</asp:LinkButton></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px"></td>
                        <td style="width: 101px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px">.</td>
                        <td style="width: 101px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 136px"></td>
                        <td style="width: 101px" align="left"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                </tbody>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    &nbsp;
</asp:Content>