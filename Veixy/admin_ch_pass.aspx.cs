using System;
using System.Data;
using System.Data.SqlClient;

public partial class admin_ch_pass : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
    }

    protected void LinkButton14_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT admin_id, admin_pas,reset_code FROM admin_pass WHERE admin_id='" + Session["user_session"].ToString() + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            if (dr[1].ToString() == TextBox1.Text && dr[2].ToString() == TextBox2.Text)
            {
                if (TextBox3.Text == TextBox4.Text)
                {
                    SqlCommand my_upate = new SqlCommand("UPDATE admin_pass SET admin_pas='" + TextBox3.Text + "';", conn);
                    conn.Open();
                    my_upate.ExecuteNonQuery();
                    conn.Close();
                }
                else
                {
                    statuss.Text = "Password Match Error";
                    break;
                }
            }
            else
            {
                statuss.Text = "Invalid Password Or Reset Code";
                break;
            }
        }
    }
}