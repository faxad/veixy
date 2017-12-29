using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cust_sentbox : System.Web.UI.Page
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