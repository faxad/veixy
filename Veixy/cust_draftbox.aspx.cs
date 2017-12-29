using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cust_draftbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
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
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            TextBox TextBox1 = (TextBox)DataList11.Items[0].FindControl("TextBox1");
            Session.Add("txt_session", TextBox1.Text);
            Session.Add("type_session", GridView1.SelectedRow.Cells[2].Text);
            Session.Add("mail_session", "");
            Response.Redirect("cust_mcompose.aspx");
        }
        catch
        {
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        string temp = GridView1.SelectedDataKey.Value.ToString();
        string t_date = " ";
        string t_from = " ";
        string t_to = " ";
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT msg_from,msg_to,msg_date FROM msg_box WHERE msg_id='" + temp + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            t_from = dr[0].ToString();
            t_to = dr[1].ToString();
            t_date = dr[2].ToString();
        }
        try
        {
            SqlCommand delete1 = new SqlCommand("delete from msg_box where msg_id=" + temp + ";", conn);
            SqlCommand delete2 = new SqlCommand("delete from msg_box where msg_from='" + t_from + "' AND msg_to='" + t_to + "' AND msg_date='" + t_date + "' AND box_type='none';", conn);
            conn.Open();
            delete1.ExecuteNonQuery();
            delete2.ExecuteNonQuery();
            conn.Close();
        }
        catch
        {
        }
        GridView1.DataBind();
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();

        string t_date = " ";
        string t_from = " ";
        string t_to = " ";
        LinkButton btn = (LinkButton)sender;
        DataListItem dli = (DataListItem)btn.NamingContainer;
        TextBox TextBox1 = (TextBox)dli.FindControl("TextBox1");
        string temp = GridView1.SelectedDataKey.Value.ToString();
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT msg_from,msg_to,msg_date FROM msg_box WHERE msg_id='" + temp + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            t_from = dr[0].ToString();
            t_to = dr[1].ToString();
            t_date = dr[2].ToString();
        }
        SqlCommand delete1 = new SqlCommand("update msg_box set box_type='sent',msg_date='" + my_time + "',msg_text=@msg_text where msg_id='" + temp + "';", conn);
        SqlCommand delete2 = new SqlCommand("update msg_box set box_type='inbox',msg_date='" + my_time + "',msg_text=@msg_text where msg_from='" + t_from + "' AND msg_to='" + t_to + "' AND msg_date='" + t_date + "' AND box_type='none';", conn);
        delete1.Parameters.Add("@msg_text", 8000).Value = TextBox1.Text;
        delete2.Parameters.Add("@msg_text", 8000).Value = TextBox1.Text;
        conn.Open();
        delete1.ExecuteNonQuery();
        delete2.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();
    }
}