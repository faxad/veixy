using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class cust_compose : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
    private int new_request;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
        TextBox1.Enabled = false;
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue.ToString() == "1")
        {
            DropDownList1.Enabled = true;
            TextBox2.Enabled = true;
            RequiredFieldValidator1.Enabled = false;
            new_request = 1;
        }
        if (RadioButtonList1.SelectedValue.ToString() == "2")
        {
            new_request = 0;
            TextBox1.Enabled = true;
            TextBox2.Enabled = false;
            DropDownList1.Enabled = false;
            RequiredFieldValidator1.Enabled = true;
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox2.Text.Length > 50 && TextBox2.Enabled == true)
        {
            Label1.Visible = true;
            Label1.Text = "Subject field is too long in length";
        }
        else if (TextBox2.Text.Length == 0 && RadioButtonList1.SelectedValue.ToString() == "1")
        {
            Label1.Visible = true;
            Label1.Text = "Subject field cannot be left blank";
        }
        else
        {
            string contact_no = "aaa";
            string email_add = "bbb";
            string cust_profile = "00000000";
            try
            {
                SqlDataAdapter my_select = new SqlDataAdapter("SELECT email_add,user_contact_no,cust_profile FROM user_info WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
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
                Response.Redirect("error_gpage.aspx?error_id=1259");
            }
            int continue_ok = 0;

            DataSet ds = new DataSet();

            DateTime obj = new DateTime();
            obj = System.DateTime.Now;
            string my_time = obj.ToString();

            if (RadioButtonList1.SelectedValue.ToString() == "1")
            {
                Random r_no = new Random();
                int token_unique = 2;
                int x = r_no.Next(1, 99999);
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter("select token_no from cust_inbox;", conn);
                    da.Fill(ds);
                }
                catch
                {
                    Response.Redirect("error_gpage.aspx?error_id=1245");
                }
                while (token_unique != 1)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (x.ToString() == dr[0].ToString())
                        {
                            token_unique = 0;
                            x = r_no.Next(1, 99999);
                            break;
                        }
                        else
                            token_unique = 1;
                    }
                }
                string temp2 = DropDownList1.SelectedItem.Text;
                try
                {
                    int status = 0;
                    int estatus = 0;
                    SqlCommand my_insert = new SqlCommand("INSERT INTO cust_inbox(token_no,sent_from,msg_subject,img_url,img_url2,start_date,open_close,held_by,association,lock_by) VALUES(" + x + ",'" + Session["user_session"].ToString() + "',@subject,'Images/msg_checked.jpg','Images/msg_unchecked.jpg','" + my_time + "','O','none','" + temp2 + "','none');", conn);
                    my_insert.Parameters.Add("@subject", 100).Value = TextBox2.Text;
                    SqlCommand my_insert2 = new SqlCommand("INSERT INTO act_onbox(token_no,act_msg,msg_date,msg_from) VALUES(" + x + ",@msg,'" + my_time + "','" + Session["user_session"].ToString() + "');", conn);
                    my_insert2.Parameters.Add("@msg", 8000).Value = TextBox3.Text;
                    conn.Open();
                    my_insert.ExecuteNonQuery();
                    my_insert2.ExecuteNonQuery();
                    conn.Close();
                    Label1.Visible = true;
                    Label1.Text = "Your service ticket # is: " + x.ToString();
                    if (cust_profile[0] == '1')
                    {
                        sms_class objj = new sms_class();
                        status = objj.send_sms(contact_no, Label1.Text);
                        if (status == 1)
                        {
                            Label1.Text += ". SMS sent";
                        }
                        else if (status == 0)
                        {
                            Label1.Text += ". SMS failed";
                        }
                    }
                    if (cust_profile[1] == '1')
                    {
                        email_class obje = new email_class();
                        estatus = obje.send_email(email_add, "Ticket Registered", TextBox3.Text + "\n" + Label1.Text);
                        if (estatus == 1)
                        {
                            Label1.Text += ". Mail sent";
                        }
                        else if (estatus == 0)
                        {
                            Label1.Text += ". Mail failed";
                            Label1.Text += email_add;
                        }
                    }
                    Response.Redirect("cust_success.aspx?email=" + estatus + "&sms=" + status + "&ticket=" + x.ToString());
                }
                catch
                {
                }
            }
            if (RadioButtonList1.SelectedValue.ToString() == "2")
            {
                int token_temp = Convert.ToInt32(TextBox1.Text);
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter("Select sent_from from cust_inbox WHERE token_no=" + token_temp + ";", conn);
                    da.Fill(ds);
                }
                catch
                {
                    Response.Redirect("error_gpage.aspx?error_id=1266");
                }
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (dr[0].ToString() == Session["user_session"].ToString())
                    {
                        continue_ok = 1;
                        {
                            SqlCommand my_insert = new SqlCommand("UPDATE cust_inbox SET img_url2='Images/msg_unchecked.jpg' WHERE token_no='" + token_temp + "';", conn);
                            SqlCommand my_insert2 = new SqlCommand("INSERT INTO act_onbox(token_no,act_msg,msg_date,msg_from) VALUES('" + token_temp + "',@msg,'" + my_time + "','" + Session["user_session"].ToString() + "');", conn);
                            my_insert2.Parameters.Add("@msg", 8000).Value = TextBox3.Text;
                            conn.Open();
                            my_insert.ExecuteNonQuery();
                            my_insert2.ExecuteNonQuery();
                            conn.Close();
                            Label1.Visible = true;
                            Label1.Text = "Ticket is updated with your comments";
                        }
                    }
                    else
                    {
                        continue_ok = 0;
                        break;
                    }
                }

                if (continue_ok == 0)
                {
                    Label1.Visible = true;
                    Label1.Text = "Ticket # not associated with your ID";
                }
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("cust_compose.aspx");
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("cust_inbox.aspx");
    }

    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        if (DropDownList1.Items.Count == 1)
        {
            DropDownList1.Enabled = false;
        }
    }
}