<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="huanshu_qr.aspx.cs" Inherits="tushuweb.huanshu_qr" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>归还确认</h2>
    <asp:Label ID="l_id" runat="server" Text="Label" Visible="False"></asp:Label>
    <div>
        <asp:Button ID="Button1" runat="server" Text="确认归还" OnClick="Button1_Click" />
        <a href="huanshu.aspx">返回归还图书</a>
    </div>
</asp:Content>
