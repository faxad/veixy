using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class cust_callreq : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
        TextBox3.Enabled = false;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string tel;
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        if (RadioButtonList1.SelectedItem.Text == "Use Existing Contact #")
        {
            DataSet ds = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT user_contact_no FROM user_info WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
                da.Fill(ds);
            }
            catch
            {
                Response.Redirect("error_gpage.aspx?error_id=1366");
            }
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                TextBox3.Enabled = true;
                tel = dr[0].ToString();
                TextBox3.Text = tel.ToString();
            }
        }

        conn.Open();
        if (RadioButtonList2.SelectedItem.Text == "Urgent")
        {
            SqlCommand my_insert2 = new SqlCommand("INSERT into my_calls(call_date,user_name,issue_subject,issue_msg,urgent_call,contact_no,call_status) Values('" + System.DateTime.Now.ToString() + "','" + Session["user_session"].ToString() + "',@subject,@msg,'" + RadioButtonList2.SelectedItem.Text + "','" + TextBox3.Text + "','Not Dialed');", conn);
            my_insert2.Parameters.Add("@subject", 50).Value = TextBox4.Text;
            my_insert2.Parameters.Add("@msg", 8000).Value = TextBox5.Text + "\n";
            my_insert2.ExecuteNonQuery();
        }
        else
        {
            SqlCommand my_insert = new SqlCommand("INSERT into my_calls(call_date,user_name,issue_subject,issue_msg,urgent_call,contact_no,call_status) Values('" + RadDateTimePicker1.SelectedDate.ToString() + "','" + Session["user_session"].ToString() + "',@subject,@msg,'" + RadioButtonList2.SelectedItem.Text + "','" + TextBox3.Text + "','Not Dialed');", conn);
            my_insert.Parameters.Add("@subject", 50).Value = TextBox4.Text;
            my_insert.Parameters.Add("@msg", 8000).Value = TextBox5.Text + "\n";
            my_insert.ExecuteNonQuery();
        }

        conn.Close();
        Response.Redirect("cust_mycall.aspx");
    }

    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList2.SelectedItem.Text == "Urgent")
        {
            RadDateTimePicker1.Enabled = false;
        }
        else
        {
            RadDateTimePicker1.Enabled = true;
        }
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "Specify Contact #")
        {
            TextBox3.Enabled = true;
        }
    }
}