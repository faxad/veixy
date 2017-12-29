<%@ Page Language="C#" MasterPageFile="~/discussion.master" AutoEventWireup="true" CodeFile="disc_main.aspx.cs" Inherits="disc_main" Title="Veixy-Discussion Board" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
function setMouseOverColor(element)
{
    element.style.cursor='hand';
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
                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/register.gif"
                    PostBackUrl="~/cust_reg.aspx" /></td>
        </tr>
    </table>
    <table class="gv_header" style="width: 771px">
        <tr>
            <td style="font-weight: bold; width: 100px; color: white">Discussion_Board</td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="prod_id,prod_name"
        DataSourceID="SqlDataSource1" OnDataBound="GridView1_DataBound" Width="769px" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="prod_id" HeaderText="Product ID" InsertVisible="False"
                ReadOnly="True" SortExpression="prod_id">
                <ItemStyle Width="70px" />
            </asp:BoundField>
            <asp:BoundField DataField="prod_name" HeaderText="Product Title" ReadOnly="True"
                SortExpression="prod_name">
                <ItemStyle Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="Threads" HeaderText="Threads" ReadOnly="True" SortExpression="Threads">
                <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Latest Thread">
                <ItemTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 319px">
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Expr1") %>'></asp:Label><asp:Label
                                    ID="Label2" runat="server" Text="..."></asp:Label></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="WhiteSmoke" />
        <AlternatingRowStyle BackColor="Ivory" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT prod_id, prod_name, (SELECT COUNT(thread_id) AS Expr1 FROM thread_table AS b WHERE (prod_id = a.prod_id)) AS Threads, SUBSTRING(latest_thread, 0, 50) AS Expr1 FROM prod_info AS a"></asp:SqlDataSource>
</asp:Content>