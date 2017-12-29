<%@ Page Language="C#" MasterPageFile="~/admin_mp.master" AutoEventWireup="true" CodeFile="admin_main.aspx.cs" Inherits="admin_main" Title="Veixy-Control Panel Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <table style="font-size: x-small; width: 817px">
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">
                <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Size="Small"
                    Font-Underline="False" ForeColor="SteelBlue">Accounts Info</asp:LinkButton></td>
            <td style="width: 313px">
                <asp:LinkButton ID="LinkButton11" runat="server" Font-Bold="True" Font-Size="Small"
                    Font-Underline="False" ForeColor="SteelBlue" Width="132px" PostBackUrl="~/admin_reg_pending.aspx">Pending Registrations</asp:LinkButton></td>
            <td style="width: 299px">
                <asp:LinkButton ID="LinkButton17" runat="server" Font-Bold="True" Font-Size="Small"
                    Font-Underline="False" ForeColor="SteelBlue" Width="132px">Reports</asp:LinkButton></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px; height: 18px"></td>
            <td align="left" style="width: 362px; height: 18px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="LinkButton2" runat="server"
                Font-Bold="True" Font-Size="X-Small" Font-Underline="False" ForeColor="Olive" PostBackUrl="~/admin_accounts.aspx">Customers Accounts</asp:LinkButton></td>
            <td style="width: 313px; height: 18px">
                <asp:Label ID="Label4" runat="server" Font-Size="X-Small" ForeColor="Silver" Text="Detail:"></asp:Label>
                Allow newly signed up staff
            </td>
            <td style="width: 299px; height: 18px">&nbsp; &nbsp; &nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton19" runat="server" Font-Bold="True" Font-Size="X-Small"
                    Font-Underline="False" ForeColor="Olive" PostBackUrl="~/admin_rep1.aspx">Current System Status</asp:LinkButton></td>
            <td style="width: 100px; height: 18px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td align="left" style="width: 362px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="LinkButton3" runat="server"
                Font-Bold="True" Font-Size="X-Small" Font-Underline="False" ForeColor="Olive" PostBackUrl="~/admin_saccounts.aspx">Staff Members Accounts</asp:LinkButton></td>
            <td style="width: 313px">to be a part of the support system.</td>
            <td style="width: 299px">&nbsp; &nbsp; &nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton18" runat="server" Font-Bold="True" Font-Size="X-Small"
                    Font-Underline="False" ForeColor="Olive" PostBackUrl="~/admin_rep2.aspx">Daily System Status</asp:LinkButton></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="font-size: x-small; width: 362px">
                <asp:Label ID="Label1" runat="server" Font-Size="X-Small" ForeColor="Silver" Text="Detail:"></asp:Label>
                View the detailed information
            </td>
            <td style="width: 313px">.</td>
            <td style="width: 299px">
                <asp:Label ID="Label8" runat="server" Font-Size="X-Small" ForeColor="Silver" Text="Detail:"></asp:Label>
                Generate reports for the analysis</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">about the account of registered users.</td>
            <td style="width: 313px">.</td>
            <td style="width: 299px">&nbsp;of the customer support system.</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">.</td>
            <td style="width: 313px">
                <asp:LinkButton ID="LinkButton12" runat="server" Font-Bold="True" Font-Size="Small"
                    Font-Underline="False" ForeColor="SteelBlue" Width="142px" PostBackUrl="~/admin_cschedule.aspx">Schedule Management</asp:LinkButton></td>
            <td style="width: 299px">.</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">.</td>
            <td style="width: 313px">
                <asp:Label ID="Label5" runat="server" Font-Size="X-Small" ForeColor="Silver" Text="Detail:"></asp:Label>
                Create &amp; customize schedule</td>
            <td style="width: 299px">.</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">
                <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" Font-Size="Small"
                    Font-Underline="False" ForeColor="SteelBlue">Message Box</asp:LinkButton></td>
            <td style="width: 313px">for the staff members in effective way.</td>
            <td style="width: 299px">
                <asp:LinkButton ID="LinkButton21" runat="server" Font-Bold="True" Font-Size="Small"
                    Font-Underline="False" ForeColor="SteelBlue" Width="132px" PostBackUrl="~/admin_logs.aspx">System Log</asp:LinkButton></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px; height: 18px"></td>
            <td style="width: 362px; height: 18px">&nbsp; &nbsp; &nbsp; &nbsp;
                <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" Font-Size="X-Small"
                    Font-Underline="False" ForeColor="Olive" PostBackUrl="~/admin_msgbox.aspx">Inbox</asp:LinkButton>
                <asp:Label ID="Label12" runat="server" Font-Size="X-Small" ForeColor="#C00000"></asp:Label></td>
            <td style="width: 313px; height: 18px">.</td>
            <td style="width: 299px; height: 18px">
                <asp:Label ID="Label9" runat="server" Font-Size="X-Small" ForeColor="Silver" Text="Detail:"></asp:Label>
                See who is visiting when. Complete</td>
            <td style="width: 100px; height: 18px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">&nbsp; &nbsp; &nbsp; &nbsp;
                <asp:LinkButton ID="LinkButton6" runat="server" Font-Bold="True" Font-Size="X-Small"
                    Font-Underline="False" ForeColor="Olive" PostBackUrl="~/admin_compose.aspx?case=0">Compose</asp:LinkButton></td>
            <td style="width: 313px">.</td>
            <td style="width: 299px">&nbsp;history of every log-in &amp; log-out activity.</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton7" runat="server" Font-Bold="True" Font-Size="X-Small"
                    Font-Underline="False" ForeColor="Olive" PostBackUrl="~/admin_draftbox.aspx">Drafts</asp:LinkButton></td>
            <td style="width: 313px">
                <asp:LinkButton ID="LinkButton13" runat="server" Font-Bold="True" Font-Size="Small"
                    Font-Underline="False" ForeColor="SteelBlue" PostBackUrl="~/admin_complaints.aspx"
                    Width="142px">Complaint Box</asp:LinkButton></td>
            <td style="width: 299px">.</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">&nbsp; &nbsp; &nbsp; &nbsp;
                <asp:LinkButton ID="LinkButton8" runat="server" Font-Bold="True" Font-Size="X-Small"
                    Font-Underline="False" ForeColor="Olive" PostBackUrl="~/admin_sentbox.aspx">Sent Items</asp:LinkButton></td>
            <td style="width: 313px">
                <asp:Label ID="Label6" runat="server" Font-Size="X-Small" ForeColor="Silver" Text="Detail:"></asp:Label>
                Read what the users have to say</td>
            <td style="width: 299px">
                <asp:LinkButton ID="LinkButton22" runat="server" Font-Bold="True" Font-Size="Small"
                    Font-Underline="False" ForeColor="SteelBlue" Width="152px" OnClick="LinkButton22_Click" PostBackUrl="~/admin_ch_pass.aspx">Change Password</asp:LinkButton></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">&nbsp; &nbsp; &nbsp; &nbsp;
                <asp:LinkButton ID="LinkButton9" runat="server" Font-Bold="True" Font-Size="X-Small"
                    Font-Underline="False" ForeColor="Olive" PostBackUrl="~/admin_delbox.aspx">Deleted</asp:LinkButton></td>
            <td style="width: 313px">about the products &amp; support services.</td>
            <td style="width: 299px">
                <asp:Label ID="Label10" runat="server" Font-Size="X-Small" ForeColor="Silver" Text="Detail:"></asp:Label>
                Not confident about the secracy</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">
                <asp:Label ID="Label2" runat="server" Font-Size="X-Small" ForeColor="Silver" Text="Detail:"></asp:Label>
                Interact with the customers &amp;</td>
            <td style="width: 313px">.</td>
            <td style="width: 299px">&nbsp;of the admin password. Create a new</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">the staff by sending personal messages.</td>
            <td style="width: 313px">.</td>
            <td style="width: 299px">&nbsp;password for taccessing the Control Panel.</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">.</td>
            <td style="width: 313px">
                <asp:LinkButton ID="LinkButton14" runat="server" Font-Bold="True" Font-Size="Small"
                    Font-Underline="False" ForeColor="SteelBlue" Width="142px">Staff Evaluation</asp:LinkButton></td>
            <td style="width: 299px">.</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">.</td>
            <td style="width: 313px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="LinkButton15" runat="server"
                Font-Bold="True" Font-Size="X-Small" Font-Underline="False" ForeColor="Olive" PostBackUrl="~/admin_eval1.aspx" OnClick="LinkButton15_Click">Timed Evaluation</asp:LinkButton></td>
            <td style="width: 299px">.</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">
                <asp:LinkButton ID="LinkButton10" runat="server" Font-Bold="True" Font-Size="Small"
                    Font-Underline="False" ForeColor="SteelBlue" PostBackUrl="~/admin_products.aspx">Product Catalogue</asp:LinkButton></td>
            <td style="width: 313px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton16" runat="server" Font-Bold="True" Font-Size="X-Small"
                    Font-Underline="False" ForeColor="Olive" PostBackUrl="~/admin_eval2.aspx">Global Evaluation</asp:LinkButton></td>
            <td style="width: 299px">
                <asp:LinkButton ID="LinkButton23" runat="server" Font-Bold="True" Font-Size="Small"
                    Font-Underline="False" ForeColor="SteelBlue" Width="152px" OnClick="LinkButton23_Click">Log-In As Staff Member</asp:LinkButton></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">
                <asp:Label ID="Label3" runat="server" Font-Size="X-Small" ForeColor="Silver" Text="Detail:"></asp:Label>
                Manage the products &amp; services.</td>
            <td style="width: 313px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton20" runat="server" Font-Bold="True" Font-Size="X-Small"
                    Font-Underline="False" ForeColor="Olive" PostBackUrl="~/admin_eval3.aspx">4 Factor Evaluation</asp:LinkButton></td>
            <td style="width: 299px">
                <asp:Label ID="Label11" runat="server" Font-Size="X-Small" ForeColor="Silver" Text="Detail:"></asp:Label>
                Experience the live staff member's</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">You can add new services or modify the</td>
            <td style="width: 313px">
                <asp:Label ID="Label7" runat="server" Font-Size="X-Small" ForeColor="Silver" Text="Detail:"></asp:Label>
                Monitor the services of the staff,</td>
            <td style="width: 299px">environment in a complete invisible mode.</td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px">existing ones.</td>
            <td style="width: 313px">take corrective decisions to improve the</td>
            <td style="width: 299px"></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 182px"></td>
            <td style="width: 362px"></td>
            <td style="width: 313px">quality as well as customer's satisfaction.</td>
            <td style="width: 299px"></td>
            <td style="width: 100px"></td>
        </tr>
    </table>
</asp:Content>