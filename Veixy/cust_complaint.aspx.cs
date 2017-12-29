using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class cust_complaint : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            SqlCommand my_insert = new SqlCommand("INSERT INTO cust_complaints(sender_name,send_date,complaint_txt,complaint_status) VALUES('" + Session["user_session"].ToString() + "','" + System.DateTime.Now.ToString() + "',@msg,'Pending');", conn);
            my_insert.Parameters.Add("@msg", 8000).Value = TextBox2.Text;
            conn.Open();
            my_insert.ExecuteNonQuery();
            conn.Close();
            status_label.Text = "Complaint Registered";
        }
        catch
        {
            status_label.Text = "Complaint Registration Failed";
        }
    }
}