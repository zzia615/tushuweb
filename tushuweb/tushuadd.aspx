<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tushuadd.aspx.cs" Inherits="tushuweb.tushuadd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>图书管理系统</title> 
    <style>
        html,body{
            margin:0;
            padding:0;
        }

        body{
            background:#075b3d;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="margin:150px auto;width:300px;background:rgba(255, 255, 255, 0.80);box-shadow:rgba(255, 255, 0, 0.79) 2px 2px 3px;padding:20px;">
        <h2>新增图书</h2>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="图书"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="mingcheng" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="图书不能为空" ForeColor="Red" ControlToValidate="mingcheng"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="作者"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="zuozhe" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="作者不能为空" ForeColor="Red" ControlToValidate="zuozhe"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="出版社"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="chubanshe" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="出版社不能为空" ForeColor="Red" ControlToValidate="chubanshe"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="新增图书" OnClick="Button1_Click" />
                        <a href="tushu.aspx">返回图书列表</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
