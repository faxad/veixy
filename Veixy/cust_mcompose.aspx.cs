using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cust_mcompose : System.Web.UI.Page
{
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
            ImageButton1.Enabled = false;
            DropDownList1.Visible = false;
            TextBox1.Enabled = true;
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
            ListBox1.Items.Clear();
            ListBox1.Enabled = false;
            ImageButton1.Enabled = false;
            TextBox2.Visible = false;
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
                        SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + TextBox1.Text + "','Images/msg_unchecked.jpg','cust','cust','inbox');", conn);
                        SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + TextBox1.Text + "','Images/msg_checked.jpg','cust','cust','sent');", conn);
                        my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                        my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                        my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                        my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                        conn.Open();
                        my_insert.ExecuteNonQuery();
                        my_insert2.ExecuteNonQuery();
                        conn.Close();
                        status_label.Text = "Your message has been sent successfuly.";
                        not_found = 0;
                    }
                }
            }
            catch
            {
                status_label.Text = "(One of) Your recipients ID is invalid";
            }
            if (not_found == 1)
            {
                status_label.Text = "(One of) Your recipients ID is invalid";
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
                            SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_unchecked.jpg','cust','cust','inbox');", conn);
                            SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_checked.jpg','cust','cust','sent');", conn);
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
                    status_label.Text = "(One of) Your recipients ID is invalid";
                }
                if (not_found == 1)
                {
                    status_label.Text = "(One of) Your recipients ID is invalid";
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
                    SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + dr[0].ToString() + "','Images/msg_unchecked.jpg','cust','cust','inbox');", conn);
                    SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + dr[0].ToString() + "','Images/msg_checked.jpg','cust','cust','sent');", conn);
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
                status_label.Text = "(One of) Your recipients ID is invalid";
            }
            if (not_found == 1)
            {
                status_label.Text = "(One of) Your recipients ID is invalid";
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
                            SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_unchecked.jpg','cust','staff','inbox');", conn);
                            SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_checked.jpg','cust','staff','sent');", conn);
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
                    status_label.Text = "(One of) Your recipients ID is invalid";
                }
                if (not_found == 1)
                {
                    status_label.Text = "(One of) Your recipients ID is invalid";
                }
            }
        }
        else if (RadioButtonList1.SelectedItem.Text == "Administrator")
        {
            int not_found = 1;

            try
            {
                SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'admin','Images/msg_unchecked.jpg','cust','admin','inbox');", conn);
                SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'admin','Images/msg_checked.jpg','cust','admin','sent');", conn);
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
                status_label.Text = "(One of) Your recipients ID is invalid";
            }
            if (not_found == 1)
            {
                status_label.Text = "(One of) Your recipients ID is invalid";
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
                        SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + TextBox1.Text + "','Images/msg_unchecked.jpg','cust','cust','draft');", conn);
                        SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + TextBox1.Text + "','Images/msg_checked.jpg','cust','cust','none');", conn);
                        my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                        my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                        my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                        my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                        conn.Open();
                        my_insert.ExecuteNonQuery();
                        my_insert2.ExecuteNonQuery();
                        conn.Close();
                        status_label.Text = "Message saved to drafts";
                        not_found = 0;
                    }
                }
            }
            catch
            {
                status_label.Text = "(One of) Your recipients ID is invalid";
            }
            if (not_found == 1)
            {
                status_label.Text = "(One of) Your recipients ID is invalid";
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
                            SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_unchecked.jpg','cust','cust','draft');", conn);
                            SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_checked.jpg','cust','cust','none');", conn);
                            my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                            my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                            my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                            my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                            conn.Open();
                            my_insert.ExecuteNonQuery();
                            my_insert2.ExecuteNonQuery();
                            conn.Close();
                            status_label.Text = "Message saved to drafts";
                            not_found = 0;
                        }
                    }
                }
                catch
                {
                    status_label.Text = "(One of) Your recipients ID is invalid";
                }
                if (not_found == 1)
                {
                    status_label.Text = "(One of) Your recipients ID is invalid";
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
                    SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + dr[0].ToString() + "','Images/msg_unchecked.jpg','cust','cust','draft');", conn);
                    SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + dr[0].ToString() + "','Images/msg_checked.jpg','cust','cust','none');", conn);
                    my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                    my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                    my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                    my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                    conn.Open();
                    my_insert.ExecuteNonQuery();
                    my_insert2.ExecuteNonQuery();
                    conn.Close();
                    status_label.Text = "Message saved to drafts";
                    not_found = 0;
                }
            }
            catch
            {
                status_label.Text = "(One of) Your recipients ID is invalid";
            }
            if (not_found == 1)
            {
                status_label.Text = "(One of) Your recipients ID is invalid";
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
                            SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_unchecked.jpg','cust','staff','draft');", conn);
                            SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + li.Text + "','Images/msg_checked.jpg','cust','staff','none');", conn);
                            my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                            my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                            my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                            my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                            conn.Open();
                            my_insert.ExecuteNonQuery();
                            my_insert2.ExecuteNonQuery();
                            conn.Close();
                            status_label.Text = "Message saved to drafts";
                            not_found = 0;
                        }
                    }
                }
                catch
                {
                    status_label.Text = "(One of) Your recipients ID is invalid";
                }
                if (not_found == 1)
                {
                    status_label.Text = "(One of) Your recipients ID is invalid";
                }
            }
        }
        else if (RadioButtonList1.SelectedItem.Text == "Administrator")
        {
            int not_found = 1;

            try
            {
                SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'admin','Images/msg_unchecked.jpg','cust','admin','draft');", conn);
                SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'admin','Images/msg_checked.jpg','cust','admin','none');", conn);
                my_insert.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                my_insert2.Parameters.Add("@subject", 50).Value = TextBox3.Text;
                my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox4.Text;
                conn.Open();
                my_insert.ExecuteNonQuery();
                my_insert2.ExecuteNonQuery();
                conn.Close();
                status_label.Text = "Message saved to drafts";
                not_found = 0;
            }
            catch
            {
                status_label.Text = "(One of) Your recipients ID is invalid";
            }
            if (not_found == 1)
            {
                status_label.Text = "(One of) Your recipients ID is invalid";
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