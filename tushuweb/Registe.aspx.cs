using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tushuweb
{
    public partial class Registe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string s_zhanghao = zhanghao.Text;
                string s_xingming = xingming.Text;
                string mima = pwd.Text;

                string sql = "insert into denglu(zhanghao,mima,xingming,leibie) " +
                    "values(N'"+s_zhanghao+"',N'"+mima+"',N'"+s_xingming+"',N'普通用户')";
                new SqlServerHelper().ExecuteSql(sql);
                Response.Write("<script>alert('用户注册成功');window.location.href='Login.aspx';</script>");

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}