<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_login" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 274px"></td>
            <td style="width: 24px"></td>
            <td style="width: 165px; color: white">.</td>
            <td style="width: 155px"></td>
            <td style="width: 41px"></td>
        </tr>
        <tr>
            <td style="width: 274px"></td>
            <td style="width: 24px"></td>
            <td style="width: 165px; color: white">.</td>
            <td style="width: 155px"></td>
            <td style="width: 41px"></td>
        </tr>
        <tr>
            <td style="width: 274px"></td>
            <td style="width: 24px"></td>
            <td style="width: 165px; color: white">.</td>
            <td style="width: 155px"></td>
            <td style="width: 41px"></td>
        </tr>
        <tr>
            <td style="width: 274px"></td>
            <td style="width: 24px"></td>
            <td style="width: 165px; color: white">.</td>
            <td style="width: 155px"></td>
            <td style="width: 41px"></td>
        </tr>
        <tr>
            <td style="width: 274px; height: 24px"></td>
            <td class="gv_blue_header" colspan="1" style="border-left: steelblue 1px solid; width: 24px; color: steelblue; height: 24px">.</td>
            <td class="gv_blue_header" colspan="3" style="border-left-width: 1px; border-left-color: steelblue; width: 165px; border-top-style: none; border-right-style: none; height: 24px; border-bottom-style: none">Admin Log-In</td>
        </tr>
        <tr>
            <td style="width: 274px; height: 24px"></td>
            <td style="border-left: steelblue 1px solid; width: 24px; color: white; height: 24px">.</td>
            <td style="border-left-width: 1px; border-left-color: steelblue; width: 165px; border-top-style: none; border-right-style: none; height: 24px; border-bottom-style: none"></td>
            <td style="width: 155px; height: 24px"></td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; height: 24px">.</td>
        </tr>
        <tr>
            <td style="width: 274px"></td>
            <td style="border-left: steelblue 1px solid; width: 24px; color: white; height: 24px">.</td>
            <td style="border-left-width: 1px; border-left-color: steelblue; width: 165px; border-top-style: none; border-right-style: none; height: 24px; border-bottom-style: none">Administrator's ID:</td>
            <td style="width: 155px">
                <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox></td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; height: 24px">.</td>
        </tr>
        <tr>
            <td style="width: 274px"></td>
            <td style="border-left: steelblue 1px solid; width: 24px; color: white; height: 24px">.</td>
            <td style="border-left-width: 1px; border-left-color: steelblue; width: 165px; border-top-style: none; border-right-style: none; height: 24px; border-bottom-style: none">Administrator's Password:</td>
            <td style="width: 155px">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; height: 24px">.</td>
        </tr>
        <tr>
            <td style="width: 274px; height: 24px"></td>
            <td style="border-left: steelblue 1px solid; width: 24px; color: white; height: 24px">.</td>
            <td style="border-left-width: 1px; border-left-color: steelblue; width: 165px; color: white; border-top-style: none; border-right-style: none; height: 24px; border-bottom-style: none">.</td>
            <td style="width: 155px; height: 24px"></td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; height: 24px">.</td>
        </tr>
        <tr>
            <td style="width: 274px; height: 24px"></td>
            <td style="border-left: steelblue 1px solid; width: 24px; color: white; height: 24px">.</td>
            <td style="border-left-width: 1px; border-left-color: steelblue; width: 165px; color: white; border-top-style: none; border-right-style: none; height: 24px; border-bottom-style: none">.</td>
            <td align="right" style="width: 155px; height: 24px" valign="middle">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/send_but.jpg" />
                <asp:LinkButton ID="LinkButton14" runat="server" CommandName="Update" CssClass="bar_format"
                    Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab"
                    Height="21px" OnClick="LinkButton14_Click" Width="41px">Log-In</asp:LinkButton></td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; height: 24px">.</td>
        </tr>
        <tr>
            <td style="width: 274px; height: 24px"></td>
            <td style="border-left: steelblue 1px solid; width: 24px; color: white; border-bottom: steelblue 1px solid; height: 24px">.</td>
            <td colspan="2" style="border-left-width: 1px; border-left-color: steelblue; color: white; border-bottom: steelblue 1px solid; height: 24px">
                <asp:Label ID="statuss" runat="server" ForeColor="Maroon" Text="Status:" Width="294px"></asp:Label>.</td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; border-bottom: steelblue 1px solid; height: 24px">.
            </td>
        </tr>
    </table>
</asp:Content>