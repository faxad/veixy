using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class disc_main : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() != "")
        {
            ImageButton3.Visible = false;
            ImageButton4.Visible = false;
        }
        Label1.Text = Request.QueryString[1].ToString();
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
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
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT started_by,start_date FROM thread_table WHERE thread_id='" + GridView1.SelectedDataKey.Value.ToString() + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            SqlCommand my_update = new SqlCommand("UPDATE thread_table SET views=views+1 WHERE thread_id='" + GridView1.SelectedDataKey.Value.ToString() + "';", conn);
            conn.Open();
            my_update.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("disc_post.aspx?thread_id=" + GridView1.SelectedDataKey.Value.ToString() + "&started_by=" + dr[0].ToString() + "&start_date=" + dr[1].ToString());
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("disc_create.aspx?prod_id=" + Request.QueryString["prod_id"].ToString());
    }
}