using System;
using System.Data;
using System.Data.SqlClient;

public partial class admin_main : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds1 = new DataSet();
        SqlDataAdapter da1 = new SqlDataAdapter("SELECT COUNT(to_type) FROM msg_box WHERE to_type='admin' AND msg_img='Images/msg_unchecked.jpg' AND box_type='inbox'", conn);
        da1.Fill(ds1);
        foreach (DataRow dr1 in ds1.Tables[0].Rows)
        {
            Label12.Text = dr1[0].ToString() + " Unread Message(s)";
        }
    }

    protected void LinkButton22_Click(object sender, EventArgs e)
    {
    }

    protected void LinkButton23_Click(object sender, EventArgs e)
    {
        Response.Redirect("staff_inbox.aspx");
    }

    protected void LinkButton15_Click(object sender, EventArgs e)
    {
    }
}