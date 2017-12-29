using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class mobile_home : System.Web.UI.Page
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

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        Response.Redirect("mobile_inbox.aspx?ticket_id=" + GridView1.DataKeys[gvr.RowIndex].Value.ToString());
    }
}