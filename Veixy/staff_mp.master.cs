using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class staff_mp : System.Web.UI.MasterPage
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        Label12.Text = Session["user_session"].ToString();
        DataSet ds1 = new DataSet();
        DataSet ds2 = new DataSet();
        DataSet ds3 = new DataSet();
        DataSet ds4 = new DataSet();
        SqlDataAdapter da1 = new SqlDataAdapter("SELECT COUNT(msg_to) FROM msg_box WHERE msg_to='" + Session["user_session"].ToString() + "' AND to_type='staff' AND msg_img='Images/msg_unchecked.jpg' AND box_type='inbox'", conn);
        da1.Fill(ds1);
        foreach (DataRow dr1 in ds1.Tables[0].Rows)
        {
            Label3.Text = dr1[0].ToString();
        }
        SqlDataAdapter da2 = new SqlDataAdapter("SELECT COUNT(loc_by) FROM staff_loc WHERE loc_by='" + Session["user_session"].ToString() + "'", conn);
        da2.Fill(ds2);
        foreach (DataRow dr2 in ds2.Tables[0].Rows)
        {
            Label5.Text = dr2[0].ToString();
        }
        string my_time = "";
        string my_time2 = "";
        my_time = System.DateTime.Now.ToShortDateString();
        my_time2 = System.DateTime.Now.AddDays(1).ToShortDateString();
        SqlDataAdapter da3 = new SqlDataAdapter("SELECT COUNT(schedule_id) AS Expr1 FROM staff_schedule WHERE date >='" + my_time + "' AND date<'" + my_time2 + "' AND staff_id='" + Session["user_session"].ToString() + "';", conn);
        da3.Fill(ds3);
        foreach (DataRow dr3 in ds3.Tables[0].Rows)
        {
            Label6.Text = dr3[0].ToString();
        }
        SqlDataAdapter da4 = new SqlDataAdapter("SELECT COUNT(chat_id) FROM chat_wait_list WHERE status='waiting';", conn);
        da4.Fill(ds4);
        foreach (DataRow dr4 in ds4.Tables[0].Rows)
        {
            Label9.Text = dr4[0].ToString();
        }
        SqlCommand cmd = new SqlCommand("SELECT chat_stat FROM staff_info WHERE staff_id='" + Session["user_session"].ToString() + "';", conn);
        cmd.Connection.Open();
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        string temp = "";
        while (dr.Read())
        {
            temp = dr.GetValue(0).ToString();
        }
        dr.Close();
        conn.Close();
        if (temp == "0")
        {
            ImageButton3.ImageUrl = "~/Images/c_ao.jpg";
        }
        else if (temp == "1")
        {
            ImageButton3.ImageUrl = "~/Images/c_a.jpg";
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow row = ((ImageButton)sender).Parent.Parent as GridViewRow;
        string temp_id;
        string temp_type;
        temp_id = GridView1.Rows[row.RowIndex].Cells[0].Text;
        temp_type = GridView1.Rows[row.RowIndex].Cells[1].Text;
        if (temp_type == "Ticket")
        {
            SqlCommand my_update1 = new SqlCommand("UPDATE cust_inbox SET lock_by='none' WHERE token_no='" + temp_id + "';", conn);
            conn.Open();
            my_update1.ExecuteNonQuery();
            conn.Close();
        }
        else if (temp_type == "Call")
        {
            SqlCommand my_update2 = new SqlCommand("UPDATE my_calls SET lock_by='none' WHERE call_ref_no='" + temp_id + "';", conn);
            conn.Open();
            my_update2.ExecuteNonQuery();
            conn.Close();
        }
        else if (temp_type == "App")
        {
            SqlCommand my_update3 = new SqlCommand("UPDATE cust_appoint SET lock_by='none' WHERE app_no='" + temp_id + "';", conn);
            conn.Open();
            my_update3.ExecuteNonQuery();
            conn.Close();
        }
        SqlCommand my_delete = new SqlCommand("DELETE FROM staff_loc WHERE user_loc_id='" + temp_id + "' AND loc_type='" + temp_type + "';", conn);
        conn.Open();
        my_delete.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();

        SqlCommand inc_unlock = new SqlCommand("UPDATE eval_tab1 SET unlocks=unlocks+1 WHERE user_id='" + Session["user_session"].ToString() + "' AND user_login='" + Session["staff_time"].ToString() + "';", conn);
        conn.Open();
        inc_unlock.ExecuteNonQuery();
        conn.Close();
        DataSet ds2 = new DataSet();
        SqlDataAdapter da2 = new SqlDataAdapter("SELECT COUNT(loc_by) FROM staff_loc WHERE loc_by='" + Session["user_session"].ToString() + "'", conn);
        da2.Fill(ds2);
        foreach (DataRow dr2 in ds2.Tables[0].Rows)
        {
            Label5.Text = dr2[0].ToString();
        }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        if (DataList1.Visible == false)
        {
            DataList1.Visible = true;
            ImageButton2.ImageUrl = "~/Images/notes_img2.jpg";
        }
        else
        {
            DataList1.Visible = false;
            ImageButton2.ImageUrl = "~/Images/notes_img.jpg";
        }
    }

    protected void sav_but_Click(object sender, EventArgs e)
    {
        string my_time = System.DateTime.Now.ToString();
        SqlCommand my_insert = new SqlCommand("INSERT INTO my_notes(user_name,date_time,note_txt) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@msg);", conn);
        my_insert.Parameters.Add("@msg", 5000).Value = TextBox1.Text;
        conn.Open();
        my_insert.ExecuteNonQuery();
        conn.Close();
        TextBox1.Text = "";
        DataList1.DataBind();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        DataSet ds0 = new DataSet();
        int x = 0;
        SqlDataAdapter da0 = new SqlDataAdapter("SELECT COUNT(loc_by) FROM staff_loc WHERE loc_by='" + Session["user_session"].ToString() + "'", conn);
        da0.Fill(ds0);
        foreach (DataRow dr0 in ds0.Tables[0].Rows)
        {
            string temp = dr0[0].ToString();
            x = Convert.ToInt32(temp);
        }

        SqlCommand my_delete2 = new SqlCommand("DELETE FROM staff_loc WHERE loc_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_delete2.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();

        SqlCommand my_update1 = new SqlCommand("UPDATE cust_inbox SET lock_by='none' WHERE lock_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update1.ExecuteNonQuery();
        conn.Close();

        SqlCommand my_update2 = new SqlCommand("UPDATE my_calls SET lock_by='none' WHERE lock_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update2.ExecuteNonQuery();
        conn.Close();

        SqlCommand my_update3 = new SqlCommand("UPDATE cust_appoint SET lock_by='none' WHERE lock_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update3.ExecuteNonQuery();
        conn.Close();

        SqlCommand inc_unlock = new SqlCommand("UPDATE eval_tab1 SET unlocks=unlocks+" + x + " WHERE user_id='" + Session["user_session"].ToString() + "' AND user_login='" + Session["staff_time"].ToString() + "';", conn);
        conn.Open();
        inc_unlock.ExecuteNonQuery();
        conn.Close();
        System.Data.SqlClient.SqlCommand my_insert = new System.Data.SqlClient.SqlCommand("UPDATE system_log SET logout_at='" + System.DateTime.Now.ToString() + "' WHERE user_id='" + Session["user_session"].ToString() + "' AND login_at='" + Session["staff_time"].ToString() + "';", conn);
        System.Data.SqlClient.SqlCommand my_insert9 = new System.Data.SqlClient.SqlCommand("UPDATE eval_tab1 SET user_logout='" + System.DateTime.Now.ToString() + "' WHERE user_id='" + Session["user_session"].ToString() + "' AND user_login='" + Session["staff_time"].ToString() + "';", conn);
        System.Data.SqlClient.SqlCommand my_delete = new System.Data.SqlClient.SqlCommand("DELETE FROM activ_users WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_insert.ExecuteNonQuery();
        my_insert9.ExecuteNonQuery();
        my_delete.ExecuteNonQuery();
        conn.Close();
        Session.Abandon();
        Session["user_session"] = "";
        Session["staff_time"] = "";
        Session["txt_session"] = "";
        Session["type_session"] = "";
        Session["mail_session"] = "";
        Session["temp"] = "";
        Session.Abandon();
        Response.Redirect("user_login.aspx");
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        DataSet ds0 = new DataSet();
        int x = 0;
        SqlDataAdapter da0 = new SqlDataAdapter("SELECT COUNT(loc_by) FROM staff_loc WHERE loc_by='" + Session["user_session"].ToString() + "'", conn);
        da0.Fill(ds0);
        foreach (DataRow dr0 in ds0.Tables[0].Rows)
        {
            string temp = dr0[0].ToString();
            x = Convert.ToInt32(temp);
        }

        SqlCommand my_delete2 = new SqlCommand("DELETE FROM staff_loc WHERE loc_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_delete2.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();

        SqlCommand my_update1 = new SqlCommand("UPDATE cust_inbox SET lock_by='none' WHERE lock_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update1.ExecuteNonQuery();
        conn.Close();

        SqlCommand my_update2 = new SqlCommand("UPDATE my_calls SET lock_by='none' WHERE lock_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update2.ExecuteNonQuery();
        conn.Close();

        SqlCommand my_update3 = new SqlCommand("UPDATE cust_appoint SET lock_by='none' WHERE lock_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update3.ExecuteNonQuery();
        conn.Close();

        SqlCommand inc_unlock = new SqlCommand("UPDATE eval_tab1 SET unlocks=unlocks+" + x + " WHERE user_id='" + Session["user_session"].ToString() + "' AND user_login='" + Session["staff_time"].ToString() + "';", conn);
        conn.Open();
        inc_unlock.ExecuteNonQuery();
        conn.Close();
    }

    protected void LinkButton_cus_Click(object sender, EventArgs e)
    {
        Response.Redirect("user_inbox.aspx?user_query=" + TextBox2.Text, false);
    }

    protected void LinkButton_tkt_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("staff_track.aspx?ticket_query=" + TextBox2.Text);
        }
        catch (FormatException ex)
        {
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("SELECT MIN(chat_id) FROM chat_wait_list WHERE status='waiting';", conn);
        cmd.Connection.Open();
        string temp = "";
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        while (dr.Read())
        {
            temp = dr.GetValue(0).ToString();
        }
        dr.Close();
        conn.Close();
        SqlCommand my_update = new SqlCommand("UPDATE chat_wait_list SET staff_id='" + Session["user_session"].ToString() + "',status='busy' WHERE chat_id='" + temp + "';", conn);
        SqlCommand my_update2 = new SqlCommand("UPDATE staff_info SET chat_stat='0' WHERE staff_id='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        try
        {
            my_update.ExecuteNonQuery();
            my_update2.ExecuteNonQuery();
            conn.Close();
        }
        catch
        {
        }
        Response.Redirect("cust_chat.aspx?chat_id=" + temp);
    }

    protected void LinkButton44_Click(object sender, EventArgs e)
    {
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        if (ImageButton3.ImageUrl == "~/Images/c_a.jpg")
        {
            SqlCommand my_update = new SqlCommand("UPDATE staff_info SET chat_stat='0' WHERE staff_id='" + Session["user_session"].ToString() + "';", conn);
            conn.Open();
            my_update.ExecuteNonQuery();
            conn.Close();
            ImageButton3.ImageUrl = "~/Images/c_ao.jpg";
        }
        else if (ImageButton3.ImageUrl == "~/Images/c_ao.jpg")
        {
            SqlCommand my_update = new SqlCommand("UPDATE staff_info SET chat_stat='1' WHERE staff_id='" + Session["user_session"].ToString() + "';", conn);
            conn.Open();
            my_update.ExecuteNonQuery();
            conn.Close();
            ImageButton3.ImageUrl = "~/Images/c_a.jpg";
        }
    }
}