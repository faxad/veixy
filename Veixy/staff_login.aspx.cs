using System;
using System.Data;
using System.Data.SqlClient;

public partial class staff_login : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void LinkButton14_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT staff_id, staff_pass FROM staff_info WHERE staff_id='" + TextBox1.Text + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            if (dr[0].ToString() == TextBox1.Text && dr[1].ToString() == TextBox2.Text)
            {
                Session.Add("user_session", dr[0].ToString());
                Response.Redirect("staff_inbox.aspx");
            }
            else
            {
                statuss.Text = "Invalid Staff Details";
                break;
            }
        }
        statuss.Text = "Invalid Staff Details";
    }
}