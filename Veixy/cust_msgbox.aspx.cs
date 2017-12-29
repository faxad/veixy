using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cust_msgbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
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
        if (GridView1.SelectedRow.Cells[0].Text != "Images/msg_replied.jpg")
        {
            SqlCommand update1 = new SqlCommand("update msg_box set msg_img='Images/msg_checked.jpg' where msg_id=" + temp + ";", conn);
            conn.Open();
            update1.ExecuteNonQuery();
            conn.Close();
        }
        LinkButton7.Visible = true;
        Label1.Visible = true;
        Image8.Visible = true;
        TextBox3.Visible = true;
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();
        SqlCommand my_update = new SqlCommand("UPDATE msg_box SET msg_img='Images/msg_replied.jpg' WHERE msg_id='" + GridView1.SelectedDataKey.Value.ToString() + "';", conn);
        SqlCommand my_insert = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + GridView1.SelectedRow.Cells[1].Text + "','Images/msg_unchecked.jpg','staff','" + GridView1.SelectedRow.Cells[2].Text + "','inbox');", conn);
        SqlCommand my_insert2 = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('" + Session["user_session"].ToString() + "','" + my_time + "',@subject,@msg_text,'" + GridView1.SelectedRow.Cells[1].Text + "','Images/msg_checked.jpg','staff','" + GridView1.SelectedRow.Cells[2].Text + "','sent');", conn);
        my_insert.Parameters.Add("@msg_text", 8000).Value = TextBox3.Text;
        my_insert.Parameters.Add("@subject", 100).Value = "Re: " + GridView1.SelectedRow.Cells[3].Text;
        my_insert2.Parameters.Add("@msg_text", 8000).Value = TextBox3.Text;
        my_insert2.Parameters.Add("@subject", 100).Value = "Re: " + GridView1.SelectedRow.Cells[3].Text;
        conn.Open();
        my_insert.ExecuteNonQuery();
        my_insert2.ExecuteNonQuery();
        my_update.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();
        TextBox3.Text = "";
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        if (GridView1.SelectedIndex != -1)
        {
            Session.Add("mail_session", GridView1.SelectedRow.Cells[1].Text);
            Response.Redirect("cust_mcompose.aspx?case=1");
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
            Response.Redirect("cust_mcompose.aspx?case=2");
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