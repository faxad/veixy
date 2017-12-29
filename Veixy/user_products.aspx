<%@ Page Language="C#" MasterPageFile="~/user_mp.master" AutoEventWireup="true" CodeFile="user_products.aspx.cs" Inherits="user_products" Title="Veixy-Products" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td style="width: 100px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table style="width: 210px">
                            <tbody>
                                <tr>
                                    <td style="width: 100px; height: 21px" align="center">
                                        <asp:Label ID="Label2" runat="server" Width="204px" ForeColor="OliveDrab" Font-Size="Small" Font-Bold="True" Text="Product List"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:GridView ID="GridView1" runat="server" Width="571px" Font-Size="Small" OnRowDataBound="GridView1_RowDataBound" SelectedIndex="0" AutoGenerateColumns="False" DataKeyNames="prod_sno,prod_title" DataSourceID="SqlDataSource1" GridLines="None" AllowPaging="True" PageSize="8">
                                <PagerSettings NextPageImageUrl="~/Images/next_topic.gif" PreviousPageImageUrl="~/Images/prev_topic.gif"></PagerSettings>
                                <Columns>
                                    <asp:BoundField DataField="prod_sno" HeaderText="Product S.No" SortExpression="prod_sno"></asp:BoundField>
                                    <asp:BoundField DataField="prod_title" HeaderText="Product Title" ReadOnly="True" SortExpression="prod_title"></asp:BoundField>
                                    <asp:BoundField DataField="purchase_date" HeaderText="Date Of Purchase" SortExpression="purchase_date"></asp:BoundField>
                                </Columns>

                                <HeaderStyle BackColor="SteelBlue" BorderStyle="None" ForeColor="White"></HeaderStyle>

                                <AlternatingRowStyle BackColor="#F5FAF1"></AlternatingRowStyle>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [prod_title], [prod_sno], [purchase_date], [user_name] FROM [my_product] WHERE ([user_name] = @user_name)">
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="user_query" Name="user_name" Type="String"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                        <div style="z-index: 101; left: 9px; width: 153px; position: absolute; top: 218px; height: 155px">
                            <asp:Panel ID="Panel2" runat="server" Width="589px" Height="253px" ScrollBars="Vertical">
                                <table style="width: 210px">
                                    <tbody>
                                        <tr>
                                            <td style="width: 100px; height: 21px" align="center">
                                                <asp:Label ID="Label3" runat="server" Width="204px" ForeColor="OliveDrab" Font-Size="Small" Font-Bold="True" Text="Product Detail" __designer:wfdid="w143"></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <asp:FormView ID="FormView1" runat="server" Width="383px" DataKeyNames="prod_id,prod_name" DataSourceID="SqlDataSource2" __designer:wfdid="w133">
                                    <EditItemTemplate>
                                        <table style="border-right: olivedrab thin solid; border-top: olivedrab thin solid; border-left: olivedrab thin solid; width: 294px; border-bottom: olivedrab thin solid">
                                            <tbody>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399; height: 18px"></td>
                                                    <td style="font-size: small; color: #003399; height: 18px">
                                                        <asp:Label ID="Label1" runat="server" Width="113px"></asp:Label></td>
                                                    <td style="font-size: small; height: 18px"></td>
                                                    <td style="font-size: small; height: 18px"></td>
                                                    <td style="font-size: small; width: 19px; height: 18px"></td>
                                                    <td style="font-size: small; height: 18px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                    <td style="font-size: small; color: #003399">Product ID: </td>
                                                    <td style="font-size: small">
                                                        <asp:Label ID="prod_idLabel1" runat="server" Width="219px" Text='<%# Eval("prod_id") %>'></asp:Label></td>
                                                    <td style="font-size: small">
                                                        <asp:Label ID="Label4" runat="server" Width="25px"></asp:Label></td>
                                                    <td style="font-size: small; width: 19px">
                                                        <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg"></asp:Image></td>
                                                    <td style="font-size: small">
                                                        <asp:LinkButton ID="LinkButton1" runat="server" Width="53px" ForeColor="OliveDrab" Font-Size="Small" BorderWidth="1px" BackColor="Transparent" Font-Bold="True" BorderStyle="None" CommandName="Update" Font-Underline="False">Update</asp:LinkButton></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                    <td style="font-size: small; color: #003399">Product Name:</td>
                                                    <td style="font-size: small">
                                                        <asp:TextBox ID="prod_nameTextBox" runat="server" Width="213px" Text='<%# Bind("prod_name") %>'></asp:TextBox></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small; width: 19px">
                                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/cancel.jpg"></asp:Image></td>
                                                    <td style="font-size: small">
                                                        <asp:LinkButton ID="LinkButton2" runat="server" Width="53px" ForeColor="OliveDrab" Font-Size="Small" BorderWidth="1px" BackColor="Transparent" Font-Bold="True" BorderStyle="None" CommandName="Edit" Font-Underline="False">Cancel</asp:LinkButton></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399; height: 26px"></td>
                                                    <td style="font-size: small; color: #003399; height: 26px">Category:</td>
                                                    <td style="font-size: small; height: 26px">
                                                        <asp:TextBox ID="product_categoryTextBox" runat="server" Width="213px" Text='<%# Bind("product_category") %>'></asp:TextBox></td>
                                                    <td style="font-size: small; height: 26px"></td>
                                                    <td style="font-size: small; width: 19px; height: 26px"></td>
                                                    <td style="font-size: small; height: 26px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                    <td style="font-size: small; color: #003399">Cost:</td>
                                                    <td style="font-size: small">
                                                        <asp:TextBox ID="product_costTextBox" runat="server" Width="213px" Text='<%# Bind("product_cost") %>'></asp:TextBox></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small; width: 19px"></td>
                                                    <td style="font-size: small"></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                    <td style="font-size: small; color: #003399">Payment Methods:</td>
                                                    <td style="font-size: small">
                                                        <asp:TextBox ID="payment_methodTextBox" runat="server" Width="213px" Text='<%# Bind("payment_method") %>'></asp:TextBox></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small; width: 19px"></td>
                                                    <td style="font-size: small"></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                    <td style="font-size: small; color: #003399" valign="top">Product Detail:</td>
                                                    <td style="font-size: small; height: 32px" colspan="4">
                                                        <asp:TextBox ID="TextBox1" runat="server" Width="350px" Height="192px" BorderStyle="None" TextMode="MultiLine" Text='<%# Bind("product_detail") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                    <td style="font-size: small; color: #003399">Product Image:</td>
                                                    <td style="font-size: small">
                                                        <asp:TextBox ID="product_img1TextBox" runat="server" Width="213px"></asp:TextBox></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small; width: 19px"></td>
                                                    <td style="font-size: small"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <table style="border-right: olivedrab thin solid; border-top: olivedrab thin solid; border-left: olivedrab thin solid; width: 294px; border-bottom: olivedrab thin solid">
                                            <tr>
                                                <td style="font-size: small; width: 4255px; color: #003399; height: 18px"></td>
                                                <td style="font-size: small; color: #003399; height: 18px">
                                                    <asp:Label ID="Label1" runat="server" Width="113px"></asp:Label></td>
                                                <td style="font-size: small; height: 18px"></td>
                                                <td style="font-size: small; height: 18px"></td>
                                                <td style="font-size: small; width: 19px; height: 18px"></td>
                                                <td style="font-size: small; height: 18px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                <td style="font-size: small; color: #003399">Product ID: </td>
                                                <td style="font-size: small">
                                                    <asp:Label ID="prod_idLabel1" runat="server" Width="213px" Text='<%# Eval("prod_id") %>'></asp:Label></td>
                                                <td style="font-size: small">
                                                    <asp:Label ID="Label4" runat="server" Width="25px"></asp:Label></td>
                                                <td style="font-size: small; width: 19px">
                                                    <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/insert.jpg"></asp:Image></td>
                                                <td style="font-size: small">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" Width="53px" ForeColor="OliveDrab" Font-Underline="False" Font-Size="Small" Font-Bold="True" CommandName="Insert" BorderWidth="1px" BorderStyle="None" BackColor="Transparent">Insert</asp:LinkButton></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                <td style="font-size: small; color: #003399">Product Name:</td>
                                                <td style="font-size: small">
                                                    <asp:TextBox ID="prod_nameTextBox" runat="server" Width="213px" Text='<%# Bind("prod_name") %>'></asp:TextBox></td>
                                                <td style="font-size: small"></td>
                                                <td style="font-size: small; width: 19px">
                                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/cancel.jpg"></asp:Image></td>
                                                <td style="font-size: small">
                                                    <asp:LinkButton ID="LinkButton2" runat="server" Width="53px" ForeColor="OliveDrab" Font-Underline="False" Font-Size="Small" Font-Bold="True" CommandName="Edit" BorderWidth="1px" BorderStyle="None" BackColor="Transparent">Cancel</asp:LinkButton></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 4255px; color: #003399; height: 26px"></td>
                                                <td style="font-size: small; color: #003399; height: 26px">Category:</td>
                                                <td style="font-size: small; height: 26px">
                                                    <asp:TextBox ID="product_categoryTextBox" runat="server" Width="213px" Text='<%# Bind("product_category") %>'></asp:TextBox></td>
                                                <td style="font-size: small; height: 26px"></td>
                                                <td style="font-size: small; width: 19px; height: 26px"></td>
                                                <td style="font-size: small; height: 26px"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                <td style="font-size: small; color: #003399">Cost:</td>
                                                <td style="font-size: small">
                                                    <asp:TextBox ID="product_costTextBox" runat="server" Width="213px" Text='<%# Bind("product_cost") %>'></asp:TextBox></td>
                                                <td style="font-size: small"></td>
                                                <td style="font-size: small; width: 19px"></td>
                                                <td style="font-size: small"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                <td style="font-size: small; color: #003399">Payment Methods:</td>
                                                <td style="font-size: small">
                                                    <asp:TextBox ID="payment_methodTextBox" runat="server" Width="213px" Text='<%# Bind("payment_method") %>'></asp:TextBox></td>
                                                <td style="font-size: small"></td>
                                                <td style="font-size: small; width: 19px"></td>
                                                <td style="font-size: small"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                <td style="font-size: small; color: #003399" valign="top">Product Detail:</td>
                                                <td style="font-size: small" colspan="4">
                                                    <asp:TextBox ID="TextBox1" runat="server" Width="334px" BorderStyle="None" Text='<%# Bind("product_detail") %>' Height="192px" TextMode="MultiLine"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                <td style="font-size: small; color: #003399">Product Image:</td>
                                                <td style="font-size: small">
                                                    <asp:TextBox ID="product_img1TextBox" runat="server" Width="213px"></asp:TextBox></td>
                                                <td style="font-size: small"></td>
                                                <td style="font-size: small; width: 19px"></td>
                                                <td style="font-size: small"></td>
                                            </tr>
                                        </table>
                                        <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CausesValidation="True"></asp:LinkButton>
                                        <asp:LinkButton ID="InsertCancelButton" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False"></asp:LinkButton>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <table style="border-right: olivedrab thin solid; border-top: olivedrab thin solid; border-left: olivedrab thin solid; width: 294px; border-bottom: olivedrab thin solid">
                                            <tbody>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399; height: 18px"></td>
                                                    <td style="font-size: small; color: #003399; height: 18px">
                                                        <asp:Label ID="Label1" runat="server" Width="113px" __designer:wfdid="w135"></asp:Label></td>
                                                    <td style="font-size: small; height: 18px"></td>
                                                    <td style="font-size: small; height: 18px"></td>
                                                    <td style="font-size: small; height: 18px"></td>
                                                    <td style="font-size: small; height: 18px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                    <td style="font-size: small; color: #003399">Product ID: </td>
                                                    <td style="font-size: small">
                                                        <asp:Label ID="prod_idLabel" runat="server" Width="213px" Text='<%# Eval("prod_id") %>' __designer:wfdid="w136"></asp:Label></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small"></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                    <td style="font-size: small; color: #003399">Product Name:</td>
                                                    <td style="font-size: small">
                                                        <asp:Label ID="prod_nameLabel" runat="server" Width="212px" Text='<%# Bind("prod_name") %>' __designer:wfdid="w137"></asp:Label></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small"></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399; height: 26px"></td>
                                                    <td style="font-size: small; color: #003399; height: 26px">Category:</td>
                                                    <td style="font-size: small; height: 26px">
                                                        <asp:Label ID="product_categoryLabel" runat="server" Width="214px" Text='<%# Bind("product_category") %>' __designer:wfdid="w138"></asp:Label></td>
                                                    <td style="font-size: small; height: 26px"></td>
                                                    <td style="font-size: small; height: 26px"></td>
                                                    <td style="font-size: small; height: 26px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                    <td style="font-size: small; color: #003399">Cost:</td>
                                                    <td style="font-size: small">
                                                        <asp:Label ID="product_costLabel" runat="server" Width="213px" Text='<%# Bind("product_cost") %>' __designer:wfdid="w139"></asp:Label></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small"></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                    <td style="font-size: small; color: #003399">Payment Methods:</td>
                                                    <td style="font-size: small">
                                                        <asp:Label ID="payment_methodLabel" runat="server" Width="214px" Text='<%# Bind("payment_method") %>' __designer:wfdid="w140"></asp:Label></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small"></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399; height: 32px"></td>
                                                    <td style="font-size: small; color: #003399; height: 32px" valign="top">Product Detail:</td>
                                                    <td style="font-size: small; height: 32px" colspan="4">
                                                        <asp:TextBox ID="TextBox1" runat="server" Width="421px" Text='<%# Bind("product_detail") %>' Height="164px" BorderStyle="None" TextMode="MultiLine" __designer:wfdid="w141"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; width: 4255px; color: #003399"></td>
                                                    <td style="font-size: small; color: #003399">Product Image:</td>
                                                    <td style="font-size: small">
                                                        <asp:Label ID="product_img1Label" runat="server" __designer:wfdid="w142"></asp:Label></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small"></td>
                                                    <td style="font-size: small"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [prod_id], [prod_name], [product_category], [product_cost], [payment_method], [product_detail] FROM [prod_info] WHERE ([prod_id] = @prod_id)" UpdateCommand="UPDATE [prod_info] SET [prod_name] = @prod_name, [product_category] = @product_category, [product_cost] = @product_cost, [payment_method] = @payment_method, [product_detail] = @product_detail WHERE [prod_id] = @prod_id" InsertCommand="INSERT INTO [prod_info] ([prod_name], [product_category], [product_cost], [payment_method], [product_detail]) VALUES (@prod_name, @product_category, @product_cost, @payment_method, @product_detail)" DeleteCommand="DELETE FROM [prod_info] WHERE [prod_id] = @prod_id" __designer:wfdid="w134">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="prod_id" Type="Decimal"></asp:ControlParameter>
                                    </SelectParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="prod_id" Type="Decimal"></asp:Parameter>
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="prod_name" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="product_category" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="product_cost" Type="Decimal"></asp:Parameter>
                                        <asp:Parameter Name="payment_method" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="product_detail" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="prod_id" Type="Decimal"></asp:Parameter>
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="prod_name" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="product_category" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="product_cost" Type="Decimal"></asp:Parameter>
                                        <asp:Parameter Name="payment_method" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="product_detail" Type="String"></asp:Parameter>
                                    </InsertParameters>
                                </asp:SqlDataSource>
                            </asp:Panel>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
function setMouseOverColor(element)
{
    element.style.cursor='hand';
}
    </script>
</asp:Content>