using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class staff_inbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        {
        }

        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();

        if (RadioButtonList1.SelectedItem.Text == "One Recipient")
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
                        SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox1.Text + "','Images/msg_unchecked.jpg');", conn);
                        conn.Open();
                        my_insert.ExecuteNonQuery();
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
        else if (RadioButtonList1.SelectedItem.Text == "Multiple Users")
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
                            SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + li.Text + "','Images/msg_unchecked.jpg');", conn);
                            conn.Open();
                            my_insert.ExecuteNonQuery();
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
        else if (RadioButtonList1.SelectedItem.Text == "User Group")
        {
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ListBox1.Items.Add(TextBox2.Text);
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "One Recipient")
        {
            TextBox2.Enabled = false;
            ListBox1.Enabled = false;
            ImageButton1.Enabled = false;
        }
        else if (RadioButtonList1.SelectedItem.Text == "Multiple Users")
        {
            TextBox2.Enabled = true;
            ListBox1.Enabled = true;
            ImageButton1.Enabled = true;
        }
        else if (RadioButtonList1.SelectedItem.Text == "User Group")
        {
            TextBox2.Enabled = false;
            ListBox1.Enabled = true;
            ImageButton1.Enabled = false;
            ListBox1.DataSourceID = SqlDataSource1.ID;
            ListBox1.DataTextField = "prod_name";
            ListBox1.DataBind();
        }
    }
}