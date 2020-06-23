<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tushuweb.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 348px;
        }
        .auto-style2 {
            text-align: center;
            background-color: #FFCC99;
        }
        .auto-style3 {
            text-align: center;
            background-color: #CCFF99;
        }
        .auto-style4 {
            text-align: center;
            background-color: #FFFF00;
        }
        .auto-style5 {
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="auto-style5" OnClick="LinkButton1_Click">借阅图书</asp:LinkButton>
                </td>
                <td class="auto-style3">
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="auto-style5" OnClick="LinkButton2_Click">归还图书</asp:LinkButton>
                </td>
                <td class="auto-style4">
                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="auto-style5" OnClick="LinkButton3_Click">图书信息</asp:LinkButton>
                </td>
            </tr>
        </table>
    <div>
    
    </div>
    </form>
</body>
</html>
