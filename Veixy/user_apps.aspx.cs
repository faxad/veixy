using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_apps : System.Web.UI.Page
{
    private string contact_no = "aaa";
    private string email_add = "bbb";
    private string cust_profile = "00000000";
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    public void fetch_user_info()
    {
        try
        {
            SqlDataAdapter my_select = new SqlDataAdapter("SELECT email_add,user_contact_no,cust_profile FROM user_info WHERE user_id='" + GridView1.SelectedRow.Cells[1].Text + "';", conn);
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
        Panel3.Visible = false;
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
        LinkButton btn = (LinkButton)sender;
        DataListItem dli = (DataListItem)btn.NamingContainer;
        LinkButton LinkButton1 = (LinkButton)dli.FindControl("LinkButton1");
        {
            string temp_id;
            temp_id = GridView1.SelectedValue.ToString();
            int x = GridView1.SelectedIndex;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT lock_by FROM cust_appoint WHERE app_no='" + temp_id + "';", conn);
            da.Fill(ds);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                if (dr[0].ToString() == "none")
                {
                    SqlCommand my_update = new SqlCommand("UPDATE cust_appoint SET lock_by='" + Session["user_session"].ToString() + "' WHERE app_no='" + temp_id + "';", conn);
                    SqlCommand my_insert2 = new SqlCommand("INSERT INTO staff_loc(user_loc_id,loc_by,loc_topic,loc_type) VALUES('" + GridView1.SelectedValue.ToString() + "','" + Session["user_session"].ToString() + "',@topic,'App');", conn);
                    my_insert2.Parameters.Add("@topic", 100).Value = GridView1.Rows[x].Cells[2].Text;
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
        }
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        DataListItem dli = (DataListItem)btn.NamingContainer;
        TextBox TextBox2 = (TextBox)dli.FindControl("TextBox2");
        LinkButton LinkButton5 = (LinkButton)dli.FindControl("LinkButton5");
        DataSet ds0 = new DataSet();
        SqlDataAdapter da0 = new SqlDataAdapter("SELECT user_id,user_type FROM activ_users WHERE user_id='" + TextBox2.Text + "' AND user_type='staff';", conn);
        da0.Fill(ds0);
        if (ds0.Tables[0].Rows.Count != 0)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT lock_by FROM cust_appoint WHERE app_no='" + GridView1.SelectedDataKey.Value.ToString() + "';", conn);
            da.Fill(ds);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                if (dr[0].ToString() == "none")
                {
                    int x = GridView1.SelectedIndex;
                    try
                    {
                        string temp_id;
                        temp_id = GridView1.SelectedValue.ToString();
                        string temp_lok;
                        if (TextBox2.Text == "")
                        {
                            temp_lok = "none";
                        }
                        else
                        {
                            temp_lok = TextBox2.Text;
                        }
                        SqlCommand my_update5 = new SqlCommand("UPDATE cust_appoint SET lock_by='" + temp_lok + "' WHERE app_no='" + temp_id + "';", conn);
                        SqlCommand my_insert2 = new SqlCommand("INSERT INTO staff_loc(user_loc_id,loc_by,loc_topic,loc_type) VALUES('" + GridView1.SelectedValue.ToString() + "','" + temp_lok + "',@topic,'App');", conn);
                        my_insert2.Parameters.Add("@topic", 100).Value = GridView1.Rows[x].Cells[2].Text;
                        conn.Open();
                        my_update5.ExecuteNonQuery();
                        my_insert2.ExecuteNonQuery();
                        if (TextBox2.Text != "")
                        {
                            SqlCommand inc_rec_m = new SqlCommand("UPDATE eval_tab2 SET rec_made=rec_made+1 WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
                            inc_rec_m.ExecuteNonQuery();
                            SqlCommand inc_rec_a = new SqlCommand("UPDATE eval_tab2 SET rec_accept=rec_accept+1 WHERE user_id='" + temp_lok + "';", conn);
                            inc_rec_a.ExecuteNonQuery();
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
                        TextBox2.Text = "";
                        GridView1.SelectedIndex = -1;
                    }
                    catch
                    {
                    }
                }
                else
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(GridView1, this.GetType(), "pop up", "alert('Lock has been applied to the ticket you are trying to process.');", true);
                    Label7.Visible = true;
                    GridView1.DataBind();
                    GridView1.SelectedIndex = -1;
                }
            }
        }
        else
        {
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(GridView1, this.GetType(), "pop up", "alert('Invalid ID or staff is currently offline.');", true);
            Label7.Visible = false;
        }
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        fetch_user_info();
        LinkButton btn = (LinkButton)sender;
        DataListItem dli = (DataListItem)btn.NamingContainer;
        TextBox TextBox3 = (TextBox)dli.FindControl("TextBox3");
        TextBox TextBox5 = (TextBox)dli.FindControl("TextBox5");
        if (TextBox3.ReadOnly == true)
        {
            TextBox3.Text = "";
        }
        Telerik.WebControls.RadDateTimePicker RadDateTimePicker1 = (Telerik.WebControls.RadDateTimePicker)dli.FindControl("RadDateTimePicker1");
        DropDownList DropDownList1 = (DropDownList)dli.FindControl("DropDownList1");
        string temp_id;
        temp_id = GridView1.SelectedValue.ToString();
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();
        SqlCommand my_update = new SqlCommand("UPDATE cust_appoint SET app_status='" + DropDownList1.SelectedItem.Text + "' WHERE app_no='" + temp_id + "';", conn);
        conn.Open();
        my_update.ExecuteNonQuery();
        if (RadDateTimePicker1.SelectedDate.ToString() == "")
        {
            SqlCommand my_update2 = new SqlCommand("UPDATE cust_appoint SET app_reply=app_reply+char(13)+'" + my_time + "\n" + "'+@msg_text,contact_no='" + TextBox5.Text + "' WHERE app_no='" + temp_id + "';", conn);
            my_update2.Parameters.Add("@msg_text", 8000).Value = TextBox3.Text + "\n";
            my_update2.ExecuteNonQuery();
        }
        else
        {
            SqlCommand my_update2 = new SqlCommand("UPDATE cust_appoint SET app_reply=app_reply+char(13)+'" + my_time + "\n" + "'+@msg_text,app_date='" + RadDateTimePicker1.SelectedDate.ToString() + "',contact_no='" + TextBox5.Text + "' WHERE app_no='" + temp_id + "';", conn);
            my_update2.Parameters.Add("@msg_text", 8000).Value = TextBox3.Text + "\n";
            my_update2.ExecuteNonQuery();
        }
        conn.Close();
        if (cust_profile[5] == '1' && DropDownList1.SelectedItem.Text == "Approved")
        {
            sms_class objj = new sms_class();
            string close_msg = "Your appointment " + temp_id + " is approved. For detailes log on to our online Custimer Support Service";
            int status = objj.send_sms(contact_no, close_msg);
            if (status == 1)
            {
            }
            else if (status == 0)
            {
            }
        }
        if (cust_profile[5] == '1' && DropDownList1.SelectedItem.Text == "Approved")
        {
            email_class obje = new email_class();
            string email_msg = "Your appointment " + temp_id + " is approved. For detailes log on to our online Custimer Support Service";
            int estatus = obje.send_email(email_add, "Customer Support Service: Appointment Update", email_msg);
            if (estatus == 1)
            {
            }
            else if (estatus == 0)
            {
            }
        }
        SqlCommand my_update1 = new SqlCommand("UPDATE cust_appoint SET lock_by='none' WHERE app_no='" + temp_id + "' AND lock_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update1.ExecuteNonQuery();
        conn.Close();
        GridView GridVieww = (GridView)this.Master.FindControl("GridView1");
        SqlCommand my_delete = new SqlCommand("DELETE FROM staff_loc WHERE user_loc_id='" + temp_id + "' AND loc_type='App' AND loc_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_delete.ExecuteNonQuery();
        conn.Close();
        GridView GridViewww = (GridView)this.Master.FindControl("GridView1");
        GridViewww.DataBind();
        TextBox3.Text = "";
        DataList1.DataBind();
        GridView1.DataBind();
        GridView1.SelectedIndex = -1;
        Label7.Visible = true;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Label7.Visible = false;
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        string temp_id;
        temp_id = GridView1.SelectedValue.ToString();
        SqlCommand my_update = new SqlCommand("DELETE FROM cust_appoint WHERE app_no='" + temp_id + "';", conn);
        conn.Open();
        my_update.ExecuteNonQuery();
        conn.Close();
        DataList1.DataBind();
        GridView1.DataBind();
        GridView1.SelectedIndex = -1;
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Panel3.Visible = true;
        Panel2.Visible = false;
    }

    protected void LinkButton17_Click(object sender, EventArgs e)
    {
        SqlCommand my_insert = new SqlCommand("INSERT INTO cust_appoint(user_name,app_date,app_detail,contact_no,app_status,lock_by) VALUES('" + Request.QueryString["user_query"].ToString() + "','" + RadDateTimePicker2.SelectedDate.ToString() + "','" + TextBox11.Text + "','" + TextBox22.Text + "','pending','none');", conn);
        conn.Open();
        my_insert.ExecuteNonQuery();
        conn.Close();
        Panel3.Visible = false;
        Panel2.Visible = true;
        GridView1.DataBind();
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        DataListItem dli = (DataListItem)btn.NamingContainer;
        TextBox TextBox3 = (TextBox)dli.FindControl("TextBox3");
        TextBox3.Text = "";
        TextBox3.ReadOnly = false;
    }
}