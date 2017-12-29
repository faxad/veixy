using System;
using System.Data;
using System.Data.SqlClient;

public partial class top_mp : System.Web.UI.MasterPage
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        label_date.Text = Convert.ToString(System.DateTime.Now.ToShortDateString());
        if (Session["user_session"].ToString() != "")
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
        else
        {
            LinkButton2.Text = "Sign-In";
            Panel1.Visible = true;
            Panel2.Visible = false;
            Label1.Text = Session["user_session"].ToString();
        }
    }

    protected void RadMenu1_ItemClick(object sender, Telerik.WebControls.RadMenuEventArgs e)
    {
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();
        System.Data.SqlClient.SqlCommand my_insert = new System.Data.SqlClient.SqlCommand("UPDATE system_log SET logout_at='" + my_time + "' WHERE user_id='" + Session["user_session"].ToString() + "' AND login_at='" + Session["staff_time"].ToString() + "';", conn);
        System.Data.SqlClient.SqlCommand my_delete = new System.Data.SqlClient.SqlCommand("DELETE FROM activ_users WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_insert.ExecuteNonQuery();
        my_delete.ExecuteNonQuery();
        conn.Close();

        System.Data.DataSet ds0 = new System.Data.DataSet();
        int x = 0;
        System.Data.SqlClient.SqlDataAdapter da0 = new System.Data.SqlClient.SqlDataAdapter("SELECT COUNT(loc_by) FROM staff_loc WHERE loc_by='" + Session["user_session"].ToString() + "'", conn);
        da0.Fill(ds0);
        foreach (System.Data.DataRow dr0 in ds0.Tables[0].Rows)
        {
            string temp = dr0[0].ToString();
            x = Convert.ToInt32(temp);
        }

        System.Data.SqlClient.SqlCommand my_delete2 = new System.Data.SqlClient.SqlCommand("DELETE FROM staff_loc WHERE loc_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_delete2.ExecuteNonQuery();
        conn.Close();

        System.Data.SqlClient.SqlCommand my_update1 = new System.Data.SqlClient.SqlCommand("UPDATE cust_inbox SET lock_by='none' WHERE lock_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update1.ExecuteNonQuery();
        conn.Close();

        System.Data.SqlClient.SqlCommand my_update2 = new System.Data.SqlClient.SqlCommand("UPDATE my_calls SET lock_by='none' WHERE lock_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update2.ExecuteNonQuery();
        conn.Close();

        System.Data.SqlClient.SqlCommand my_update3 = new System.Data.SqlClient.SqlCommand("UPDATE cust_appoint SET lock_by='none' WHERE lock_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update3.ExecuteNonQuery();
        conn.Close();

        System.Data.SqlClient.SqlCommand inc_unlock = new System.Data.SqlClient.SqlCommand("UPDATE eval_tab1 SET unlocks=unlocks+" + x + " WHERE user_id='" + Session["user_session"].ToString() + "' AND user_login='" + Session["staff_time"].ToString() + "';", conn);
        conn.Open();
        inc_unlock.ExecuteNonQuery();
        conn.Close();
        Session["user_session"] = "";
        Session["staff_time"] = "";
        Session["txt_session"] = "";
        Session["type_session"] = "";
        Session["mail_session"] = "";
        Session["temp"] = "";
        Session.Abandon();
        Response.Redirect("user_login.aspx");
    }

    protected void LinkButton14_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "Staff Member")
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT staff_id, staff_pass,acc_status FROM staff_info WHERE staff_id='" + TextBox1.Text + "';", conn);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (dr[0].ToString() == TextBox1.Text && dr[1].ToString() == TextBox2.Text && dr[2].ToString() == "Activated")
                    {
                        DateTime obj = new DateTime();
                        obj = System.DateTime.Now;
                        string my_time = obj.ToString();
                        Session.Add("user_session", dr[0].ToString());
                        SqlCommand my_insert = new SqlCommand("INSERT INTO system_log(user_id,user_type,login_at) VALUES('" + Session["user_session"].ToString() + "','staff','" + my_time + "');", conn);
                        SqlCommand my_insert21 = new SqlCommand("INSERT INTO eval_tab1(user_id,user_login) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "');", conn);
                        conn.Open();
                        my_insert.ExecuteNonQuery();
                        my_insert21.ExecuteNonQuery();
                        conn.Close();

                        Session.Add("staff_time", my_time);
                        try
                        {
                            SqlCommand my_insert2 = new SqlCommand("INSERT INTO activ_users(user_id,user_type) VALUES('" + Session["user_session"].ToString() + "','staff');", conn);
                            conn.Open();
                            my_insert2.ExecuteNonQuery();
                            conn.Close();
                        }
                        catch
                        {
                            conn.Close();
                            SqlCommand my_delete2 = new SqlCommand("DELETE FROM activ_users WHERE user_id='" + TextBox1.Text + "';", conn);
                            conn.Open();
                            my_delete2.ExecuteNonQuery();
                            conn.Close();
                            SqlCommand my_insert2 = new SqlCommand("INSERT INTO activ_users(user_id,user_type) VALUES('" + Session["user_session"].ToString() + "','staff');", conn);
                            conn.Open();
                            my_insert2.ExecuteNonQuery();
                            conn.Close();
                        }
                        Response.Redirect("staff_inbox.aspx");
                    }
                    else
                    {
                        statuss.Text = "Invalid Staff Details";
                        break;
                    }
                }
            }
            statuss.Text = "Invalid Staff Details";
        }
        else if (RadioButtonList1.SelectedItem.Text == "Customer")
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT user_id,user_pass,acc_status from user_info WHERE user_id='" + TextBox1.Text + "';", conn);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (dr[0].ToString() == TextBox1.Text && dr[1].ToString() == TextBox2.Text && dr[2].ToString() == "Activated")
                    {
                        Session["user_session"] = dr[0].ToString();
                        DateTime obj = new DateTime();
                        obj = System.DateTime.Now;
                        string my_time = obj.ToString();
                        SqlCommand my_insert = new SqlCommand("INSERT INTO system_log(user_id,user_type,login_at) VALUES('" + Session["user_session"].ToString() + "','cust','" + my_time + "');", conn);
                        conn.Open();
                        my_insert.ExecuteNonQuery();
                        conn.Close();
                        Session.Add("staff_time", my_time);
                        try
                        {
                            SqlCommand my_insert2 = new SqlCommand("INSERT INTO activ_users(user_id,user_type) VALUES('" + Session["user_session"].ToString() + "','cust');", conn);
                            conn.Open();
                            my_insert2.ExecuteNonQuery();
                            conn.Close();
                        }
                        catch
                        {
                            conn.Close();
                            SqlCommand my_delete2 = new SqlCommand("DELETE FROM activ_users WHERE user_id='" + TextBox1.Text + "';", conn);
                            conn.Open();
                            my_delete2.ExecuteNonQuery();
                            conn.Close();
                            SqlCommand my_insert2 = new SqlCommand("INSERT INTO activ_users(user_id,user_type) VALUES('" + Session["user_session"].ToString() + "','cust');", conn);
                            conn.Open();
                            my_insert2.ExecuteNonQuery();
                            conn.Close();
                        }
                        Response.Redirect("cust_inbox.aspx");
                        break;
                    }
                    else
                    {
                        statuss.Text = "Invalid Customer Details";
                        break;
                    }
                }
            }
            statuss.Text = "Invalid Customer Details";
        }
        else if (RadioButtonList1.SelectedItem.Text == "Administrator")
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT admin_id, admin_pas FROM admin_pass WHERE admin_id='" + TextBox1.Text + "';", conn);
            da.Fill(ds);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                if (dr[0].ToString() == TextBox1.Text && dr[1].ToString() == TextBox2.Text)
                {
                    DateTime obj = new DateTime();
                    obj = System.DateTime.Now;
                    string my_time = obj.ToString();
                    Session.Add("user_session", dr[0].ToString());
                    Session.Add("staff_time", my_time);
                    SqlCommand my_insert = new SqlCommand("INSERT INTO system_log(user_id,user_type,login_at) VALUES('" + Session["user_session"].ToString() + "','admin','" + my_time + "');", conn);
                    conn.Open();
                    my_insert.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("admin_main.aspx");
                }
                else
                {
                    statuss.Text = "Invalid Admin Details";
                    break;
                }
            }
            statuss.Text = "Invalid Admin Details";
        }
        statuss.Visible = true;
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        statuss.Text = "";
        TextBox2.Text = "";
    }
}