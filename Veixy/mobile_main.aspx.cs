using System;
using System.Data;
using System.Data.SqlClient;

public partial class mobile_main : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["user_session"] = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT user_id,user_pass,acc_status from user_info WHERE user_id='" + TextBox1.Text + "';", conn);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                if (dr[0].ToString() == TextBox1.Text && dr[1].ToString() == TextBox2.Text && dr[2].ToString() == "Activated")
                {
                    Session["user_session"] = dr[0].ToString();
                    Response.Redirect("mobile_home.aspx");
                }
                else
                {
                    statuss.Text = "Invalid Customer Details";
                    break;
                }
            }
        }
        statuss.Text = "Invalid Customer Details";
        statuss.Visible = true;
    }
}