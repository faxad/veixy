using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class disc_main : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() != "")
        {
            ImageButton3.Visible = false;
            ImageButton4.Visible = false;
            ImageButton1.Visible = false;
        }
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT thread_title FROM thread_table WHERE thread_id='" + Request.QueryString[0].ToString() + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            Label1.Text = dr[0].ToString();
            Label8.Text = dr[0].ToString();
        }
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label Label4 = (Label)e.Item.FindControl("Label4");
        Label Label2 = (Label)e.Item.FindControl("Label2");
        Label Label5 = (Label)e.Item.FindControl("Label5");
        Label Label6 = (Label)e.Item.FindControl("Label6");
        Label Label7 = (Label)e.Item.FindControl("Label7");
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT post_count FROM user_info WHERE user_id='" + Label2.Text + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            Label4.Text = dr[0].ToString();
        }
        Label5.Text = Request.QueryString["started_by"].ToString();
        Label6.Text = Request.QueryString["start_date"].ToString();
        Label7.Text = Label7.Text.Replace(Convert.ToString((char)13), "</br>");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
        SqlCommand my_insert = new SqlCommand("INSERT INTO post_table(thread_id,posted_by,post_date,post_msg) VALUES('" + Request.QueryString["thread_id"].ToString() + "','" + Session["user_session"].ToString() + "','" + System.DateTime.Now.ToString() + "',@post_msg);", conn);
        my_insert.Parameters.Add("@post_msg", 8000).Value = TextBox1.Text;
        conn.Open();
        my_insert.ExecuteNonQuery();
        conn.Close();
        TextBox1.Text = "";
        SqlCommand my_update = new SqlCommand("UPDATE user_info SET post_count=post_count+1 WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update.ExecuteNonQuery();
        conn.Close();
        DataList1.DataBind();
    }

    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
}