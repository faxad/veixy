using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class staff_msgbox : System.Web.UI.Page
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

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        try
        {
            string temp = GridView1.SelectedDataKey.Value.ToString();
            SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
            SqlCommand delete1 = new SqlCommand("update msg_box set box_type=box_type2 where msg_id=" + temp + ";", conn);
            conn.Open();
            delete1.ExecuteNonQuery();
            conn.Close();
        }
        catch
        {
        }
        GridView1.DataBind();
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
            SqlCommand delete1 = new SqlCommand("DELETE FROM msg_box WHERE (msg_from='" + Session["user_session"].ToString() + "' OR msg_to='" + Session["user_session"].ToString() + "') AND box_type='deleted';", conn);
            conn.Open();
            delete1.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }
        catch
        {
        }
        GridView1.DataBind();
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        try
        {
            string temp = GridView1.SelectedDataKey.Value.ToString();
            SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
            SqlCommand delete1 = new SqlCommand("DELETE FROM msg_box WHERE msg_id=" + temp + ";", conn);
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