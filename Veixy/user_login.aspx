<%@ Page Language="C#" MasterPageFile="~/top_mp.master" AutoEventWireup="true" CodeFile="user_login.aspx.cs" Inherits="user_login" Title="Veixy-Log In" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 575px">
        <tr>
            <td style="width: 199px"></td>
            <td style="width: 29px"></td>
            <td align="center" colspan="2">.<asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" ForeColor="Gray"
                OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                <asp:ListItem>Customer</asp:ListItem>
                <asp:ListItem Selected="True">Staff Member</asp:ListItem>
                <asp:ListItem>Administrator</asp:ListItem>
            </asp:RadioButtonList></td>
            <td style="width: 41px"></td>
        </tr>
        <tr>
            <td style="width: 199px"></td>
            <td style="width: 29px"></td>
            <td style="width: 143px; color: white">.</td>
            <td style="width: 155px"></td>
            <td style="width: 41px"></td>
        </tr>
        <tr>
            <td style="width: 199px"></td>
            <td style="width: 29px"></td>
            <td style="width: 143px; color: white"></td>
            <td style="width: 155px"></td>
            <td style="width: 41px"></td>
        </tr>
        <tr>
            <td style="width: 199px; height: 24px"></td>
            <td class="gv_blue_header" colspan="1" style="border-left: steelblue 1px solid; width: 29px; color: steelblue; height: 24px">.</td>
            <td class="gv_blue_header" colspan="3" style="border-left-width: 1px; border-left-color: steelblue; width: 165px; border-top-style: none; border-right-style: none; height: 24px; border-bottom-style: none">&nbsp;Log-In</td>
        </tr>
        <tr>
            <td style="width: 199px; height: 24px"></td>
            <td style="border-left: steelblue 1px solid; width: 29px; color: white; height: 24px">.</td>
            <td style="border-left-width: 1px; border-left-color: steelblue; width: 143px; border-top-style: none; border-right-style: none; height: 24px; border-bottom-style: none"></td>
            <td style="width: 155px; height: 24px"></td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; height: 24px">.</td>
        </tr>
        <tr>
            <td style="width: 199px; height: 24px;"></td>
            <td style="border-left: steelblue 1px solid; width: 29px; color: white; height: 24px">.</td>
            <td style="border-left-width: 1px; border-left-color: steelblue; width: 143px; border-top-style: none; border-right-style: none; height: 24px; border-bottom-style: none">Log-In &nbsp;ID:</td>
            <td style="width: 155px; height: 24px;">
                <asp:TextBox ID="TextBox1" runat="server">john_literal</asp:TextBox></td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; height: 24px">.</td>
        </tr>
        <tr>
            <td style="width: 199px"></td>
            <td style="border-left: steelblue 1px solid; width: 29px; color: white; height: 24px">.</td>
            <td style="border-left-width: 1px; border-left-color: steelblue; width: 143px; border-top-style: none; border-right-style: none; height: 24px; border-bottom-style: none">Password:</td>
            <td style="width: 155px">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="148px">john_literal</asp:TextBox></td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; height: 24px">.</td>
        </tr>
        <tr>
            <td style="width: 199px; height: 24px"></td>
            <td style="border-left: steelblue 1px solid; width: 29px; color: white; height: 24px">.</td>
            <td style="border-left-width: 1px; border-left-color: steelblue; width: 143px; color: white; border-top-style: none; border-right-style: none; height: 24px; border-bottom-style: none">.</td>
            <td style="width: 155px; height: 24px"></td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; height: 24px">.</td>
        </tr>
        <tr>
            <td style="width: 199px; height: 24px"></td>
            <td style="border-left: steelblue 1px solid; width: 29px; color: white; height: 24px">.</td>
            <td style="border-left-width: 1px; border-left-color: steelblue; width: 143px; color: white; border-top-style: none; border-right-style: none; height: 24px; border-bottom-style: none">.</td>
            <td align="right" style="width: 155px; height: 24px" valign="middle">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/send_but.jpg" />
                <asp:LinkButton ID="LinkButton14" runat="server" CommandName="Update" CssClass="bar_format"
                    Font-Bold="True" Font-Size="Small" Font-Underline="False" ForeColor="OliveDrab"
                    Height="21px" OnClick="LinkButton14_Click" Width="41px">Log-In</asp:LinkButton></td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; height: 24px">.</td>
        </tr>
        <tr>
            <td style="width: 199px; height: 24px"></td>
            <td style="border-left: steelblue 1px solid; width: 29px; color: white; border-bottom: steelblue 1px solid; height: 24px">.</td>
            <td colspan="2" style="border-left-width: 1px; border-left-color: steelblue; color: white; border-bottom: steelblue 1px solid; height: 24px">
                <asp:Label ID="statuss" runat="server" ForeColor="Maroon" Text="Status:" Width="294px"></asp:Label>.</td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; border-bottom: steelblue 1px solid; height: 24px">.
            </td>
        </tr>
        <tr>
            <td style="width: 199px; height: 24px"></td>
            <td style="border-left: steelblue 1px solid; width: 29px; color: white; border-bottom: steelblue 1px solid; height: 24px"></td>
            <td colspan="2" style="border-left-width: 1px; border-left-color: steelblue; border-bottom-width: 1px; border-bottom-color: steelblue; color: white; border-top-style: none; border-right-style: none; height: 24px">.</td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; border-bottom: steelblue 1px solid; height: 24px"></td>
        </tr>
        <tr>
            <td style="width: 199px; height: 24px"></td>
            <td style="width: 29px; color: white; height: 24px; border-left-width: 1px; border-left-color: steelblue; border-bottom-width: 1px; border-bottom-color: steelblue; border-top-style: none; border-right-style: none;">
                <img src="Images/tiny.jpg" /></td>
            <td colspan="2" style="border-left-width: 1px; border-left-color: steelblue; border-bottom-width: 1px; border-bottom-color: steelblue; color: black; height: 24px">If you have not yet registered as a staff member,&nbsp; you<br />
                can
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/staff_reg.aspx">click here</asp:LinkButton>
                to register.</td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; border-bottom: steelblue 1px solid; height: 24px"></td>
        </tr>
        <tr>
            <td style="width: 199px; height: 24px"></td>
            <td style="border-left-width: 1px; border-left-color: steelblue; border-bottom-width: 1px; border-bottom-color: steelblue; width: 29px; color: white; border-top-style: none; border-right-style: none; height: 24px">
                <img src="Images/tiny.jpg" /></td>
            <td colspan="2" style="border-left-width: 1px; border-left-color: steelblue; border-bottom-width: 1px; border-bottom-color: steelblue; height: 24px">For customer's registration
                <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="#C04000" PostBackUrl="~/cust_reg.aspx">click here</asp:LinkButton></td>
            <td style="border-right: steelblue 1px solid; width: 41px; color: white; border-bottom: steelblue 1px solid; height: 24px"></td>
        </tr>
    </table>
</asp:Content>