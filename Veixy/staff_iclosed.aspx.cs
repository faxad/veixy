using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class staff_inbox : System.Web.UI.Page
{
    private string contact_no = "aaa";
    private string email_add = "bbb";
    private string cust_profile = "00000000";
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    public void fetch_user_info()
    {
        try
        {
            SqlDataAdapter my_select = new SqlDataAdapter("SELECT email_add,user_contact_no,cust_profile FROM user_info WHERE user_id='" + GridView1.SelectedRow.Cells[2].Text + "';", conn);
            DataSet dss = new DataSet();
            my_select.Fill(dss);
            foreach (DataRow dr in dss.Tables[0].Rows)
            {
                email_add = dr[0].ToString();
                contact_no = dr[1].ToString();
                cust_profile = dr[2].ToString();
            }
        }
        catch
        {
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
        Label2.Visible = true;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Attributes["onmouseover"] =
                 "javascript:setMouseOverColor(this);";
        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackEventReference(this.GridView1, "Select$" + e.Row.RowIndex.ToString());
        Panel2.ScrollBars = ScrollBars.None;
        Panel2.ScrollBars = ScrollBars.Vertical;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (GridView1.SelectedIndex == -1)
        {
        }
        else
        {
            string temp_id;
            temp_id = GridView1.SelectedValue.ToString();
            int x = GridView1.SelectedIndex;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT lock_by FROM cust_inbox WHERE token_no='" + temp_id + "';", conn);
            da.Fill(ds);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                if (dr[0].ToString() == "none")
                {
                    SqlCommand my_update = new SqlCommand("UPDATE cust_inbox SET lock_by='" + Session["user_session"].ToString() + "',open_close='O' WHERE token_no='" + temp_id + "';", conn);
                    SqlCommand my_insert2 = new SqlCommand("INSERT INTO staff_loc(user_loc_id,loc_by,loc_topic,loc_type) VALUES('" + GridView1.SelectedValue.ToString() + "','" + Session["user_session"].ToString() + "','" + GridView1.Rows[x].Cells[3].Text + "','Ticket');", conn);
                    conn.Open();
                    my_update.ExecuteNonQuery();
                    my_insert2.ExecuteNonQuery();
                    SqlCommand inc_lock = new SqlCommand("UPDATE eval_tab1 SET lock=lock+1 WHERE user_id='" + Session["user_session"].ToString() + "' AND user_login='" + Session["staff_time"].ToString() + "';", conn);
                    inc_lock.ExecuteNonQuery();
                }
            }
            conn.Close();
            GridView1.DataBind();
            Label Labell = (Label)this.Master.FindControl("Label5");
            DataSet ds2 = new DataSet();
            SqlDataAdapter da2 = new SqlDataAdapter("SELECT COUNT(loc_by) FROM staff_loc WHERE loc_by='" + Session["user_session"].ToString() + "'", conn);
            da2.Fill(ds2);
            foreach (DataRow dr2 in ds2.Tables[0].Rows)
            {
                Labell.Text = dr2[0].ToString();
            }
            GridView GridVieww = (GridView)this.Master.FindControl("GridView1");
            GridVieww.DataBind();
            GridView1.SelectedIndex = -1;
            Label2.Visible = true;
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        try
        {
            string temp_id;
            temp_id = GridView1.SelectedValue.ToString();
            SqlCommand my_update2 = new SqlCommand("UPDATE cust_inbox SET img_url2='Images/hot_topic.jpg' WHERE token_no='" + temp_id + "';", conn);
            conn.Open();
            my_update2.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }
        catch
        {
        }
        Label2.Visible = false;
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        try
        {
            string temp_id;
            temp_id = GridView1.SelectedValue.ToString();
            SqlCommand my_update3 = new SqlCommand("UPDATE cust_inbox SET img_url2='Images/msg_checked.jpg' WHERE token_no='" + temp_id + "';", conn);
            conn.Open();
            my_update3.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }
        catch
        {
        }
        Label2.Visible = false;
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        fetch_user_info();
        try
        {
            string temp_id;
            temp_id = GridView1.SelectedValue.ToString();
            SqlCommand my_update4 = new SqlCommand("UPDATE cust_inbox SET open_close='O' WHERE token_no='" + temp_id + "';", conn);
            conn.Open();
            my_update4.ExecuteNonQuery();
            conn.Close();
            if (cust_profile[0] == '1')
            {
                sms_class objj = new sms_class();
                string close_msg = "Your service ticket " + temp_id + " has been re-opened.  Thank Your for using our Customer Support";
                int status = objj.send_sms(contact_no, close_msg);
                if (status == 1)
                {
                }
                else if (status == 0)
                {
                }
            }
            if (cust_profile[1] == '1')
            {
                email_class obje = new email_class();
                string email_msg = "Your service ticket " + temp_id + " has been re-opened.  Thank Your for using our Customer Support";
                int estatus = obje.send_email(email_add, "Service Token Re-opened", email_msg);
                if (estatus == 1)
                {
                }
                else if (estatus == 0)
                {
                }
            }
            GridView1.DataBind();
            GridView1.SelectedIndex = -1;
            Label2.Visible = true;
        }
        catch
        {
        }
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        DataSet ds0 = new DataSet();
        SqlDataAdapter da0 = new SqlDataAdapter("SELECT user_id,user_type FROM activ_users WHERE user_id='" + DropDownList2.SelectedItem.Text + "' AND user_type='staff';", conn);
        da0.Fill(ds0);
        if (ds0.Tables[0].Rows.Count != 0)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT lock_by FROM cust_inbox WHERE token_no='" + GridView1.SelectedValue.ToString() + "';", conn);
            da.Fill(ds);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                if (dr[0].ToString() == "none")
                {
                    fetch_user_info();
                    int x = GridView1.SelectedIndex;
                    try
                    {
                        string temp_id;
                        temp_id = GridView1.SelectedValue.ToString();
                        string temp_lok;
                        if (DropDownList2.SelectedItem.Text == "")
                        {
                            temp_lok = "none";
                        }
                        else
                        {
                            temp_lok = DropDownList2.SelectedItem.Text;
                        }
                        SqlCommand my_update5 = new SqlCommand("UPDATE cust_inbox SET lock_by='" + temp_lok + "',open_close='O' WHERE token_no='" + temp_id + "';", conn);
                        SqlCommand my_insert2 = new SqlCommand("INSERT INTO staff_loc(user_loc_id,loc_by,loc_topic,loc_type) VALUES('" + GridView1.SelectedValue.ToString() + "','" + temp_lok + "',@topic,'Ticket');", conn);
                        my_insert2.Parameters.Add("@topic", 100).Value = GridView1.Rows[x].Cells[3].Text;
                        conn.Open();
                        my_update5.ExecuteNonQuery();
                        my_insert2.ExecuteNonQuery();
                        if (DropDownList2.SelectedItem.Text != "")
                        {
                            SqlCommand inc_rec_m = new SqlCommand("UPDATE eval_tab2 SET rec_made=rec_made+1 WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
                            inc_rec_m.ExecuteNonQuery();
                            SqlCommand inc_rec_a = new SqlCommand("UPDATE eval_tab2 SET rec_accept=rec_accept+1 WHERE user_id='" + temp_lok + "';", conn);
                            inc_rec_a.ExecuteNonQuery();
                        }
                        conn.Close();
                        GridView1.DataBind();
                        if (cust_profile[0] == '1' && temp_lok != "none")
                        {
                            sms_class objj = new sms_class();
                            string close_msg = "Your service ticket " + temp_id + " is now open & is forwarded to the relevant department.";
                            int status = objj.send_sms(contact_no, close_msg);
                            if (status == 1)
                            {
                            }
                            else if (status == 0)
                            {
                            }
                        }
                        Label Labell = (Label)this.Master.FindControl("Label5");
                        DataSet ds2 = new DataSet();
                        SqlDataAdapter da2 = new SqlDataAdapter("SELECT COUNT(loc_by) FROM staff_loc WHERE loc_by='" + Session["user_session"].ToString() + "'", conn);
                        da2.Fill(ds2);
                        foreach (DataRow dr2 in ds2.Tables[0].Rows)
                        {
                            Labell.Text = dr2[0].ToString();
                        }
                        GridView GridVieww = (GridView)this.Master.FindControl("GridView1");
                        GridVieww.DataBind();
                        GridView1.SelectedIndex = -1;
                        Label2.Visible = true;
                    }
                    catch
                    {
                    }
                    Label2.Visible = false;
                }
                else
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(LinkButton4, this.GetType(), "pop up", "alert('Lock has been applied to the ticket you are trying to process.');", true);
                }
                GridView1.DataBind();
                GridView1.SelectedIndex = -1;
                Label2.Visible = true;
            }
        }
        else
        {
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(LinkButton4, this.GetType(), "pop up", "alert('Invalid ID or staff is currently offline.');", true);
            Label2.Visible = false;
        }
    }

    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        string temp_id;
        temp_id = GridView1.SelectedValue.ToString();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT held_by FROM cust_inbox WHERE token_no='" + temp_id + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            if (dr[0].ToString() == "none")
            {
                SqlCommand my_update6 = new SqlCommand("UPDATE cust_inbox SET held_by='" + Session["user_session"].ToString() + "' WHERE token_no='" + temp_id + "';", conn);
                conn.Open();
                my_update6.ExecuteNonQuery();
                SqlCommand inc_held = new SqlCommand("UPDATE eval_tab2 SET held=held+1 WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
                inc_held.ExecuteNonQuery();
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(LinkButton4, this.GetType(), "pop up", "alert('Hold has been applied to the ticket you are trying to process.');", true);
            }
        }
        conn.Close();
        GridView1.DataBind();
        GridView1.SelectedIndex = -1;
        Label2.Visible = true;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label2.Visible = false;
    }

    protected void LinkButton8_Click(object sender, EventArgs e)
    {
    }

    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
    }

    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
        if (DropDownList2.Items.Count.ToString() == "1")
        {
            DropDownList2.Enabled = false;
        }
    }
}