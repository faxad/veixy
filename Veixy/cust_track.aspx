<%@ Page Language="C#" MasterPageFile="~/top_mp.master" AutoEventWireup="true" CodeFile="cust_track.aspx.cs" Inherits="cust_track" Title="Veixy-Track Request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
function DIV1_onclick() {

}
    </script>

    <br />
    In order to track
    your support ticket please specify the ticket # assigned to you by<br />
    our&nbsp; support system.<br />
    <br />

    <table border="0" cellpadding="0" cellspacing="0" style="width: 552px">
        <tr>
            <td style="width: 279px; height: 25px;" align="right">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="OliveDrab" Text="Ticket #:"></asp:Label></td>
            <td style="width: 162px; height: 25px;">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            <td style="width: 100px; height: 25px;">
                <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" ImageUrl="~/Images/track.jpg" /></td>
        </tr>
    </table>
    <table style="width: 555px">
        <tr>
            <td style="width: 436px">
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="Invalid Ticket #" MaximumValue="99999" MinimumValue="1"></asp:RangeValidator></td>
            <td style="width: 100px">
                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="The specified Ticket # is not valid or does not exist."
                    Visible="False" Width="323px"></asp:Label></td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT [token_no], [start_date],[closed_by], [held_by], [close_date], [open_close], [msg_subject], [sent_from] FROM [cust_inbox] WHERE ([token_no] = @token_no)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="token_no" PropertyName="Text" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="token_no" DataSourceID="SqlDataSource2"
        DefaultMode="Edit" OnDataBound="FormView1_DataBound">
        <EditItemTemplate>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="SteelBlue" Text="Ticket Overview"
                            Width="104px"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:Image ID="Image2" runat="server" Height="15px" ImageUrl="~/Images/arrow_down.jpg"
                            Width="23px" /></td>
                </tr>
            </table>
            <table cellspacing="0" style="width: 515px">
                <tr>
                    <td style="width: 70px; font-weight: bold; color: darkolivegreen;">Ticket #:</td>
                    <td style="width: 100px">
                        <asp:Label ID="token_noLabel" runat="server" Text='<%# Eval("token_no") %>'></asp:Label></td>
                    <td style="width: 100px"></td>
                </tr>
                <tr>
                    <td style="width: 70px; font-weight: bold; color: darkolivegreen;">Started At:</td>
                    <td style="width: 100px">
                        <asp:Label ID="start_dateLabel" runat="server" Text='<%# Eval("start_date") %>' Width="185px"></asp:Label></td>
                    <td style="width: 100px"></td>
                </tr>
                <tr>
                    <td style="width: 70px; font-weight: bold; color: darkolivegreen;">Held By:</td>
                    <td style="width: 100px">
                        <asp:Label ID="held_byLabel" runat="server" Text='<%# Eval("held_by") %>'></asp:Label>
                    </td>
                    <td style="width: 100px"></td>
                </tr>
                <tr>
                    <td style="width: 70px; font-weight: bold; color: darkolivegreen;">Status:</td>
                    <td style="width: 100px; height: 17px">
                        <asp:Label ID="open_closeLabel" runat="server" Text='<%# Eval("open_close") %>' Visible="False" ForeColor="Olive"></asp:Label>
                        <asp:Label ID="Label2" runat="server"></asp:Label></td>
                    <td style="width: 100px; height: 17px"></td>
                </tr>
                <tr>
                    <td style="width: 70px; font-weight: bold; color: darkolivegreen;">Closed At:</td>
                    <td style="width: 100px">
                        <asp:Label ID="close_dateLabel" runat="server" Text='<%# Eval("close_date") %>' Width="185px"></asp:Label></td>
                    <td style="width: 100px"></td>
                </tr>
                <tr>
                    <td style="font-weight: bold; width: 70px; color: darkolivegreen">Closed By:</td>
                    <td style="width: 100px">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("closed_by") %>' Width="185px"></asp:Label></td>
                    <td style="width: 100px"></td>
                </tr>
                <tr>
                    <td style="width: 70px; font-weight: bold; color: darkolivegreen;">Started By:</td>
                    <td style="width: 100px">
                        <asp:Label ID="sent_fromLabel" runat="server" Text='<%# Eval("sent_from") %>' Width="187px"></asp:Label></td>
                    <td style="width: 100px"></td>
                </tr>
                <tr>
                    <td style="width: 70px; font-weight: bold; color: darkolivegreen;">Issue Title:</td>
                    <td colspan="2">
                        <asp:Label ID="msg_subjectLabel" runat="server" Text='<%# Eval("msg_subject") %>' ForeColor="#C04000" Width="425px"></asp:Label></td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            token_no:
            <asp:TextBox ID="token_noTextBox" runat="server" Text='<%# Bind("token_no") %>'>
            </asp:TextBox><br />
            start_date:
            <asp:TextBox ID="start_dateTextBox" runat="server" Text='<%# Bind("start_date") %>'>
            </asp:TextBox><br />
            held_by:
            <asp:TextBox ID="held_byTextBox" runat="server" Text='<%# Bind("held_by") %>'>
            </asp:TextBox><br />
            close_date:
            <asp:TextBox ID="close_dateTextBox" runat="server" Text='<%# Bind("close_date") %>'>
            </asp:TextBox><br />
            open_close:
            <asp:TextBox ID="open_closeTextBox" runat="server" Text='<%# Bind("open_close") %>'>
            </asp:TextBox><br />
            msg_subject:
            <asp:TextBox ID="msg_subjectTextBox" runat="server" Text='<%# Bind("msg_subject") %>'>
            </asp:TextBox><br />
            sent_from:
            <asp:TextBox ID="sent_fromTextBox" runat="server" Text='<%# Bind("sent_from") %>'>
            </asp:TextBox><br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert">
            </asp:LinkButton>
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            token_no:
            <asp:Label ID="token_noLabel" runat="server" Text='<%# Eval("token_no") %>'></asp:Label><br />
            start_date:
            <asp:Label ID="start_dateLabel" runat="server" Text='<%# Bind("start_date") %>'></asp:Label><br />
            held_by:
            <asp:Label ID="held_byLabel" runat="server" Text='<%# Bind("held_by") %>'></asp:Label><br />
            close_date:
            <asp:Label ID="close_dateLabel" runat="server" Text='<%# Bind("close_date") %>' Width="142px"></asp:Label><br />
            open_close:
            <asp:Label ID="open_closeLabel" runat="server" Text='<%# Bind("open_close") %>'></asp:Label><br />
            msg_subject:
            <asp:Label ID="msg_subjectLabel" runat="server" Text='<%# Bind("msg_subject") %>'></asp:Label><br />
            sent_from:
            <asp:Label ID="sent_fromLabel" runat="server" Text='<%# Bind("sent_from") %>' Font-Bold="False" ForeColor="#C04000"></asp:Label><br />
        </ItemTemplate>
        <EmptyDataTemplate>
            <asp:Label ID="open_closeLabel" runat="server" Text='<%# Eval("open_close") %>' Visible="False"></asp:Label>
            <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
        </EmptyDataTemplate>
    </asp:FormView>
    <div id="DIV1" style="z-index: 101; left: 553px; width: 100px; position: absolute; top: 123px; height: 236px"
        onclick="return DIV1_onclick()">
        <img src="Images_Net/officeoutoffocus2.jpg" />
    </div>
    <br />
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 100px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="SteelBlue" Text="Ticket Detail"
                    Width="104px"></asp:Label></td>
            <td style="width: 100px">
                <asp:Image ID="Image2" runat="server" Height="15px" ImageUrl="~/Images/arrow_down.jpg"
                    Width="23px" /></td>
        </tr>
    </table>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <table cellspacing="0">
                <tr>
                    <td style="width: 96px; height: 17px; font-weight: bold; color: darkolivegreen;">Date &amp; Time:</td>
                    <td style="width: 464px; height: 17px">
                        <asp:Label ID="msg_dateLabel" runat="server" Text='<%# Eval("msg_date") %>' ForeColor="OliveDrab"></asp:Label></td>
                    <td style="width: 125px; height: 17px"></td>
                    <td style="width: 100px; height: 17px"></td>
                </tr>
                <tr>
                    <td style="width: 96px; height: 17px; font-weight: bold; color: darkolivegreen;">Comments By:</td>
                    <td style="width: 464px; height: 17px">
                        <asp:Label ID="msg_fromLabel" runat="server" Text='<%# Eval("msg_from") %>'></asp:Label></td>
                    <td style="width: 125px; height: 17px"></td>
                    <td style="width: 100px; height: 17px"></td>
                </tr>
            </table>
            <asp:TextBox ID="TextBox2" runat="server" Height="100px" Text='<%# Eval("act_msg") %>'
                TextMode="MultiLine" Width="755px" ReadOnly="True"></asp:TextBox>
        </ItemTemplate>
    </asp:DataList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
        SelectCommand="SELECT [act_msg], [msg_date], [msg_from] FROM [act_onbox] WHERE ([token_no] = @token_no) ORDER BY [msg_date] ASC">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="token_no" PropertyName="Text" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="z-index: 102; left: -151px; width: 134px; position: absolute; top: 277px; height: 173px">
        <img src="Images_Net/2_customer_relations.jpg" />
    </div>
</asp:Content>