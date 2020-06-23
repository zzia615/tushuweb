using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;

public class SqlServerHelper
{
    /// <summary>
    /// 数据库链接字符串
    /// </summary>
    private readonly string conStr;
    /// <summary>
    /// 无参构造函数
    /// </summary>
    public SqlServerHelper()
    {
        //初始化数据库链接字符串，从web.config里面获取节点【tushuConnectionString】的链接字符串
        conStr = ConfigurationManager.ConnectionStrings["tushuConnectionString"].ConnectionString;
    }
    /// <summary>
    /// 有参的构造函数
    /// </summary>
    /// <param name="conStr"></param>
    public SqlServerHelper(string conStr)
    {
        //初始化链接字符串，从外部实例化时传入
        this.conStr = conStr;
    }
    /// <summary>
    /// 创建SqlConnection对象并实例化
    /// </summary>
    /// <returns></returns>
    public System.Data.SqlClient.SqlConnection CreateCon()
    {
        return new System.Data.SqlClient.SqlConnection(conStr);
    }
    /// <summary>
    /// 校验表是否存在
    /// </summary>
    /// <param name="tbl"></param>
    /// <returns></returns>
    public bool CheckTableExists(string tbl)
    {
        //查询Sql Server数据库中的系统表
        DataTable table = QuerySqlDataTable("select * from sys.objects where type='U' and name='" + tbl + "'");
        //如果查询到表，则表示存在，返回true
        if (table != null && table.Rows.Count > 0) return true;
        //反之则不存在返回false
        return false;
    }
    /// <summary>
    /// 初始化表
    /// </summary>
    public void CreateTable()
    {
        string sql = "";
        //初始化用户表
        if (!CheckTableExists("yhxx"))
        {
            sql = "create table yhxx(yhzh nvarchar(20) not null primary key," +
                "yhxm nvarchar(20) not null," +
                "yhmm nvarchar(50) not null," +
                "yhlb nvarchar(10) default N'学生' not null)";
            ExecuteSql(sql);

            sql = "insert into yhxx(yhzh,yhxm,yhmm,yhlb) values(N'admin',N'admin',N'admin',N'管理员')";
            ExecuteSql(sql);
        }
        //初始化学生表
        if (!CheckTableExists("xsxx"))
        {
            sql = "create table xsxx(xsxh nvarchar(20) not null primary key," +
                "xsxm nvarchar(20) not null," +
                "xsxb nvarchar(10) not null," +
                "xszy nvarchar(100) not null," +
                "xsbj nvarchar(50) not null" +
                ")";
            ExecuteSql(sql);
        }
        //初始化课程表
        if (!CheckTableExists("kcxx"))
        {
            sql = "create table kcxx(kcbm nvarchar(20) not null primary key," +
                "kcmc nvarchar(50) not null" +
                ")";
            ExecuteSql(sql);
        }
        //初始化学生课程表
        if (!CheckTableExists("xskc"))
        {
            sql = "create table xskc(xsxx_xh nvarchar(20) not null primary key," +
                "kcxx_bm nvarchar(20) not null," +
                "xscj int null," +
                "cjrq datetime null" +
                ")";
            ExecuteSql(sql);
            sql = "alter table xskc add constraint fk_xskc_xsxx foreign key(xsxx_xh) references xsxx(xsxh)";
            ExecuteSql(sql);
            sql = "alter table xskc add constraint fk_xskc_kcxx foreign key(kcxx_bm) references kcxx(kcbm)";
            ExecuteSql(sql);
        }
    }
    /// <summary>
    /// 执行Sql语句
    /// </summary>
    /// <param name="sql"></param>
    /// <returns></returns>
    public int ExecuteSql(string sql)
    {
        //实例化SqlConnection对象
        using (var con = CreateCon())
        {
            //打开数据库
            con.Open();
            try
            {
                //创建SqlCommand对象
                var cmd = con.CreateCommand();
                //设置执行的Sql语句（语句限定insert update delete）
                cmd.CommandText = sql;
                cmd.CommandType = System.Data.CommandType.Text;
                //执行Sql语句
                return cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
    /// <summary>
    /// 返回数据表
    /// </summary>
    /// <param name="sql"></param>
    /// <returns></returns>
    public DataTable QuerySqlDataTable(string sql)
    {

        //实例化SqlConnection对象
        using (var con = CreateCon())
        {
            //创建数据集
            DataTable table = new DataTable();
            //创建数据库适配器对象，并设置查询语句的Sql
            System.Data.SqlClient.SqlDataAdapter dapt = new System.Data.SqlClient.SqlDataAdapter(sql, con);
            //填充表
            dapt.Fill(table);
            //返回表
            return table;
        }
    }
}
/// <summary>
/// SqlServerHelper扩展对象
/// </summary>
public static class SqlServerHelperExt
{
    /// <summary>
    /// 包含事务对象执行Sql语句
    /// </summary>
    /// <param name="con"></param>
    /// <param name="sql"></param>
    /// <param name="trans"></param>
    /// <returns></returns>
    public static int ExecuteSql(this System.Data.SqlClient.SqlConnection con, string sql, System.Data.SqlClient.SqlTransaction trans)
    {

        //创建SqlCommand对象
        var cmd = con.CreateCommand();
        //设置执行的Sql语句（语句限定insert update delete）
        cmd.CommandText = sql;
        cmd.CommandType = System.Data.CommandType.Text;
        //设置事务
        cmd.Transaction = trans;
        //执行Sql语句
        return cmd.ExecuteNonQuery();
    }
}