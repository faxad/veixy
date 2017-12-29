using System;
using System.Data;
using System.Data.SqlClient;

public partial class admin_login : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void LinkButton14_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT admin_id, admin_pas FROM admin_pass WHERE admin_id='" + TextBox1.Text + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            if (dr[0].ToString() == TextBox1.Text && dr[1].ToString() == TextBox2.Text)
            {
                Session.Add("user_session", dr[0].ToString());
                Response.Redirect("admin_main.aspx");
            }
            else
            {
                statuss.Text = "Invalid Administrator Details";
                break;
            }
        }
        statuss.Text = "Invalid Administrator Details";
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
    }
}