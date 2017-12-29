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
        LinkButton7.Visible = false;
        TextBox3.Visible = false;
        Image8.Visible = false;
        Label1.Visible = false;
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
            LinkButton1.Attributes.Add("onclick", "alert('Please select a msg first');");
        }
        else
        {
            string temp_id;
            int x = GridView1.SelectedIndex;
            temp_id = GridView1.SelectedValue.ToString();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT lock_by FROM cust_inbox WHERE token_no='" + temp_id + "';", conn);
            da.Fill(ds);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                if (dr[0].ToString() == "none")
                {
                    SqlCommand my_update = new SqlCommand("UPDATE cust_inbox SET lock_by='" + Session["user_session"].ToString() + "' WHERE token_no='" + temp_id + "';", conn);
                    SqlCommand my_insert2 = new SqlCommand("INSERT INTO staff_loc(user_loc_id,loc_by,loc_topic,loc_type) VALUES('" + GridView1.SelectedValue.ToString() + "','" + Session["user_session"].ToString() + "','" + GridView1.Rows[x].Cells[3].Text + "','Ticket');", conn);
                    conn.Open();
                    my_update.ExecuteNonQuery();
                    my_insert2.ExecuteNonQuery();
                }
            }
            conn.Close();
            GridView1.DataBind();
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
        try
        {
            string temp_id;
            temp_id = GridView1.SelectedValue.ToString();
            SqlCommand my_update4 = new SqlCommand("UPDATE cust_inbox SET open_close='C',closed_by='" + Session["user_session"].ToString() + "' WHERE token_no='" + temp_id + "';", conn);
            conn.Open();
            my_update4.ExecuteNonQuery();
            conn.Close();
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
            SqlCommand my_update5 = new SqlCommand("UPDATE cust_inbox SET lock_by='" + temp_lok + "' WHERE token_no='" + temp_id + "';", conn);
            SqlCommand my_insert2 = new SqlCommand("INSERT INTO staff_loc(user_loc_id,loc_by,loc_topic,loc_type) VALUES('" + GridView1.SelectedValue.ToString() + "','" + temp_lok + "','" + GridView1.Rows[x].Cells[3].Text + "','Ticket');", conn);
            conn.Open();
            my_update5.ExecuteNonQuery();
            my_insert2.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
            TextBox2.Text = "";
            GridView1.SelectedIndex = -1;
            Label2.Visible = true;
        }
        catch
        {
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
            }
        }
        conn.Close();
        GridView1.DataBind();
        GridView1.SelectedIndex = -1;
        Label2.Visible = true;
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        fetch_user_info();
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();
        SqlCommand my_insert2 = new SqlCommand("INSERT INTO act_onbox(token_no,act_msg,msg_date,msg_from) VALUES(" + GridView1.SelectedValue.ToString() + ",@msg,'" + my_time + "','" + Session["user_session"].ToString() + "');", conn);
        my_insert2.Parameters.Add("@msg", 8000).Value = TextBox3.Text;
        SqlCommand my_update3 = new SqlCommand("UPDATE cust_inbox SET img_url='Images/msg_unchecked.jpg',img_url2='Images/msg_replied2.jpg' WHERE token_no='" + GridView1.SelectedValue.ToString() + "';", conn);
        conn.Open();
        my_insert2.ExecuteNonQuery();
        my_update3.ExecuteNonQuery();
        conn.Close();
        if (cust_profile[1] == '1')
        {
            email_class obje = new email_class();
            string email_msg = TextBox3.Text;
            int estatus = obje.send_email(email_add, "Customer Support Service: Ticket Reply", email_msg);
            if (estatus == 1)
            {
            }
            else if (estatus == 0)
            {
            }
        }
        TextBox3.Text = "";
        DataList1.DataBind();
        GridView1.DataBind();
        Label2.Visible = false;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        LinkButton7.Visible = true;
        TextBox3.Visible = true;
        Image8.Visible = true;
        Label1.Visible = true;
        Label2.Visible = false;
    }

    protected void LinkButton8_Click(object sender, EventArgs e)
    {
    }

    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
}