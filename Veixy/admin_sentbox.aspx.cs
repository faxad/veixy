using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_reg_pending : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
            SqlCommand delete1 = new SqlCommand("update msg_box set box_type='" + Session["user_session"].ToString() + "',box_type2='sent' where msg_id=" + temp + ";", conn);
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