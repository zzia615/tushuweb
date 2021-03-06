﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="huanshu.aspx.cs" Inherits="tushuweb.huanshu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>归还图书</h3>
    <div>
        <select runat="server" id="tjlb">
            <option value="mingcheng">图书</option>
            <option value="zuozhe">作者</option>
            <option value="chubanshe">出版社</option>
            <option value="zhuangtai">状态</option>
        </select>
        <asp:TextBox ID="tjnr" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
    </div>
    
    <asp:GridView Width="100%" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="mingcheng" HeaderText="图书" SortExpression="mingcheng" />
            <asp:BoundField DataField="zuozhe" HeaderText="作者" SortExpression="zuozhe" />
            <asp:BoundField DataField="chubanshe" HeaderText="出版社" SortExpression="chubanshe" />
            <asp:BoundField DataField="zhuangtai" HeaderText="状态" SortExpression="zhuangtai" Visible="false"/>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"huanshu_qr.aspx?id="+Eval("id") %>' Text="还书"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tushuConnectionString %>" DeleteCommand="DELETE FROM [tushu] WHERE [id] = @id" InsertCommand="INSERT INTO [tushu] ([mingcheng], [zuozhe], [chubanshe], [zhuangtai]) VALUES (@mingcheng, @zuozhe, @chubanshe, @zhuangtai)" SelectCommand="SELECT * FROM [tushu] where isnull(zhuangtai,'')='已借阅'" UpdateCommand="UPDATE [tushu] SET [mingcheng] = @mingcheng, [zuozhe] = @zuozhe, [chubanshe] = @chubanshe, [zhuangtai] = @zhuangtai WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="mingcheng" Type="String" />
            <asp:Parameter Name="zuozhe" Type="String" />
            <asp:Parameter Name="chubanshe" Type="String" />
            <asp:Parameter Name="zhuangtai" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="mingcheng" Type="String" />
            <asp:Parameter Name="zuozhe" Type="String" />
            <asp:Parameter Name="chubanshe" Type="String" />
            <asp:Parameter Name="zhuangtai" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
