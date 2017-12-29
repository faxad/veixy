<%@ Page Language="C#" MasterPageFile="~/top_mp.master" AutoEventWireup="true" CodeFile="main_page.aspx.cs" Inherits="main_page" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    hello world<asp:DropDownList
        ID="DropDownList1" runat="server">
    </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
</asp:Content>