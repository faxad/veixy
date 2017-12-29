<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_track.aspx.cs" Inherits="staff_track" Title="Veixy-Track Request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
function TABLE1_onclick() {

}

function TABLE2_onclick() {

}
    </script>

    <div style="z-index: 101; left: 3px; width: 100px; position: absolute; top: 4px; height: 100px">
        <img src="Images/req_track.jpg" />
    </div>

    <br />
    <br />
    <table style="font-size: small; width: 640px">
        <tr>
            <td style="width: 100px">
                <asp:Label ID="Label5" runat="server" Text="Please specify the Ticket #  above to track the request."
                    Width="454px"></asp:Label></td>
        </tr>
    </table>
    <table style="width: 524px; font-size: small;">
        <tr>
            <td style="width: 325px"></td>
            <td style="width: 100px">
                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="The specified Ticket # is not valid or does not exist."
                    Visible="False" Width="323px"></asp:Label></td>
        </tr>
    </table>

    <table id="TABLE2" style="font-size: small; width: 632px" onclick="return TABLE2_onclick()">
        <tr>
            <td style="width: 100px; height: 517px;" valign="top">
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
                        <br />
                        <table cellspacing="0" style="width: 567px">
                            <tr>
                                <td style="font-weight: bold; width: 181px; color: darkolivegreen">
                                    <span style="text-decoration: underline">Ticket #:</span></td>
                                <td style="width: 116px">
                                    <asp:Label ID="token_noLabel" runat="server" Font-Bold="True" ForeColor="SteelBlue"
                                        Text='<%# Eval("token_no") %>'></asp:Label></td>
                                <td style="font-weight: bold; width: 69px; color: darkolivegreen">
                                    <span style="text-decoration: underline">Association:</span></td>
                                <td style="width: 100px">
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("association") %>'
                                        Width="202px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold; width: 181px; color: darkolivegreen">
                                    <span style="text-decoration: underline">Started At:</span></td>
                                <td style="width: 116px">
                                    <asp:Label ID="start_dateLabel" runat="server" Text='<%# Eval("start_date") %>' Width="185px"></asp:Label></td>
                                <td style="font-weight: bold; width: 69px; color: darkolivegreen">
                                    <span style="text-decoration: underline">Started By:</span></td>
                                <td style="width: 100px">
                                    <asp:Label ID="sent_fromLabel" runat="server" Text='<%# Eval("sent_from") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold; width: 181px; color: darkolivegreen">
                                    <span style="text-decoration: underline">Locked By:</span></td>
                                <td style="width: 116px">
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("lock_by") %>'></asp:Label></td>
                                <td style="font-weight: bold; width: 69px; color: darkolivegreen">
                                    <span style="text-decoration: underline">Closed At:</span></td>
                                <td style="width: 100px">
                                    <asp:Label ID="close_dateLabel" runat="server" Text='<%# Eval("close_date") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold; width: 181px; color: darkolivegreen">
                                    <span style="text-decoration: underline">Held By:</span></td>
                                <td style="width: 116px">
                                    <asp:Label ID="held_byLabel" runat="server" Text='<%# Eval("held_by") %>'></asp:Label>
                                </td>
                                <td style="font-weight: bold; width: 69px; color: darkolivegreen">
                                    <span style="text-decoration: underline">Closed By:</span></td>
                                <td style="width: 100px">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("closed_by") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold; width: 181px; color: darkolivegreen">
                                    <span style="text-decoration: underline">Status:</span></td>
                                <td style="width: 116px; height: 17px">
                                    <asp:Label ID="open_closeLabel" runat="server" Text='<%# Eval("open_close") %>' Visible="False"></asp:Label>
                                    <asp:Label ID="Label2" runat="server"></asp:Label></td>
                                <td style="font-weight: bold; width: 69px; color: darkolivegreen">
                                    <span style="text-decoration: underline"></span>
                                </td>
                                <td style="width: 100px"></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold; width: 181px; color: darkolivegreen">
                                    <span style="text-decoration: underline">Issue Title:</span></td>
                                <td colspan="3" style="height: 17px">
                                    <asp:Label ID="msg_subjectLabel" runat="server" Text='<%# Eval("msg_subject") %>' ForeColor="Gray" Width="493px"></asp:Label></td>
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
                        <asp:Label ID="close_dateLabel" runat="server" Text='<%# Bind("close_date") %>'></asp:Label><br />
                        open_close:
                        <asp:Label ID="open_closeLabel" runat="server" Text='<%# Bind("open_close") %>'></asp:Label><br />
                        msg_subject:
                        <asp:Label ID="msg_subjectLabel" runat="server" Text='<%# Bind("msg_subject") %>'></asp:Label><br />
                        sent_from:
                        <asp:Label ID="sent_fromLabel" runat="server" Text='<%# Bind("sent_from") %>'></asp:Label><br />
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <asp:Label ID="open_closeLabel" runat="server" Text='<%# Eval("open_close") %>' Visible="False"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
                    </EmptyDataTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                    SelectCommand="SELECT [token_no], [start_date], [held_by], [close_date], [open_close], [msg_subject], [sent_from],[association],[lock_by],[closed_by] FROM [cust_inbox] WHERE ([token_no] = @token_no)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="token_no" QueryStringField="ticket_query" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <table border="0" cellpadding="0" cellspacing="0" style="left: 444px; top: -55px; width: 164px;">
                    <tr>
                        <td style="height: 16px;">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="SteelBlue" Text="Ticket Detail"
                                Width="82px"></asp:Label></td>
                        <td style="width: 100px; height: 16px;">
                            <asp:Image ID="Image2" runat="server" Height="15px" ImageUrl="~/Images/arrow_down.jpg"
                                Width="23px" /></td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>"
                    SelectCommand="SELECT [act_msg], [msg_date], [msg_from] FROM [act_onbox] WHERE ([token_no] = @token_no) ORDER BY [msg_date] DESC">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="token_no" QueryStringField="ticket_query" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Panel ID="Panel1" runat="server" Height="255px" ScrollBars="Vertical" Width="632px">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <table cellspacing="0">
                                <tr>
                                    <td style="font-weight: bold; width: 96px; color: darkolivegreen; height: 17px">Date &amp; Time:</td>
                                    <td style="width: 464px; height: 17px">
                                        <asp:Label ID="msg_dateLabel" runat="server" ForeColor="OliveDrab" Text='<%# Eval("msg_date") %>'></asp:Label></td>
                                    <td style="width: 125px; height: 17px"></td>
                                    <td style="width: 100px; height: 17px"></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; width: 96px; color: darkolivegreen; height: 17px">Comments By:</td>
                                    <td style="width: 464px; height: 17px">
                                        <asp:Label ID="msg_fromLabel" runat="server" Text='<%# Eval("msg_from") %>'></asp:Label></td>
                                    <td style="width: 125px; height: 17px"></td>
                                    <td style="width: 100px; height: 17px"></td>
                                </tr>
                            </table>
                            <asp:TextBox ID="TextBox2" runat="server" Height="100px" Text='<%# Eval("act_msg") %>'
                                TextMode="MultiLine" Width="607px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:DataList>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>