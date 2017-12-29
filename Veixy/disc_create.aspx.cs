using System;
using System.Data;
using System.Data.SqlClient;

public partial class disc_create : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT prod_name FROM prod_info WHERE prod_id='" + Request.QueryString["prod_id"].ToString() + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            Label1.Text = dr[0].ToString();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string my_time = System.DateTime.Now.ToString();
        string temp = "";
        SqlCommand my_insert = new SqlCommand("INSERT INTO thread_table(prod_id,thread_title,start_date,started_by,latest_post) VALUES('" + Request.QueryString["prod_id"].ToString() + "',@thread_title,'" + my_time + "','" + Session["user_session"].ToString() + "','" + Session["user_session"].ToString() + "," + my_time + "');", conn);
        my_insert.Parameters.Add("@thread_title", 100).Value = TextBox2.Text;
        conn.Open();
        my_insert.ExecuteNonQuery();
        conn.Close();
        DataSet ds2 = new DataSet();
        SqlDataAdapter da2 = new SqlDataAdapter("SELECT thread_id FROM thread_table WHERE started_by='" + Session["user_session"].ToString() + "' AND start_date='" + my_time + "';", conn);
        da2.Fill(ds2);
        foreach (DataRow dr2 in ds2.Tables[0].Rows)
        {
            temp = dr2[0].ToString();
        }
        SqlCommand my_insert2 = new SqlCommand("INSERT INTO post_table(thread_id,posted_by,post_date,post_msg) VALUES('" + temp + "','" + Session["user_session"].ToString() + "','" + my_time + "',@post_msg);", conn);
        my_insert2.Parameters.Add("@post_msg", 8000).Value = TextBox1.Text;
        conn.Open();
        my_insert2.ExecuteNonQuery();
        conn.Close();
        TextBox1.Text = "";
        SqlCommand my_update = new SqlCommand("UPDATE user_info SET post_count=post_count+1 WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
        SqlCommand my_update2 = new SqlCommand("UPDATE prod_info SET latest_thread=@post_msg WHERE prod_id='" + Request.QueryString["prod_id"].ToString() + "';", conn);
        my_update2.Parameters.Add("@post_msg", 100).Value = TextBox2.Text;
        conn.Open();
        my_update.ExecuteNonQuery();
        my_update2.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("disc_post.aspx?thread_id=" + temp + "&started_by=" + Session["user_session"].ToString() + "&start_date=" + my_time);
    }
}