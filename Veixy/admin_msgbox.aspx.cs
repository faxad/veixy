using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_reg_pending : System.Web.UI.Page
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
        LinkButton7.Visible = false;
        Label1.Visible = false;
        Image8.Visible = false;
        TextBox3.Visible = false;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Attributes["onmouseover"] =
    "javascript:setMouseOverColor(this);";
        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackEventReference(this.GridView1, "Select$" + e.Row.RowIndex.ToString());
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label2.Visible = false;
        GridView1.DataBind();
        string temp = GridView1.SelectedDataKey.Value.ToString();
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        SqlCommand update1 = new SqlCommand("update msg_box set msg_img='Images/msg_checked.jpg' where msg_id=" + temp + ";", conn);
        conn.Open();
        update1.ExecuteNonQuery();
        conn.Close();

        LinkButton7.Visible = true;
        Label1.Visible = true;
        Image8.Visible = true;
        TextBox3.Visible = true;
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        if (GridView1.SelectedRow.Cells[2].Text == "cust")
        {
            fetch_user_info();
        }

        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();
        SqlCommand my_update = new SqlCommand("UPDATE msg_box SET msg_img='Images/msg_replied.jpg' WHERE msg_id='" + GridView1.SelectedDataKey.Value.ToString() + "';", conn);
        SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + GridView1.SelectedRow.Cells[1].Text + "','Images/msg_unchecked.jpg','admin','" + GridView1.SelectedRow.Cells[2].Text + "','inbox');", conn);
        SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + GridView1.SelectedRow.Cells[1].Text + "','Images/msg_checked.jpg','admin','" + GridView1.SelectedRow.Cells[2].Text + "','sent');", conn);
        my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox3.Text;
        my_insert.Parameters.Add("@subject", 100).Value = "Re: " + GridView1.SelectedRow.Cells[3].Text;
        my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox3.Text;
        my_insert2.Parameters.Add("@subject", 100).Value = "Re: " + GridView1.SelectedRow.Cells[3].Text;
        conn.Open();
        my_insert.ExecuteNonQuery();
        my_insert2.ExecuteNonQuery();
        my_update.ExecuteNonQuery();
        SqlCommand inc_msg_s = new SqlCommand("UPDATE eval_tab2 SET msg_sent=msg_sent+1 WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
        inc_msg_s.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();
        if (cust_profile[7] == '1' && GridView1.SelectedRow.Cells[2].Text == "cust")
        {
            email_class obje = new email_class();
            string email_msg = TextBox3.Text;
            int estatus = obje.send_email(email_add, "Customer Support Service: Message Reply", email_msg);
            if (estatus == 1)
            {
            }
            else if (estatus == 0)
            {
            }
        }
        TextBox3.Text = "";
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        if (GridView1.SelectedIndex != -1)
        {
            Session.Add("mail_session", GridView1.SelectedRow.Cells[1].Text);
            Response.Redirect("admin_compose.aspx?case=1");
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            TextBox TextBox1 = (TextBox)DataList11.Items[0].FindControl("TextBox1");
            Session.Add("txt_session", TextBox1.Text);
            Session.Add("type_session", GridView1.SelectedRow.Cells[2].Text);
            Session.Add("mail_session", "");
            Response.Redirect("admin_compose.aspx?case=2");
        }
        catch
        {
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        try
        {
            string temp = GridView1.SelectedDataKey.Value.ToString();
            SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
            SqlCommand delete1 = new SqlCommand("update msg_box set box_type='" + Session["user_session"].ToString() + "',box_type2='inbox' where msg_id=" + temp + ";", conn);
            conn.Open();
            delete1.ExecuteNonQuery();
            conn.Close();
        }
        catch
        {
        }
        GridView1.DataBind();
    }
}