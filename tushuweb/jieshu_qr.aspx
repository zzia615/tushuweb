<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="jieshu_qr.aspx.cs" Inherits="tushuweb.jieshu_qr" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>借书确认</h2>
    <asp:Label ID="l_id" runat="server" Text="Label" Visible="False"></asp:Label>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="借阅人"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="jyr" runat="server" DataSourceID="SqlDataSource1" DataTextField="xingming" DataValueField="zhanghao"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tushuConnectionString %>" SelectCommand="SELECT * FROM [denglu] where leibie='普通用户'"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="借阅人不能为空" ForeColor="Red" ControlToValidate="jyr"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="确认借书" OnClick="Button1_Click" />
                        <a href="jieshu.aspx">返回借阅图书</a>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
