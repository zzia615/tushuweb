using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tushuweb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string zhanghao = name.Text;
                string mima = pwd.Text;

                string sql = "select * from denglu where zhanghao=N'" + zhanghao + "' and mima=N'" + mima + "'";
                DataTable table = new SqlServerHelper().QuerySqlDataTable(sql);
                if (table != null && table.Rows.Count >= 0)
                {
                    Session["账号"] = zhanghao;
                    Session["类别"] = table.Rows[0]["leibie"].AsString();
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Write("<script>alert('用户名密码输入有误');</script>");
                }

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}