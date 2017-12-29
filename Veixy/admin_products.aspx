<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_products.aspx.cs" Inherits="admin_reg_pending" Title="Veixy-Products" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function setMouseOverColor(element) {
            element.style.cursor = 'hand';
        }
    </script>

    <table border="0" cellspacing="0" style="width: 825px; height: 27px">
        <tr>
            <td style="width: 203px; height: 21px; background-color: white"></td>
            <td style="width: 27px; height: 21px; background-color: white">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/cp_home.jpg"
                    PostBackUrl="~/admin_main.aspx" /></td>
            <td colspan="3" style="height: 21px; background-color: #f5faf1">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="DimGray" Text="Control Panel"
                    Width="82px"></asp:Label>
                <asp:Label ID="Label23" runat="server" Font-Bold="True" ForeColor="LightGray" Text="--- Products Catalogue"
                    Width="235px"></asp:Label></td>
        </tr>
    </table>
    <br />
    <table style="width: 94px">
        <tr>
            <td align="left" style="width: 27px; height: 21px">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="OliveDrab"
                    Text="Product List" Width="74px"></asp:Label></td>
            <td align="left" style="width: 27px; height: 21px" valign="middle">
                <img src="Images/arrow_down.jpg" style="width: 19px; height: 12px" /></td>
        </tr>
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server">
                <asp:GridView ID="GridView1" runat="server" Width="277px" Font-Size="Small" PageSize="13" GridLines="None" AllowPaging="True" OnRowDataBound="GridView1_RowDataBound" DataKeyNames="prod_id" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" SelectedIndex="0" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <PagerSettings NextPageImageUrl="~/Images/next_topic.gif" PreviousPageImageUrl="~/Images/prev_topic.gif"></PagerSettings>
                    <Columns>
                        <asp:BoundField DataField="prod_id" HeaderText="Product ID" ReadOnly="True" InsertVisible="False" SortExpression="prod_id">
                            <HeaderStyle Width="70px"></HeaderStyle>

                            <ItemStyle HorizontalAlign="Center" Width="70px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="prod_name" HeaderText="Product Name" SortExpression="prod_name">
                            <HeaderStyle Width="220px"></HeaderStyle>

                            <ItemStyle Wrap="True" Width="250px"></ItemStyle>
                        </asp:BoundField>
                    </Columns>

                    <HeaderStyle BackColor="SteelBlue" BorderStyle="None" ForeColor="White"></HeaderStyle>

                    <AlternatingRowStyle BackColor="#F5FAF1"></AlternatingRowStyle>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" UpdateCommand="UPDATE [prod_info] SET [prod_name] = @prod_name WHERE [prod_id] = @prod_id" SelectCommand="SELECT [prod_id], [prod_name] FROM [prod_info]" InsertCommand="INSERT INTO [prod_info] ([prod_name]) VALUES (@prod_name)" DeleteCommand="DELETE FROM [prod_info] WHERE [prod_id] = @prod_id" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>">
                    <DeleteParameters>
                        <asp:Parameter Name="prod_id" Type="Decimal" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="prod_name" Type="String" />
                        <asp:Parameter Name="prod_id" Type="Decimal" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="prod_name" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </asp:Panel>
            <div style="z-index: 101; left: 306px; width: 153px; position: absolute; top: 39px; height: 155px">
                <asp:Panel ID="Panel2" runat="server">
                    <table style="width: 210px">
                        <tbody>
                            <tr>
                                <td style="width: 100px; height: 21px" align="center">
                                    <asp:Label ID="Label3" runat="server" Width="478px" Text="Product Detail" ForeColor="SteelBlue" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                    <asp:FormView ID="FormView1" runat="server" Width="384px" DataSourceID="SqlDataSource2" DataKeyNames="prod_id">
                        <EditItemTemplate>
                            <table style="border-right: olivedrab thin solid; border-top: olivedrab thin solid; border-left: olivedrab thin solid; width: 294px; border-bottom: olivedrab thin solid">
                                <tbody>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399; height: 18px"></td>
                                        <td style="font-size: small; color: #003399; height: 18px">
                                            <asp:Label ID="Label1" runat="server" Width="113px" __designer:wfdid="w127"></asp:Label></td>
                                        <td style="font-size: small; height: 18px"></td>
                                        <td style="font-size: small; height: 18px"></td>
                                        <td style="font-size: small; width: 19px; height: 18px"></td>
                                        <td style="font-size: small; height: 18px"></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399"></td>
                                        <td style="font-size: small; color: #003399">Product ID: </td>
                                        <td style="font-size: small">
                                            <asp:Label ID="prod_idLabel1" runat="server" Text='<%# Eval("prod_id") %>' Width="219px" __designer:wfdid="w128"></asp:Label></td>
                                        <td style="font-size: small">
                                            <asp:Label ID="Label4" runat="server" Width="25px" __designer:wfdid="w129"></asp:Label></td>
                                        <td style="font-size: small; width: 19px">
                                            <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg" __designer:wfdid="w130"></asp:Image></td>
                                        <td style="font-size: small">
                                            <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="OliveDrab" Width="53px" BackColor="Transparent" BorderStyle="None" BorderWidth="1px" CommandName="Update" Font-Underline="False" __designer:wfdid="w131">Update</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399"></td>
                                        <td style="font-size: small; color: #003399">Product Name:</td>
                                        <td style="font-size: small">
                                            <asp:TextBox ID="prod_nameTextBox" runat="server" Text='<%# Bind("prod_name") %>' Width="213px" __designer:wfdid="w132"></asp:TextBox></td>
                                        <td style="font-size: small"></td>
                                        <td style="font-size: small; width: 19px">
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/cancel.jpg" __designer:wfdid="w133"></asp:Image></td>
                                        <td style="font-size: small">
                                            <asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="OliveDrab" Width="53px" BackColor="Transparent" BorderStyle="None" BorderWidth="1px" CommandName="Cancel" Font-Underline="False" __designer:wfdid="w134">Cancel</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399; height: 26px"></td>
                                        <td style="font-size: small; color: #003399; height: 26px">Category:</td>
                                        <td style="font-size: small; height: 26px">
                                            <asp:TextBox ID="product_categoryTextBox" runat="server" Text='<%# Bind("product_category") %>' Width="213px" __designer:wfdid="w135"></asp:TextBox></td>
                                        <td style="font-size: small; height: 26px"></td>
                                        <td style="font-size: small; width: 19px; height: 26px"></td>
                                        <td style="font-size: small; height: 26px"></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399"></td>
                                        <td style="font-size: small; color: #003399">Cost:</td>
                                        <td style="font-size: small">
                                            <asp:TextBox ID="product_costTextBox" runat="server" Text='<%# Bind("product_cost") %>' Width="213px" __designer:wfdid="w136"></asp:TextBox></td>
                                        <td style="font-size: small"></td>
                                        <td style="font-size: small; width: 19px"></td>
                                        <td style="font-size: small"></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399"></td>
                                        <td style="font-size: small; color: #003399">Payment Methods:</td>
                                        <td style="font-size: small">
                                            <asp:TextBox ID="payment_methodTextBox" runat="server" Text='<%# Bind("payment_method") %>' Width="213px" __designer:wfdid="w137"></asp:TextBox></td>
                                        <td style="font-size: small"></td>
                                        <td style="font-size: small; width: 19px"></td>
                                        <td style="font-size: small"></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399"></td>
                                        <td style="font-size: small; color: #003399" valign="top">Product Detail:</td>
                                        <td style="font-size: small; height: 32px" colspan="4">
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("product_detail") %>' Width="334px" BorderStyle="None" TextMode="MultiLine" Height="192px" __designer:wfdid="w138"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399"></td>
                                        <td style="font-size: small; color: #003399">Product Image:</td>
                                        <td style="font-size: small">
                                            <asp:TextBox ID="product_img1TextBox" runat="server" Width="213px" __designer:wfdid="w139"></asp:TextBox></td>
                                        <td style="font-size: small"></td>
                                        <td style="font-size: small; width: 19px"></td>
                                        <td style="font-size: small"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </EditItemTemplate>
                        <InsertItemTemplate>
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
                                </tbody>
                            </table>
                            <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CausesValidation="True"></asp:LinkButton>
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False"></asp:LinkButton>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table style="border-top-width: thin; border-left-width: thin; border-left-color: olivedrab; border-bottom-width: thin; border-bottom-color: olivedrab; width: 294px; border-top-color: olivedrab; border-right-width: thin; border-right-color: olivedrab">
                                <tbody>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399"></td>
                                        <td style="font-size: small; color: #003399">Product ID: </td>
                                        <td style="font-size: small">
                                            <asp:Label ID="prod_idLabel" runat="server" Width="213px" Text='<%# Eval("prod_id") %>' __designer:wfdid="w189"></asp:Label></td>
                                        <td style="font-size: small">
                                            <asp:Label ID="Label4" runat="server" Width="25px" __designer:wfdid="w190"></asp:Label></td>
                                        <td style="font-size: small">
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/new_symbol.jpg" __designer:wfdid="w191"></asp:Image></td>
                                        <td style="font-size: small">
                                            <asp:LinkButton ID="LinkButton1" runat="server" Width="89px" ForeColor="OliveDrab" Font-Bold="True" Font-Size="Small" __designer:wfdid="w192" BackColor="Transparent" BorderStyle="None" BorderWidth="1px" CommandName="New" Font-Underline="False">Add New Item</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399"></td>
                                        <td style="font-size: small; color: #003399">Product Name:</td>
                                        <td style="font-size: small">
                                            <asp:Label ID="prod_nameLabel" runat="server" Width="212px" Text='<%# Bind("prod_name") %>' __designer:wfdid="w193"></asp:Label></td>
                                        <td style="font-size: small"></td>
                                        <td style="font-size: small">
                                            <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/edit_symbol.jpg" __designer:wfdid="w194"></asp:Image></td>
                                        <td style="font-size: small">
                                            <asp:LinkButton ID="LinkButton2" runat="server" Width="103px" ForeColor="OliveDrab" Font-Bold="True" Font-Size="Small" __designer:wfdid="w195" BackColor="Transparent" BorderStyle="None" BorderWidth="1px" CommandName="Edit" Font-Underline="False">Modify Existing</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399; height: 26px"></td>
                                        <td style="font-size: small; color: #003399; height: 26px">Category:</td>
                                        <td style="font-size: small; height: 26px">
                                            <asp:Label ID="product_categoryLabel" runat="server" Width="214px" Text='<%# Bind("product_category") %>' __designer:wfdid="w196"></asp:Label></td>
                                        <td style="font-size: small; height: 26px"></td>
                                        <td style="font-size: small; height: 26px" valign="top">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/delete.jpg" __designer:wfdid="w197"></asp:Image></td>
                                        <td style="font-size: small; height: 26px" valign="top">
                                            <asp:LinkButton ID="LinkButton3" runat="server" Width="86px" ForeColor="OliveDrab" Font-Bold="True" Font-Size="Small" __designer:wfdid="w198" BackColor="Transparent" BorderStyle="None" BorderWidth="1px" CommandName="Delete" Font-Underline="False">Delete Item</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399"></td>
                                        <td style="font-size: small; color: #003399">Cost:</td>
                                        <td style="font-size: small">
                                            <asp:Label ID="product_costLabel" runat="server" Width="213px" Text='<%# Bind("product_cost") %>' __designer:wfdid="w199"></asp:Label></td>
                                        <td style="font-size: small"></td>
                                        <td style="font-size: small"></td>
                                        <td style="font-size: small"></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399"></td>
                                        <td style="font-size: small; color: #003399">Payment Methods:</td>
                                        <td style="font-size: small">
                                            <asp:Label ID="payment_methodLabel" runat="server" Width="214px" Text='<%# Bind("payment_method") %>' __designer:wfdid="w200"></asp:Label></td>
                                        <td style="font-size: small"></td>
                                        <td style="font-size: small"></td>
                                        <td style="font-size: small"></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399; height: 32px"></td>
                                        <td style="font-size: small; color: #003399; height: 32px" valign="top">Product Detail:</td>
                                        <td style="font-size: small; height: 32px" colspan="4">
                                            <asp:TextBox ID="TextBox1" runat="server" Width="366px" Text='<%# Bind("product_detail") %>' __designer:wfdid="w201" BorderStyle="None" TextMode="MultiLine" Height="192px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399; height: 3px"></td>
                                        <td style="font-size: small; color: #003399; height: 3px">Product Image:</td>
                                        <td style="font-size: small; height: 3px">
                                            <asp:Label ID="product_img1Label" runat="server" __designer:wfdid="w202"></asp:Label></td>
                                        <td style="font-size: small; height: 3px"></td>
                                        <td style="font-size: small; height: 3px"></td>
                                        <td style="font-size: small; height: 3px"></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: small; width: 4255px; color: #003399"></td>
                                        <td style="font-size: small; color: #003399">
                                            <asp:Label ID="Label1" runat="server" Width="113px" __designer:wfdid="w203"></asp:Label></td>
                                        <td style="font-size: small"></td>
                                        <td style="font-size: small"></td>
                                        <td style="font-size: small"></td>
                                        <td style="font-size: small"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" DeleteCommand="DELETE FROM [prod_info] WHERE [prod_id] = @prod_id" InsertCommand="INSERT INTO [prod_info] ([prod_name], [product_category], [product_cost], [payment_method], [product_detail]) VALUES (@prod_name, @product_category, @product_cost, @payment_method, @product_detail)" SelectCommand="SELECT [prod_id], [prod_name], [product_category], [product_cost], [payment_method], [product_detail] FROM [prod_info] WHERE ([prod_id] = @prod_id)" UpdateCommand="UPDATE [prod_info] SET [prod_name] = @prod_name, [product_category] = @product_category, [product_cost] = @product_cost, [payment_method] = @payment_method, [product_detail] = @product_detail WHERE [prod_id] = @prod_id">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="prod_id" PropertyName="SelectedValue"
                                Type="Decimal" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="prod_id" Type="Decimal" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="prod_name" Type="String" />
                            <asp:Parameter Name="product_category" Type="String" />
                            <asp:Parameter Name="product_cost" Type="Decimal" />
                            <asp:Parameter Name="payment_method" Type="String" />
                            <asp:Parameter Name="product_detail" Type="String" />
                            <asp:Parameter Name="prod_id" Type="Decimal" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="prod_name" Type="String" />
                            <asp:Parameter Name="product_category" Type="String" />
                            <asp:Parameter Name="product_cost" Type="Decimal" />
                            <asp:Parameter Name="payment_method" Type="String" />
                            <asp:Parameter Name="product_detail" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <table style="width: 308px">
                        <tbody>
                            <tr>
                                <td style="width: 108px; height: 26px">Product Ratings:</td>
                                <td style="width: 100px; height: 26px">
                                    <asp:TextBox ID="TextBox3" runat="server" Width="32px" BorderColor="SteelBlue" __designer:wfdid="w80" BorderWidth="2px"></asp:TextBox></td>
                                <td style="width: 100px; height: 26px"></td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                    <asp:Label Style="text-align: center" ID="Label5" runat="server" Width="492px" Text="Comments By Customers" ForeColor="SteelBlue" Font-Bold="True" Font-Size="Small"></asp:Label><br />
                    <asp:Panel ID="Panel3" runat="server" Width="461px" Font-Size="Small">
                        <asp:FormView ID="FormView2" runat="server" Width="520px" DataSourceID="SqlDataSource3">
                            <EditItemTemplate>
                                user_name:
                                <asp:TextBox Text='<%# Bind("user_name") %>' runat="server" ID="user_nameTextBox" /><br />
                                prod_sno:
                                <asp:TextBox Text='<%# Bind("prod_sno") %>' runat="server" ID="prod_snoTextBox" /><br />
                                comments:
                                <asp:TextBox Text='<%# Bind("comments") %>' runat="server" ID="commentsTextBox" /><br />
                                <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                user_name:
                                <asp:TextBox Text='<%# Bind("user_name") %>' runat="server" ID="user_nameTextBox" /><br />
                                prod_sno:
                                <asp:TextBox Text='<%# Bind("prod_sno") %>' runat="server" ID="prod_snoTextBox" /><br />
                                comments:
                                <asp:TextBox Text='<%# Bind("comments") %>' runat="server" ID="commentsTextBox" /><br />
                                <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td style="width: 129px">Comments By:</td>
                                            <td style="width: 100px">
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("user_name") %>' ForeColor="#003399" __designer:wfdid="w1"></asp:Label></td>
                                            <td style="width: 393px"></td>
                                            <td style="width: 169px" align="right">Product ID: </td>
                                            <td style="width: 100px">
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("prod_sno") %>' ForeColor="#003399" __designer:wfdid="w2"></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <asp:TextBox ID="TextBox2" runat="server" Width="493px" Text='<%# Bind("comments") %>' __designer:wfdid="w3" TextMode="MultiLine" Height="106px" BorderStyle="None" ReadOnly="True"></asp:TextBox><br />
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" SelectCommand="SELECT [user_name], [prod_sno], [comments] FROM [my_product] WHERE ([prod_sno] = @prod_sno)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="prod_sno" Type="Decimal"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>