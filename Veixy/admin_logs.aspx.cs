using System;

public partial class admin_logs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource2.ID;
        GridView1.DataBind();
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource1.ID;
        GridView1.DataBind();
    }
}