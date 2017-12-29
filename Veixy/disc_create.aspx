<%@ Page Language="C#" MasterPageFile="~/discussion.master" AutoEventWireup="true" CodeFile="disc_create.aspx.cs" Inherits="disc_create" Title="Veixy-Create Topic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellspacing="0" style="width: 515px">
        <tr>
            <td style="width: 223px"></td>
            <td style="width: 39px">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/home.gif" PostBackUrl="~/disc_main.aspx" /></td>
            <td style="width: 61px"></td>
            <td style="width: 100px" valign="top"></td>
        </tr>
    </table>
    <table id="Table3" class="gv_header" onclick="return TABLE1_onclick()" style="font-size: 8pt; width: 790px; height: 10px">
        <tr>
            <td style="font-weight: bold; width: 26px; color: white">Create</td>
            <td style="font-weight: bold; width: 37px; color: white">Thread</td>
            <td style="font-weight: bold; width: 20px; color: white"></td>
            <td style="font-weight: bold; width: 889px; color: white"></td>
            <td style="font-weight: bold; width: 76px; color: white"></td>
            <td style="font-weight: bold; width: 100px; color: white"></td>
        </tr>
    </table>
    <table style="width: 788px; background-color: ghostwhite">
        <tr>
            <td align="right" style="width: 171px">Product Title:</td>
            <td style="width: 34px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="SteelBlue" Text="Label"
                    Width="345px"></asp:Label></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td align="right" style="width: 171px">Thread Title:</td>
            <td style="width: 34px">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 470px">
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Width="371px"></asp:TextBox></td>
                        <td style="width: 35px"></td>
                        <td style="width: 100px">
                            <asp:LinkButton ID="LinkButton1" runat="server" BackColor="GhostWhite" BorderColor="#C0C0FF"
                                BorderWidth="1px" Font-Underline="False" ForeColor="Black" OnClick="LinkButton1_Click"
                                Width="82px">Create Thread</asp:LinkButton></td>
                    </tr>
                </table>
            </td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td align="right" style="width: 171px" valign="top">First Post:
            </td>
            <td style="width: 34px">
                <asp:TextBox ID="TextBox1" runat="server" Height="167px" TextMode="MultiLine" Width="464px"></asp:TextBox></td>
            <td style="width: 100px"></td>
        </tr>
    </table>
</asp:Content>