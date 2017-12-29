using System;
using System.Data;
using System.Data.SqlClient;

public partial class admin_rep2 : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        string my_time = "";
        string my_time2 = "";
        my_time = System.DateTime.Now.ToShortDateString();
        my_time2 = System.DateTime.Now.AddDays(1).ToShortDateString();
        string my_time3 = System.DateTime.Now.ToString();

        string c1 = "";
        string c2 = "";
        string c3 = "";
        string c4 = "";
        string c5 = "";
        string c6 = "";
        DataSet ds1 = new DataSet();
        DataSet ds2 = new DataSet();
        DataSet ds3 = new DataSet();
        DataSet ds4 = new DataSet();
        DataSet ds5 = new DataSet();
        DataSet ds6 = new DataSet();
        SqlDataAdapter da1 = new SqlDataAdapter("SELECT COUNT(start_date) AS Expr1 FROM cust_inbox WHERE start_date >='" + my_time + "' AND start_date<'" + my_time2 + "';", conn);
        da1.Fill(ds1);
        foreach (DataRow dr1 in ds1.Tables[0].Rows)
        {
            c1 = dr1[0].ToString();
        }
        SqlDataAdapter da2 = new SqlDataAdapter("SELECT COUNT(close_date) AS Expr1 FROM cust_inbox WHERE close_date >='" + my_time + "' AND close_date<'" + my_time2 + "';", conn);
        da2.Fill(ds2);
        foreach (DataRow dr2 in ds2.Tables[0].Rows)
        {
            c2 = dr2[0].ToString();
        }
        SqlDataAdapter da3 = new SqlDataAdapter("SELECT COUNT(call_date) from my_calls WHERE call_date >='" + my_time + "' AND call_date<'" + my_time2 + "';", conn);
        da3.Fill(ds3);
        foreach (DataRow dr3 in ds3.Tables[0].Rows)
        {
            c3 = dr3[0].ToString();
        }
        SqlDataAdapter da4 = new SqlDataAdapter("SELECT COUNT(app_date) AS Expr1 FROM cust_appoint WHERE app_date >='" + my_time + "' AND app_date<'" + my_time2 + "';", conn);
        da4.Fill(ds4);
        foreach (DataRow dr4 in ds4.Tables[0].Rows)
        {
            c4 = dr4[0].ToString();
        }

        SqlCommand my_insert = new SqlCommand("INSERT INTO admin_rep1(date,tickets_open,tickets_close,calls,appointments) VALUES('" + my_time3 + "','" + c1 + "','" + c2 + "','" + c3 + "','" + c4 + "');", conn);
        conn.Open();
        my_insert.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();
    }
}