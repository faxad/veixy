<%@ Page Language="C#" MasterPageFile="~/top_mp.master" AutoEventWireup="true" CodeFile="cust_reg.aspx.cs" Inherits="cust_reg" Title="Veixy-Register" %>

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
                        <td style="width: 168px"><strong><span style="color: #a9a9a9">Customer's Registration</span></strong></td>
                        <td style="width: 101px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px">.</td>
                        <td style="width: 101px">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Invalid Selection" ControlToValidate="TextBox1"></asp:RequiredFieldValidator></td>
                        <td style="width: 127px; color: #000000"></td>
                        <td style="width: 100px; color: #000000"></td>
                    </tr>
                    <tr style="color: #000000">
                        <td style="width: 10px"></td>
                        <td style="width: 168px">Customer ID:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="20"></asp:TextBox></td>
                        <td valign="bottom" colspan="2">
                            <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" CommandName="Update" CssClass="bar_format" Font-Bold="True" Font-Size="Small" Height="19px" Width="111px" Font-Underline="False" ForeColor="OliveDrab">Check Availability</asp:LinkButton>
                            <asp:Label ID="Label1" runat="server" Width="89px" ForeColor="Red"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px">Password:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox2" runat="server" MaxLength="20" Width="149px" TextMode="Password"></asp:TextBox></td>
                        <td style="width: 133px">Re-type Password:</td>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox3" runat="server" Width="140px" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px">First Name:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox4" runat="server" MaxLength="20"></asp:TextBox></td>
                        <td colspan="2">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password match error" ControlToValidate="TextBox3" ControlToCompare="TextBox2"></asp:CompareValidator></td>
                    </tr>
                    <tr style="color: #000000">
                        <td style="width: 10px"></td>
                        <td style="width: 168px">Last &nbsp;Name:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox5" runat="server" MaxLength="20"></asp:TextBox></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px">Birthdate:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
                        <td colspan="2">
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox13"></cc1:CalendarExtender>
                            <asp:RangeValidator ID="RangeValidator4" runat="server" ErrorMessage="Invalid Date" ControlToValidate="TextBox13" Type="Date" MinimumValue="01/01/1940" MaximumValue="01/01/2020"></asp:RangeValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px">Country:</td>
                        <td style="width: 101px">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="191px"></asp:DropDownList></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px">City:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox6" runat="server" MaxLength="20" Width="184px"></asp:TextBox></td>
                        <td style="width: 127px">
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Invalid Contact No." ControlToValidate="TextBox7" Type="Double"></asp:RangeValidator></td>
                        <td style="width: 100px">
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Invalid Contact No." ControlToValidate="TextBox8" Width="118px" Type="Double"></asp:RangeValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px">Contact No:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox7" runat="server" MaxLength="18" Width="183px"></asp:TextBox></td>
                        <td style="width: 127px">Alternate Contact No:</td>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox8" runat="server" MaxLength="18" Width="140px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px">Email Address:</td>
                        <td style="width: 101px">
                            <asp:TextBox ID="TextBox9" runat="server" Width="182px"></asp:TextBox></td>
                        <td style="width: 127px">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email Format" ControlToValidate="TextBox9" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px">Postal Address:</td>
                        <td style="width: 101px" rowspan="6">
                            <asp:TextBox ID="TextBox10" runat="server" MaxLength="500" Height="109px" TextMode="MultiLine"></asp:TextBox></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px"></td>
                        <td style="width: 101px" align="right">
                            <table style="width: 178px">
                                <tbody>
                                    <tr>
                                        <td style="width: 1294px">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                        <td style="width: 100px">
                                            <asp:LinkButton ID="LinkButton14" OnClick="LinkButton14_Click" runat="server" CommandName="Update" CssClass="bar_format" Font-Bold="True" Font-Size="Small" Height="21px" Width="52px" Font-Underline="False" ForeColor="OliveDrab">Register</asp:LinkButton></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px"></td>
                        <td style="width: 101px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px">.</td>
                        <td style="width: 101px"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td style="width: 168px"></td>
                        <td style="width: 101px" align="left"></td>
                        <td style="width: 127px"></td>
                        <td style="width: 100px"></td>
                    </tr>
                </tbody>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>