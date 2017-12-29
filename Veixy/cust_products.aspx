<%@ Page Language="C#" MasterPageFile="~/top_mp2.master" AutoEventWireup="true" CodeFile="cust_products.aspx.cs" Inherits="cust_products" Title="Veixy-Products" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function setMouseOverColor(element) {
            element.style.cursor = 'hand';
        }
    </script>
    <div style="z-index: 101; left: 4px; width: 563px; position: absolute; top: 0px; height: 310px">
        <table>
            <tr>
                <td colspan="2" style="width: 323px; height: 171px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderColor="White"
                        BorderStyle="Solid" DataSourceID="SqlDataSource1" GridLines="Horizontal" Width="461px" OnRowDataBound="GridView1_RowDataBound" DataKeyNames="prod_sno" ForeColor="Black" SelectedIndex="0" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="prod_sno" HeaderText="Product S.No" SortExpression="prod_sno" />
                            <asp:BoundField DataField="prod_title" HeaderText="Product Title" SortExpression="prod_title" />
                            <asp:BoundField DataField="purchase_date" HeaderText="Purchase Date" SortExpression="purchase_date" />
                        </Columns>
                        <SelectedRowStyle Font-Bold="False" ForeColor="SlateGray" BackColor="WhiteSmoke" />
                        <HeaderStyle CssClass="gv_header" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [prod_title], [prod_sno],CONVERT (VARCHAR, purchase_date, 101) AS purchase_date, [user_name] FROM [my_product] WHERE ([user_name] = @user_name)">
                        <SelectParameters>
                            <asp:SessionParameter Name="user_name" SessionField="user_session" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <div style="z-index: 102; left: -143px; width: 100px; position: absolute; top: 238px; height: 141px">
                        <img src="Images_Net/cds.jpg" /><br />
                        <div style="z-index: 101; left: 1px; width: 100px; position: absolute; top: 213px; height: 119px">
                            <img src="Images_Net/untitled3.jpg" />
                        </div>
                    </div>
                    <table>
                        <tr>
                            <td style="width: 100px; height: 47px" valign="top">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/co.jpg" /></td>
                            <td style="width: 100px; height: 47px">
                                <asp:Label ID="Label5" runat="server" Style="color: black; font-family: Calibri"
                                    Text="Share with us your experience about the product. Our quality consultants are waiting for your feedback. Your comments will help us upgrade our product quality and resolve the issues that you have with the current release."
                                    Width="403px"></asp:Label></td>
                            <td style="width: 100px; height: 47px" valign="middle">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/cc.jpg" /></td>
                        </tr>
                    </table>
                    <table style="width: 343px; border-top-style: none; border-top-color: white; font-size: small; color: black; border-left-width: 1px; border-left-color: limegreen; border-bottom-width: 1px; border-bottom-color: limegreen; border-right-width: 1px; border-right-color: limegreen;" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="font-weight: bold; background-image: url(Images/my_header.jpg); color: white; font-size: small; width: 451px; height: 18px;">Comments</td>
                        </tr>
                        <tr>
                            <td style="width: 451px; height: 207px;">
                                <asp:TextBox ID="TextBox1" runat="server" Height="196px" TextMode="MultiLine" Width="444px"></asp:TextBox><br />
                                <table style="width: 445px">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" BackColor="LemonChiffon" Font-Size="Small"
                                                ForeColor="Maroon" Visible="False" Width="331px">Your comments have been added. Thank You</asp:Label></td>
                                        <td style="width: 100px">
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/send_small.jpg"
                                                OnClick="ImageButton1_Click" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 451px; height: 20px">&nbsp;</td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td style="width: 90px">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Book Antiqua"
                                    ForeColor="DarkGray" Text="Product Rating"></asp:Label></td>
                            <td style="width: 100px">
                                <asp:Image ID="Image3" runat="server" Height="15px" ImageUrl="~/Images/arrow_down.jpg"
                                    Width="23px" /></td>
                        </tr>
                    </table>
                    <br />
                    Are you satisfied with this product?
                    <br />
                    Let us know about the level of your satisfaction .<br />
                    <br />
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 48px">Rating:
                            </td>
                            <td style="width: 73px">
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem Selected="True">-----</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem Value="2"></asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width: 100px">
                                <asp:LinkButton ID="LinkButton_tkt" runat="server" BackColor="Ivory" BorderColor="OliveDrab"
                                    BorderWidth="1px" CssClass="bar_format" Font-Bold="True" Font-Size="Small" Font-Underline="False"
                                    ForeColor="OliveDrab" OnClick="LinkButton_tkt_Click" Width="50px">Rate It</asp:LinkButton></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
        &nbsp;
        <div style="z-index: 101; left: 469px; width: 100px; position: absolute; top: 3px; height: 100px">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="prod_id" DataSourceID="SqlDataSource2"
                Width="241px">
                <EditItemTemplate>
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
                            <td style="font-size: small; color: #003399">Product ID:
                            </td>
                            <td style="font-size: small">
                                <asp:Label ID="prod_idLabel1" runat="server" Text='<%# Eval("prod_id") %>' Width="219px"></asp:Label></td>
                            <td style="font-size: small">
                                <asp:Label ID="Label4" runat="server" Width="25px"></asp:Label></td>
                            <td style="font-size: small; width: 19px">
                                <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/send_but.jpg" /></td>
                            <td style="font-size: small">
                                <asp:LinkButton ID="LinkButton1" runat="server" BackColor="Transparent" BorderStyle="None"
                                    BorderWidth="1px" CommandName="Update" Font-Bold="True" Font-Size="Small" Font-Underline="False"
                                    ForeColor="OliveDrab" Width="53px">Update</asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; width: 4255px; color: #003399"></td>
                            <td style="font-size: small; color: #003399">Product Name:</td>
                            <td style="font-size: small">
                                <asp:TextBox ID="prod_nameTextBox" runat="server" Text='<%# Bind("prod_name") %>'
                                    Width="213px"></asp:TextBox></td>
                            <td style="font-size: small"></td>
                            <td style="font-size: small; width: 19px">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/cancel.jpg" /></td>
                            <td style="font-size: small">
                                <asp:LinkButton ID="LinkButton2" runat="server" BackColor="Transparent" BorderStyle="None"
                                    BorderWidth="1px" CommandName="Edit" Font-Bold="True" Font-Size="Small" Font-Underline="False"
                                    ForeColor="OliveDrab" Width="53px">Cancel</asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; width: 4255px; color: #003399; height: 26px"></td>
                            <td style="font-size: small; color: #003399; height: 26px">Category:</td>
                            <td style="font-size: small; height: 26px">
                                <asp:TextBox ID="product_categoryTextBox" runat="server" Text='<%# Bind("product_category") %>'
                                    Width="213px"></asp:TextBox></td>
                            <td style="font-size: small; height: 26px"></td>
                            <td style="font-size: small; width: 19px; height: 26px"></td>
                            <td style="font-size: small; height: 26px"></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; width: 4255px; color: #003399"></td>
                            <td style="font-size: small; color: #003399">Cost:</td>
                            <td style="font-size: small">
                                <asp:TextBox ID="product_costTextBox" runat="server" Text='<%# Bind("product_cost") %>'
                                    Width="213px"></asp:TextBox></td>
                            <td style="font-size: small"></td>
                            <td style="font-size: small; width: 19px"></td>
                            <td style="font-size: small"></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; width: 4255px; color: #003399"></td>
                            <td style="font-size: small; color: #003399">Payment Methods:</td>
                            <td style="font-size: small">
                                <asp:TextBox ID="payment_methodTextBox" runat="server" Text='<%# Bind("payment_method") %>'
                                    Width="213px"></asp:TextBox></td>
                            <td style="font-size: small"></td>
                            <td style="font-size: small; width: 19px"></td>
                            <td style="font-size: small"></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; width: 4255px; color: #003399"></td>
                            <td style="font-size: small; color: #003399" valign="top">Product Detail:</td>
                            <td colspan="4" style="font-size: small; height: 32px">
                                <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" Height="192px" Text='<%# Bind("product_detail") %>'
                                    TextMode="MultiLine" Width="350px"></asp:TextBox></td>
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
                            <td style="font-size: small; color: #003399">Product ID:
                            </td>
                            <td style="font-size: small">
                                <asp:Label ID="prod_idLabel1" runat="server" Text='<%# Eval("prod_id") %>' Width="213px"></asp:Label></td>
                            <td style="font-size: small">
                                <asp:Label ID="Label4" runat="server" Width="25px"></asp:Label></td>
                            <td style="font-size: small; width: 19px">
                                <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/insert.jpg" /></td>
                            <td style="font-size: small">
                                <asp:LinkButton ID="LinkButton1" runat="server" BackColor="Transparent" BorderStyle="None"
                                    BorderWidth="1px" CommandName="Insert" Font-Bold="True" Font-Size="Small" Font-Underline="False"
                                    ForeColor="OliveDrab" Width="53px">Insert</asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; width: 4255px; color: #003399"></td>
                            <td style="font-size: small; color: #003399">Product Name:</td>
                            <td style="font-size: small">
                                <asp:TextBox ID="prod_nameTextBox" runat="server" Text='<%# Bind("prod_name") %>'
                                    Width="213px"></asp:TextBox></td>
                            <td style="font-size: small"></td>
                            <td style="font-size: small; width: 19px">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/cancel.jpg" /></td>
                            <td style="font-size: small">
                                <asp:LinkButton ID="LinkButton2" runat="server" BackColor="Transparent" BorderStyle="None"
                                    BorderWidth="1px" CommandName="Edit" Font-Bold="True" Font-Size="Small" Font-Underline="False"
                                    ForeColor="OliveDrab" Width="53px">Cancel</asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; width: 4255px; color: #003399; height: 26px"></td>
                            <td style="font-size: small; color: #003399; height: 26px">Category:</td>
                            <td style="font-size: small; height: 26px">
                                <asp:TextBox ID="product_categoryTextBox" runat="server" Text='<%# Bind("product_category") %>'
                                    Width="213px"></asp:TextBox></td>
                            <td style="font-size: small; height: 26px"></td>
                            <td style="font-size: small; width: 19px; height: 26px"></td>
                            <td style="font-size: small; height: 26px"></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; width: 4255px; color: #003399"></td>
                            <td style="font-size: small; color: #003399">Cost:</td>
                            <td style="font-size: small">
                                <asp:TextBox ID="product_costTextBox" runat="server" Text='<%# Bind("product_cost") %>'
                                    Width="213px"></asp:TextBox></td>
                            <td style="font-size: small"></td>
                            <td style="font-size: small; width: 19px"></td>
                            <td style="font-size: small"></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; width: 4255px; color: #003399"></td>
                            <td style="font-size: small; color: #003399">Payment Methods:</td>
                            <td style="font-size: small">
                                <asp:TextBox ID="payment_methodTextBox" runat="server" Text='<%# Bind("payment_method") %>'
                                    Width="213px"></asp:TextBox></td>
                            <td style="font-size: small"></td>
                            <td style="font-size: small; width: 19px"></td>
                            <td style="font-size: small"></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; width: 4255px; color: #003399"></td>
                            <td style="font-size: small; color: #003399" valign="top">Product Detail:</td>
                            <td colspan="4" style="font-size: small">
                                <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" Height="192px" Text='<%# Bind("product_detail") %>'
                                    TextMode="MultiLine" Width="334px"></asp:TextBox></td>
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
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert"></asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    <table style="width: 312px; font-size: small; border-top-width: 1px; border-left-width: 1px; border-left-color: #00c000; border-bottom-width: 1px; border-bottom-color: #00c000; border-top-color: #00c000; border-right-width: 1px; border-right-color: #00c000;" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="3" style="font-weight: bold; background-image: url(Images/my_header.jpg); color: white; height: 18px">Product Detail</td>
                        </tr>
                        <tr>
                            <td style="font-size: small; color: #003399"></td>
                            <td style="font-size: small; color: steelblue; height: 32px;">Product ID:
                            </td>
                            <td style="font-size: small; width: 217px">
                                <asp:Label ID="prod_idLabel" runat="server" Text='<%# Eval("prod_id") %>' Width="158px" ForeColor="Black"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; color: #003399"></td>
                            <td style="font-size: small; color: steelblue; height: 32px;">Product Title:</td>
                            <td style="font-size: small; width: 217px">
                                <asp:Label ID="prod_nameLabel" runat="server" Text='<%# Bind("prod_name") %>' Width="158px" ForeColor="Black"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; color: #003399; height: 26px"></td>
                            <td style="font-size: small; color: steelblue; height: 32px">Category:</td>
                            <td style="font-size: small; width: 217px; height: 26px">
                                <asp:Label ID="product_categoryLabel" runat="server" Text='<%# Bind("product_category") %>'
                                    Width="158px" ForeColor="Black"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; color: #003399"></td>
                            <td style="font-size: small; color: steelblue; height: 32px;">Cost:</td>
                            <td style="font-size: small; width: 217px">
                                <asp:Label ID="product_costLabel" runat="server" Text='<%# Bind("product_cost") %>'
                                    Width="158px" ForeColor="Black"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; color: #003399"></td>
                            <td style="font-size: small; color: steelblue; height: 32px;">Payment<br />
                                Methods:</td>
                            <td style="font-size: small; width: 217px">
                                <asp:Label ID="payment_methodLabel" runat="server" Text='<%# Bind("payment_method") %>'
                                    Width="158px" ForeColor="Black"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-size: small; color: #003399; height: 32px"></td>
                            <td colspan="2" style="font-size: small; height: 32px; color: darkgray;" valign="top">
                                <br />
                                Product Specifications:<br />
                                <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" Height="387px" Text='<%# Bind("product_detail") %>'
                                    TextMode="MultiLine" Width="297px" ForeColor="Black" ReadOnly="True"></asp:TextBox>&nbsp;</td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                DeleteCommand="DELETE FROM [prod_info] WHERE [prod_id] = @prod_id" InsertCommand="INSERT INTO [prod_info] ([prod_name], [product_category], [product_cost], [payment_method], [product_detail]) VALUES (@prod_name, @product_category, @product_cost, @payment_method, @product_detail)"
                SelectCommand="SELECT [prod_id], [prod_name], [product_category], [product_cost], [payment_method], [product_detail] FROM [prod_info] WHERE ([prod_id] = @prod_id)"
                UpdateCommand="UPDATE [prod_info] SET [prod_name] = @prod_name, [product_category] = @product_category, [product_cost] = @product_cost, [payment_method] = @payment_method, [product_detail] = @product_detail WHERE [prod_id] = @prod_id">
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
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table style="width: 591px">
            <tr>
                <td style="width: 351px"></td>
                <td style="width: 31px">
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="X-Small" Font-Underline="False"
                        ForeColor="SteelBlue" NavigateUrl="~/about_us.aspx" Width="51px">About Us</asp:HyperLink></td>
                <td>
                    <img src="Images/lint_v.jpg" /></td>
                <td style="width: 62px">
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="X-Small" Font-Underline="False"
                        ForeColor="SteelBlue" NavigateUrl="~/contact_us.aspx" Width="53px">Contact Us</asp:HyperLink></td>
                <td>
                    <img src="Images/lint_v.jpg" /></td>
                <td style="width: 100px">
                    <asp:Label ID="Label221" runat="server" Font-Size="X-Small" Font-Underline="False"
                        ForeColor="Gray" Text="© Veixy.com"></asp:Label></td>
                <td style="width: 98px"></td>
            </tr>
        </table>
    </div>
</asp:Content>