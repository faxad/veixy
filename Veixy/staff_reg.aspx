<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_reg.aspx.cs" Inherits="staff_reg" Title="Veixy- Staff Registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="font-size: small; width: 628px">
                <tbody>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px"><strong style="color: darkgray">Staff's Registration</strong></td>
                        <td style="width: 101px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">.</td>
                        <td style="width: 101px">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Invalid Selection" ControlToValidate="TextBox1"></asp:RequiredFieldValidator></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">Staff ID:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="20"></asp:TextBox></td>
                        <td colspan="2">
                            <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" CommandName="Update" CssClass="bar_format" Font-Bold="True" Font-Underline="False" Font-Size="Small" ForeColor="OliveDrab" Height="21px" Width="111px">Check Availability</asp:LinkButton>
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Width="89px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">Password:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox2" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox></td>
                        <td style="width: 133px">Re-type Password:</td>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox3" runat="server" Width="140px" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">First Name:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox4" runat="server" MaxLength="20" OnTextChanged="TextBox4_TextChanged"></asp:TextBox></td>
                        <td colspan="2">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password match error" ControlToValidate="TextBox3" ControlToCompare="TextBox2"></asp:CompareValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">Last &nbsp;Name:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox5" runat="server" MaxLength="20"></asp:TextBox></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">Birthdate:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
                        <td colspan="2">
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox13"></cc1:CalendarExtender>
                            <asp:RangeValidator ID="RangeValidator4" runat="server" ErrorMessage="Invalid Date" ControlToValidate="TextBox13" Type="Date" MinimumValue="01/01/1940" MaximumValue="01/01/2020"></asp:RangeValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">Country:</td>
                        <td style="width: 101px">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="178px">
                                <asp:ListItem>Pakistan</asp:ListItem>
                                <asp:ListItem>India</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">City:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox6" runat="server" MaxLength="20" Width="171px" OnTextChanged="TextBox6_TextChanged"></asp:TextBox></td>
                        <td style="width: 127px">
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Invalid Contact No." ControlToValidate="TextBox7" Type="Double"></asp:RangeValidator></td>
                        <td style="width: 100px">
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Invalid Contact No." ControlToValidate="TextBox8" Width="118px" Type="Double"></asp:RangeValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">Contact No:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox7" runat="server" MaxLength="18" Width="170px"></asp:TextBox></td>
                        <td style="width: 127px">Alternate Contact No:</td>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox8" runat="server" MaxLength="18" Width="140px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">Email Address:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox9" runat="server" Width="170px"></asp:TextBox></td>
                        <td style="width: 127px">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email Format" ControlToValidate="TextBox9" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">Staff Identification No:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox11" runat="server" MaxLength="18" Width="170px"></asp:TextBox></td>
                        <td style="width: 127px">
                            <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="Invalid Staff ID #" ControlToValidate="TextBox11" Type="Double" MinimumValue="11111" MaximumValue="99999"></asp:RangeValidator></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">Designation Title:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox12" runat="server" MaxLength="20" Width="170px" OnTextChanged="TextBox12_TextChanged"></asp:TextBox></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">Postal Address:</td>
                        <td style="width: 101px" rowspan="4">
                            <asp:TextBox ID="TextBox10" runat="server" MaxLength="500" Height="68px" TextMode="MultiLine"></asp:TextBox></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px"></td>
                        <td style="width: 101px" align="right">
                            <table style="width: 178px">
                                <tbody>
                                    <tr>
                                        <td style="width: 1294px">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                        <td style="width: 100px">
                                            <asp:LinkButton ID="LinkButton14" OnClick="LinkButton14_Click" runat="server" CommandName="Update" CssClass="bar_format" Font-Bold="True" Font-Underline="False" Font-Size="Small" ForeColor="OliveDrab" Height="21px" Width="52px">Register</asp:LinkButton></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px"></td>
                        <td style="width: 101px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px">.</td>
                        <td style="width: 101px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 133px"></td>
                        <td style="width: 101px" align="left"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                </tbody>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>