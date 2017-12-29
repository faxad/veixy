using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class cust_chat : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
        TextBox1.Focus();
        if (Request.QueryString[0].ToString() == "0000000000")
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(chat_stat) FROM staff_info WHERE chat_stat='1';", conn);
            cmd.Connection.Open();
            string temp = "";
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (dr.Read())
            {
                temp = dr.GetValue(0).ToString();
            }
            dr.Close();
            conn.Close();
            if (temp == "0")
            {
                Label1.Text = "Support staff is busy. Please try back later.";
                Label1.Visible = true;
            }
        }
    }

    protected void Timer1_Tick1(object sender, EventArgs e)
    {
        TextBox1.Focus();
        GridView1.DataBind();
        TextBox1.Focus();
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        SqlCommand my_insert2 = new SqlCommand("INSERT INTO chat_msgs(chat_id,msg_from,msg_txt) VALUES('" + Request.QueryString["chat_id"].ToString() + "','" + Session["user_session"].ToString() + "',@msg_text);", conn);
        my_insert2.Parameters.Add("msg_text", 8000).Value = TextBox1.Text;
        conn.Open();
        my_insert2.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();
        TextBox1.Text = "";
        ScriptManager.GetCurrent(this.Page).SetFocus(TextBox1);
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string temp = "";
        string my_time = System.DateTime.Now.ToString();
        SqlCommand my_insert = new SqlCommand("INSERT INTO chat_wait_list(user_id,status,date_time) VALUES('" + Session["user_session"].ToString() + "','waiting','" + my_time + "');", conn);
        conn.Open();
        my_insert.ExecuteNonQuery();
        conn.Close();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT chat_id FROM chat_wait_list WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            temp = dr[0].ToString();
        }
        if (Request.QueryString[0].ToString() == "0000000000")
        {
            SqlCommand my_insert2 = new SqlCommand("INSERT INTO chat_msgs(chat_id,msg_from,msg_txt) VALUES('" + temp + "','Chat_System','Welcome to our support chat client. A customer representative will join you shortly.');", conn);
            conn.Open();
            my_insert2.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }
        Response.Redirect("cust_chat.aspx?chat_id=" + temp);
    }

    protected void Panel2_Load(object sender, EventArgs e)
    {
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        SqlCommand delete_chat = new SqlCommand("DELETE from chat_wait_list WHERE chat_id='" + Request.QueryString[0].ToString() + "';", conn);
        conn.Open();
        delete_chat.ExecuteNonQuery();
        conn.Close();
    }
}