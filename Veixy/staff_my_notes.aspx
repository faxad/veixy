<%@ Page Language="C#" MasterPageFile="~/staff_mp.master" AutoEventWireup="true" CodeFile="staff_my_notes.aspx.cs" Inherits="staff_my_notes" Title="Veixy-My Notes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="z-index: 101; left: 5px; width: 100px; position: absolute; top: 3px; height: 100px" __designer:dtid="12103423998558238">
                <img src="Images/mynotes.jpg" />
            </div>
            <br />
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="note_id" DataSourceID="SqlDataSource1" Font-Size="Small" Width="636px">
                <Columns>
                    <asp:BoundField DataField="note_id" HeaderText="Note Sno." ReadOnly="True" InsertVisible="False" SortExpression="note_id">
                        <HeaderStyle Width="60px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="date_time" HeaderText="Date &amp; Time" SortExpression="date_time">
                        <HeaderStyle Width="80px"></HeaderStyle>

                        <ItemStyle Width="80px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Note Detail">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Width="468px" Height="59px" TextMode="MultiLine" Text='<%# Eval("note_txt") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField CommandName="Delete" ImageUrl="~/Images/delete.jpg" Text="Button" ButtonType="Image">
                        <HeaderStyle Width="5px"></HeaderStyle>

                        <ItemStyle Width="5px"></ItemStyle>
                    </asp:ButtonField>
                </Columns>

                <HeaderStyle BackColor="SteelBlue" BorderStyle="None" Font-Bold="False" ForeColor="White"></HeaderStyle>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRM_dbConnectionString %>" DeleteCommand="DELETE FROM [my_notes] WHERE [note_id] = @note_id" InsertCommand="INSERT INTO [my_notes] ([date_time], [note_txt]) VALUES (@date_time, @note_txt)" SelectCommand="SELECT [note_id], [date_time], [note_txt] FROM [my_notes] WHERE ([user_name] = @user_name)" UpdateCommand="UPDATE [my_notes] SET [date_time] = @date_time, [note_txt] = @note_txt WHERE [note_id] = @note_id">
                <SelectParameters>
                    <asp:SessionParameter SessionField="user_session" Name="user_name" Type="String"></asp:SessionParameter>
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="note_id" Type="Decimal"></asp:Parameter>
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="date_time" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="note_txt" Type="String"></asp:Parameter>
                    <asp:Parameter Name="note_id" Type="Decimal"></asp:Parameter>
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="date_time" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="note_txt" Type="String"></asp:Parameter>
                </InsertParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>