<%@ Page Language="C#" MasterPageFile="~/discussion.master" AutoEventWireup="true" CodeFile="disc_threads.aspx.cs" Inherits="disc_main" Title="Veixy-Discussion Threads" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
function TABLE1_onclick() {

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
                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/register.gif" PostBackUrl="~/cust_reg.aspx" /></td>
        </tr>
    </table>
    <table class="gv_header" style="width: 770px; height: 10px;" id="TABLE1" onclick="return TABLE1_onclick()">
        <tr>
            <td style="font-weight: bold; width: 68px; color: white">Discussion</td>
            <td style="font-weight: bold; width: 37px; color: white">Board</td>
            <td style="font-weight: bold; width: 20px; color: white">---</td>
            <td style="font-weight: bold; width: 732px; color: white">
                <asp:Label ID="Label1" runat="server"></asp:Label></td>
            <td style="font-weight: bold; width: 100px; color: white"></td>
            <td style="font-weight: bold; width: 100px; color: white">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/new_thread.gif"
                    OnClick="ImageButton1_Click" /></td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="thread_id"
        DataSourceID="SqlDataSource1" OnDataBound="GridView1_DataBound" Width="769px" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="img" SortExpression="img">
                <ItemStyle Width="5px" />
            </asp:BoundField>
            <asp:BoundField DataField="thread_title" HeaderText="Thread Title" SortExpression="thread_title">
                <ItemStyle Width="350px" />
            </asp:BoundField>
            <asp:BoundField DataField="views" HeaderText="Views" SortExpression="views">
                <ItemStyle Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="Posts" HeaderText="Replies" SortExpression="Posts">
                <ItemStyle Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="Latest" HeaderText="Latest Post" SortExpression="Latest" />
        </Columns>
        <HeaderStyle BackColor="WhiteSmoke" />
        <EmptyDataTemplate>
            <table style="width: 751px">
                <tr>
                    <td style="width: 151px"></td>
                    <td></td>
                    <td style="width: 444px"></td>
                </tr>
                <tr>
                    <td style="width: 151px; height: 19px"></td>
                    <td style="width: 151px; height: 19px"></td>
                    <td style="width: 444px; height: 19px">There are no threads in this section.</td>
                    <td style="width: 100px; height: 19px"></td>
                </tr>
                <tr>
                    <td style="width: 151px"></td>
                    <td></td>
                    <td style="width: 444px"></td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <AlternatingRowStyle BackColor="Ivory" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT img, thread_id, thread_title, SUBSTRING(latest_post, 0, 50) AS Latest, (SELECT COUNT(post_id) AS Expr1 FROM post_table AS b WHERE (thread_id = a.thread_id)) AS Posts, views FROM thread_table AS a WHERE (prod_id = @prod_id) ORDER BY thread_id DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="prod_id" QueryStringField="prod_id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>