using System;
using System.Data;
using System.Data.SqlClient;

public partial class user_login : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("user_inbox.aspx?user_query=fawad");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Add("user_session", "fawad_session");
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
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        statuss.Text = "";
        TextBox2.Text = "";
    }
}