using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tushuweb
{
    public partial class tushu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = string.Format("select * from tushu where isnull(zhuangtai,'')='' ");
            string s_tjlb = tjlb.Value;
            string s_tjnr = tjnr.Text;
            if(!string.IsNullOrEmpty(s_tjlb)&& !string.IsNullOrEmpty(s_tjnr))
            {
                sql += " and " + s_tjlb + " like N'%" + s_tjnr + "%'";
            }
            SqlDataSource1.SelectCommand = sql;
            GridView1.DataBind();
        }
    }
}