using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tushuweb
{
    public partial class tushuadd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["账号"].AsString() == "")
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string s_mingcheng = mingcheng.Text;
                string s_zuozhe = zuozhe.Text;
                string s_chubanshe = chubanshe.Text;

                string sql = string.Format("insert into tushu(mingcheng,zuozhe,chubanshe) " +
                    "values('{0}','{1}','{2}')", s_mingcheng, s_zuozhe, s_chubanshe);
                new SqlServerHelper().ExecuteSql(sql);
                Response.Write("<script>alert('新增图书成功');window.location.href='tushu.aspx';</script>");

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}