using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tushuweb
{
    public partial class huanshu_qr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                l_id.Text = Request.QueryString["id"];
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s_id = l_id.Text;

            SqlServerHelper Sql = new SqlServerHelper();
            var con = Sql.CreateCon();
            con.Open();
            var trans = con.BeginTransaction();
            string sql = string.Format("update tushu set zhuangtai=null where id={0}", s_id);
            con.ExecuteSql(sql, trans);
            sql = string.Format("update jieshu set hsrq=getdate() where tushu_id={0} and hsrq is null", s_id);
            con.ExecuteSql(sql, trans);
            trans.Commit();
            Response.Write("<script>alert('归还图书成功');window.location.href='huanshu.aspx';</script>");

        }
    }
}