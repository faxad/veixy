<%@ Page Language="C#" MasterPageFile="~/discussion.master" AutoEventWireup="true" CodeFile="disc_post.aspx.cs" Inherits="disc_main" Title="Veixy-Thread Detail" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function setMouseOverColor(element) {
            element.style.cursor = 'hand';
        }
        function TABLE4_onclick() {

        }
    </script>

    <table border="0" cellspacing="0" style="width: 515px">
        <tr>
            <td style="width: 223px"></td>
            <td style="width: 39px">
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/home.gif" PostBackUrl="~/disc_main.aspx" /></td>
            <td style="width: 61px">
                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/login.gif" PostBackUrl="~/user_login.aspx" /></td>
            <td style="width: 100px">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/register.gif"
                    PostBackUrl="~/cust_reg.aspx" /></td>
        </tr>
    </table>
    <table id="TABLE1" class="gv_header" onclick="return TABLE1_onclick()" style="height: 10px; font-size: 8pt;" width="790">
        <tr>
            <td style="font-weight: bold; width: 68px; color: white">Discussion</td>
            <td style="font-weight: bold; width: 37px; color: white">Board</td>
            <td style="font-weight: bold; width: 20px; color: white">---</td>
            <td style="font-weight: bold; width: 889px; color: white">
                <asp:Label ID="Label1" runat="server"></asp:Label></td>
            <td style="font-weight: bold; width: 76px; color: white"></td>
            <td style="font-weight: bold; width: 100px; color: white">
                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/reply.gif" PostBackUrl="#abc" /></td>
        </tr>
    </table>
    <table style="width: 790px">
        <tr>
            <td style="width: 100px; background-color: whitesmoke">.</td>
        </tr>
    </table>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1"
        OnItemDataBound="DataList1_ItemDataBound" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
        <ItemTemplate>
            <table style="width: 771px">
                <tr>
                    <td style="width: 92px; background-color: ghostwhite; height: 183px;" align="left" colspan="1" rowspan="1" valign="top">
                        <table style="font-weight: bold; font-size: 8pt; width: 168px">
                            <tr>
                                <td style="width: 73px">Posted By:</td>
                                <td style="width: 100px">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("posted_by") %>' ForeColor="SteelBlue"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 73px">Posted On:</td>
                                <td style="width: 100px" rowspan="2" valign="top">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("post_date") %>' ForeColor="SteelBlue"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 73px; color: white;">.</td>
                            </tr>
                            <tr>
                                <td style="width: 73px">Total Posts:</td>
                                <td style="width: 100px">
                                    <asp:Label ID="Label4" runat="server" Text="Label" ForeColor="LightSteelBlue"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 73px; color: white;">.</td>
                                <td style="width: 100px"></td>
                            </tr>
                            <tr>
                                <td style="width: 73px; color: white; height: 18px;">.</td>
                                <td style="width: 100px; height: 18px;"></td>
                            </tr>
                            <tr>
                                <td style="width: 73px">Started By:</td>
                                <td style="width: 100px">
                                    <asp:Label ID="Label5" runat="server" Text="Label" ForeColor="DarkGray"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 73px">Started On:</td>
                                <td style="width: 100px">
                                    <asp:Label ID="Label6" runat="server" Text="Label" ForeColor="DarkGray"></asp:Label></td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 800px; height: 183px;" valign="top">
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("post_msg") %>'></asp:Label></td>
                </tr>
            </table>
            <table id="TABLE4" border="0" cellpadding="0" cellspacing="0" style="font-size: xx-small; height: 1px; background-color: ghostwhite" onclick="return TABLE4_onclick()" width="790">
                <tr>
                    <td style="width: 100px; height: 14px"></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <table id="Table2" onclick="return TABLE1_onclick()" style="width: 790px; height: 10px; color: darkgray; background-color: whitesmoke;">
        <tr>
            <td style="font-weight: bold; width: 68px;">Discussion</td>
            <td style="font-weight: bold; width: 37px;">Board</td>
            <td style="font-weight: bold; width: 20px;">---</td>
            <td style="font-weight: bold; width: 578px; color: white">
                <asp:Label ID="Label8" runat="server" ForeColor="DarkGray"></asp:Label></td>
            <td style="font-weight: bold; width: 76px; color: white"></td>
            <td style="font-weight: bold; width: 100px; color: white">
                <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/Images/reply.gif" PostBackUrl="#abc" /></td>
        </tr>
    </table>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT [posted_by], [post_date], [post_msg] FROM [post_table] WHERE ([thread_id] = @thread_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="thread_id" QueryStringField="thread_id" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <table id="Table3" class="gv_header" onclick="return TABLE1_onclick()" style="width: 790px; height: 10px; font-size: 8pt;">
        <tr>
            <td style="font-weight: bold; width: 26px; color: white">Post
            </td>
            <td style="font-weight: bold; width: 37px; color: white">Reply</td>
            <td style="font-weight: bold; width: 20px; color: white"></td>
            <td style="font-weight: bold; width: 889px; color: white"></td>
            <td style="font-weight: bold; width: 76px; color: white"></td>
            <td style="font-weight: bold; width: 100px; color: white"></td>
        </tr>
    </table>
    <table style="width: 788px; background-color: ghostwhite">
        <tr>
            <td style="width: 171px"></td>
            <td style="width: 34px">
                <asp:TextBox ID="TextBox1" runat="server" Height="167px" TextMode="MultiLine" Width="464px"></asp:TextBox></td>
            <td style="width: 100px"></td>
        </tr>
    </table>
    <a name="abc"></a>
    <table style="width: 788px; background-color: ghostwhite">
        <tr>
            <td style="width: 100px"></td>
            <td style="width: 181px; background-color: ghostwhite"></td>
            <td style="width: 100px">
                <asp:LinkButton ID="LinkButton1" runat="server" BackColor="Lavender" BorderColor="#C0C0FF"
                    BorderWidth="1px" Font-Underline="False" ForeColor="Black" Width="73px" OnClick="LinkButton1_Click">Send Reply</asp:LinkButton></td>
        </tr>
    </table>
</asp:Content>