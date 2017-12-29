using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class staff_msgbox : System.Web.UI.Page
{
    private string contact_no = "aaa";
    private string email_add = "bbb";
    private string cust_profile = "00000000";
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    public void fetch_user_info(string temp)
    {
        try
        {
            SqlDataAdapter my_select = new SqlDataAdapter("SELECT email_add,user_contact_no,cust_profile FROM user_info WHERE user_id='" + temp + "';", conn);
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
        {
        }
        {
        }
        if (Request.QueryString[0].ToString() == "0")
        {
            Session["txt_session"] = "";
            Session["mail_session"] = "";
        }
        else if (Request.QueryString[0].ToString() == "1")
        {
            TextBox1.Text = Session["mail_session"].ToString();
        }
        else if (Request.QueryString[0].ToString() == "2")
        {
            TextBox4.Text = Session["txt_session"].ToString();
        }
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "Single Recipient")
        {
            Session.Add("type_session", "cust");
            TextBox2.Visible = true;
            TextBox2.Enabled = false;
            ListBox1.Enabled = false;
            TextBox1.Enabled = true;
            ImageButton1.Enabled = false;
            DropDownList1.Visible = false;
        }
        else if (RadioButtonList1.SelectedItem.Text == "Multiple Clients")
        {
            Session.Add("type_session", "cust");
            TextBox1.Enabled = false;
            TextBox2.Visible = true;
            ListBox1.Items.Clear();
            TextBox2.Enabled = true;
            ListBox1.Enabled = true;
            ImageButton1.Enabled = true;
            DropDownList1.Visible = false;
        }
        else if (RadioButtonList1.SelectedItem.Text == "Client Group")
        {
            Session.Add("type_session", "cust");
            TextBox1.Enabled = false;
            TextBox2.Visible = true;
            TextBox2.Enabled = false;
            ListBox1.Enabled = true;
            ImageButton1.Enabled = false;
            ListBox1.DataSourceID = SqlDataSource1.ID;
            ListBox1.DataTextField = "prod_name";
            ListBox1.DataBind();
            DropDownList1.Visible = false;
        }
        else if (RadioButtonList1.SelectedItem.Text == "Staff Members")
        {
            Session.Add("type_session", "staff");
            TextBox1.Enabled = false;
            ListBox1.Items.Clear();
            ListBox1.Enabled = true;
            ImageButton1.Enabled = true;
            TextBox2.Visible = false;
            DropDownList1.Visible = true;
        }
        else if (RadioButtonList1.SelectedItem.Text == "Administrator")
        {
            Session.Add("type_session", "admin");
            TextBox1.Enabled = false;
            TextBox2.Enabled = false;
            ListBox1.Items.Clear();
            ListBox1.Enabled = false;
            ImageButton1.Enabled = false;
            TextBox2.Visible = true;
            DropDownList1.Visible = false;
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "Staff Members")
        {
            ListBox1.Items.Add(DropDownList1.SelectedItem.Text);
        }
        else
        {
            ListBox1.Items.Add(TextBox2.Text);
        }
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();

        if (RadioButtonList1.SelectedItem.Text == "Single Recipient")
        {
            int not_found = 1;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT user_id FROM user_info WHERE user_id='" + TextBox1.Text + "';", conn);
            da.Fill(ds);
            try
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (dr[0].ToString() == TextBox1.Text)
                    {
                        status_label.Text = dr[0].ToString();
                        SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + TextBox1.Text + "','Images/msg_unchecked.jpg','staff','cust','inbox');", conn);
                        SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + TextBox1.Text + "','Images/msg_checked.jpg','staff','cust','sent');", conn);
                        my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                        my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                        my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                        my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                        conn.Open();
                        my_insert.ExecuteNonQuery();
                        my_insert2.ExecuteNonQuery();
                        SqlCommand inc_msg_s = new SqlCommand("UPDATE eval_tab2 SET msg_sent=msg_sent+1 WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
                        inc_msg_s.ExecuteNonQuery();
                        conn.Close();
                        fetch_user_info(TextBox1.Text);
                        if (cust_profile[7] == '1')
                        {
                            email_class obje = new email_class();
                            string email_msg = TextBox4.Text;
                            int estatus = obje.send_email(email_add, "Customer Support Service: Message Reply", email_msg);
                            if (estatus == 1)
                            {
                            }
                            else if (estatus == 0)
                            {
                            }
                        }
                        status_label.Text = "Sending Success";
                        not_found = 0;
                    }
                }
            }
            catch
            {
                status_label.Text = "Sending Failed";
            }
            if (not_found == 1)
            {
                status_label.Text = "Sending Failed";
            }
        }
        else if (RadioButtonList1.SelectedItem.Text == "Multiple Clients")
        {
            foreach (ListItem li in ListBox1.Items)
            {
                int not_found = 1;
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("SELECT user_id FROM user_info WHERE user_id='" + li.Text + "';", conn);
                da.Fill(ds);
                try
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr[0].ToString() == li.Text)
                        {
                            status_label.Text = dr[0].ToString();
                            SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_unchecked.jpg','staff','cust','inbox');", conn);
                            SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_checked.jpg','staff','cust','sent');", conn);
                            my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                            my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                            my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                            my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                            conn.Open();
                            my_insert.ExecuteNonQuery();
                            my_insert2.ExecuteNonQuery();
                            SqlCommand inc_msg_s = new SqlCommand("UPDATE eval_tab2 SET msg_sent=msg_sent+1 WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
                            inc_msg_s.ExecuteNonQuery();
                            conn.Close();
                            fetch_user_info(li.Text);
                            if (cust_profile[7] == '1')
                            {
                                email_class obje = new email_class();
                                string email_msg = TextBox4.Text;
                                int estatus = obje.send_email(email_add, "Customer Support Service: Message Reply", email_msg);
                                if (estatus == 1)
                                {
                                }
                                else if (estatus == 0)
                                {
                                }
                            }
                        }
                        status_label.Text = "Sending Success";
                        not_found = 0;
                    }
                }
                catch
                {
                    status_label.Text = "Sending Failed";
                }
                if (not_found == 1)
                {
                    status_label.Text = "Sending Failed";
                }
            }
        }
        else if (RadioButtonList1.SelectedItem.Text == "Client Group")
        {
            int not_found = 1;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT user_name FROM my_product WHERE prod_title='" + ListBox1.SelectedItem.Text + "';", conn);
            da.Fill(ds);
            try
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    status_label.Text = dr[0].ToString();
                    SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + dr[0].ToString() + "','Images/msg_unchecked.jpg','staff','cust','inbox');", conn);
                    SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + dr[0].ToString() + "','Images/msg_checked.jpg','staff','cust','sent');", conn);
                    my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                    my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                    my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                    my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                    conn.Open();
                    my_insert.ExecuteNonQuery();
                    my_insert2.ExecuteNonQuery();
                    SqlCommand inc_msg_s = new SqlCommand("UPDATE eval_tab2 SET msg_sent=msg_sent+1 WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
                    inc_msg_s.ExecuteNonQuery();
                    conn.Close();
                    fetch_user_info(dr[0].ToString());
                    if (cust_profile[7] == '1')
                    {
                        email_class obje = new email_class();
                        string email_msg = TextBox4.Text;
                        int estatus = obje.send_email(email_add, "Customer Support Service: Message Reply", email_msg);
                        if (estatus == 1)
                        {
                        }
                        else if (estatus == 0)
                        {
                        }
                    }
                    status_label.Text = "Sending Success";
                    not_found = 0;
                }
            }
            catch
            {
                status_label.Text = "Sending Failed";
            }
            if (not_found == 1)
            {
                status_label.Text = "Sending Failed";
            }
        }
        else if (RadioButtonList1.SelectedItem.Text == "Staff Members")
        {
            foreach (ListItem li in ListBox1.Items)
            {
                int not_found = 1;
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("SELECT staff_id FROM staff_info WHERE staff_id='" + li.Text + "';", conn);
                da.Fill(ds);
                try
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr[0].ToString() == li.Text)
                        {
                            status_label.Text = dr[0].ToString();
                            SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_unchecked.jpg','staff','staff','inbox');", conn);
                            SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_checked.jpg','staff','staff','sent');", conn);
                            my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                            my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                            my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                            my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                            conn.Open();
                            my_insert.ExecuteNonQuery();
                            my_insert2.ExecuteNonQuery();
                            SqlCommand inc_msg_s = new SqlCommand("UPDATE eval_tab2 SET msg_sent=msg_sent+1 WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
                            inc_msg_s.ExecuteNonQuery();
                            conn.Close();
                            status_label.Text = "Sending Success";
                            not_found = 0;
                        }
                    }
                }
                catch
                {
                    status_label.Text = "Sending Failed";
                }
                if (not_found == 1)
                {
                    status_label.Text = "Sending Failed";
                }
            }
        }
        else if (RadioButtonList1.SelectedItem.Text == "Administrator")
        {
            int not_found = 1;

            try
            {
                SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'admin','Images/msg_unchecked.jpg','staff','admin','inbox');", conn);
                SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'admin','Images/msg_checked.jpg','staff','admin','sent');", conn);
                my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                conn.Open();
                my_insert.ExecuteNonQuery();
                my_insert2.ExecuteNonQuery();
                SqlCommand inc_msg_s = new SqlCommand("UPDATE eval_tab2 SET msg_sent=msg_sent+1 WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
                inc_msg_s.ExecuteNonQuery();
                conn.Close();
                status_label.Text = "Sending Success";
                not_found = 0;
            }
            catch
            {
                status_label.Text = "Sending Failed";
            }
            if (not_found == 1)
            {
                status_label.Text = "Sending Failed";
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();

        if (RadioButtonList1.SelectedItem.Text == "Single Recipient")
        {
            int not_found = 1;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT user_id FROM user_info WHERE user_id='" + TextBox1.Text + "';", conn);
            da.Fill(ds);
            try
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (dr[0].ToString() == TextBox1.Text)
                    {
                        status_label.Text = dr[0].ToString();
                        SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + TextBox1.Text + "','Images/msg_unchecked.jpg','staff','cust','draft');", conn);
                        SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + TextBox1.Text + "','Images/msg_checked.jpg','staff','cust','none');", conn);
                        my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                        my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                        my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                        my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                        conn.Open();
                        my_insert.ExecuteNonQuery();
                        my_insert2.ExecuteNonQuery();
                        conn.Close();
                        status_label.Text = "Sending Success";
                        not_found = 0;
                    }
                }
            }
            catch
            {
                status_label.Text = "Sending Failed";
            }
            if (not_found == 1)
            {
                status_label.Text = "Sending Failed";
            }
        }
        else if (RadioButtonList1.SelectedItem.Text == "Multiple Clients")
        {
            foreach (ListItem li in ListBox1.Items)
            {
                int not_found = 1;
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("SELECT user_id FROM user_info WHERE user_id='" + li.Text + "';", conn);
                da.Fill(ds);
                try
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr[0].ToString() == li.Text)
                        {
                            status_label.Text = dr[0].ToString();
                            SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_unchecked.jpg','staff','cust','draft');", conn);
                            SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_checked.jpg','staff','cust','none');", conn);
                            my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                            my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                            my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                            my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                            conn.Open();
                            my_insert.ExecuteNonQuery();
                            my_insert2.ExecuteNonQuery();
                            conn.Close();
                            status_label.Text = "Sending Success";
                            not_found = 0;
                        }
                    }
                }
                catch
                {
                    status_label.Text = "Sending Failed";
                }
                if (not_found == 1)
                {
                    status_label.Text = "Sending Failed";
                }
            }
        }
        else if (RadioButtonList1.SelectedItem.Text == "Client Group")
        {
            int not_found = 1;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT user_name FROM my_product WHERE prod_title='" + ListBox1.SelectedItem.Text + "';", conn);
            da.Fill(ds);
            try
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    status_label.Text = dr[0].ToString();
                    SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + dr[0].ToString() + "','Images/msg_unchecked.jpg','staff','cust','draft');", conn);
                    SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + dr[0].ToString() + "','Images/msg_checked.jpg','staff','cust','none');", conn);
                    my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                    my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                    my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                    my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                    conn.Open();
                    my_insert.ExecuteNonQuery();
                    my_insert2.ExecuteNonQuery();
                    conn.Close();
                    status_label.Text = "Sending Success";
                    not_found = 0;
                }
            }
            catch
            {
                status_label.Text = "Sending Failed";
            }
            if (not_found == 1)
            {
                status_label.Text = "Sending Failed";
            }
        }
        else if (RadioButtonList1.SelectedItem.Text == "Staff Members")
        {
            foreach (ListItem li in ListBox1.Items)
            {
                int not_found = 1;
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("SELECT staff_id FROM staff_info WHERE staff_id='" + li.Text + "';", conn);
                da.Fill(ds);
                try
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr[0].ToString() == li.Text)
                        {
                            status_label.Text = dr[0].ToString();
                            SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_unchecked.jpg','staff','staff','draft');", conn);
                            SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_checked.jpg','staff','staff','none');", conn);
                            my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                            my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                            my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                            my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                            conn.Open();
                            my_insert.ExecuteNonQuery();
                            my_insert2.ExecuteNonQuery();
                            conn.Close();
                            status_label.Text = "Sending Success";
                            not_found = 0;
                        }
                    }
                }
                catch
                {
                    status_label.Text = "Sending Failed";
                }
                if (not_found == 1)
                {
                    status_label.Text = "Sending Failed";
                }
            }
        }
        else if (RadioButtonList1.SelectedItem.Text == "Administrator")
        {
            int not_found = 1;

            try
            {
                SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'admin','Images/msg_unchecked.jpg','staff','admin','draft');", conn);
                SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'admin','Images/msg_checked.jpg','staff','admin','none');", conn);
                my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                conn.Open();
                my_insert.ExecuteNonQuery();
                my_insert2.ExecuteNonQuery();
                conn.Close();
                status_label.Text = "Sending Success";
                not_found = 0;
            }
            catch
            {
                status_label.Text = "Sending Failed";
            }
            if (not_found == 1)
            {
                status_label.Text = "Sending Failed";
            }
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        int x = ListBox1.Items.Count;
        ListBox1.Items.RemoveAt(x - 1);
        ListBox1.DataBind();
    }
}