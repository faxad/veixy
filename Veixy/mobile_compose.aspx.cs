using System;
using System.Data;
using System.Data.SqlClient;

public partial class mobile_compose : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("mobile_main.aspx");
        }
        Label3.Text = Session["user_session"].ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string my_time = System.DateTime.Now.ToString();
        DataSet ds = new DataSet();
        if (TextBox2.Text.Length > 50)
        {
            statuss.Visible = true;
            statuss.Text = "Subject is too long in length";
        }
        else if (TextBox2.Text.Length == 0 || TextBox1.Text.Length == 0)
        {
            statuss.Visible = true;
            statuss.Text = "Subject & Message cannot be left blank";
        }
        else
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
                my_insert2.Parameters.Add("@msg", 8000).Value = TextBox1.Text;
                conn.Open();
                my_insert.ExecuteNonQuery();
                my_insert2.ExecuteNonQuery();
                conn.Close();
                statuss.Visible = true;
                statuss.Text = "Your service ticket # is: " + x.ToString();
            }
            catch
            {
            }
        }
    }
}