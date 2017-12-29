using System;
using System.Data.SqlClient;

public partial class admin_eval2 : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource1.ID;
        GridView1.DataBind();
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource2.ID;
        GridView1.DataBind();
    }
}