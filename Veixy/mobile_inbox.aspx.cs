using System;
using System.Data.SqlClient;

public partial class mobile_inbox : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("mobile_main.aspx");
        }
        Label3.Text = Session["user_session"].ToString();
        Label5.Text = Request.QueryString[0].ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            DateTime obj = new DateTime();
            obj = System.DateTime.Now;
            string my_time = obj.ToString();
            SqlCommand my_insert2 = new SqlCommand("INSERT INTO act_onbox(token_no,act_msg,msg_date,msg_from) VALUES(" + Label5.Text + ",@msg,'" + my_time + "','" + Session["user_session"].ToString() + "');", conn);
            my_insert2.Parameters.Add("@msg", 8000).Value = TextBox1.Text;
            conn.Open();
            my_insert2.ExecuteNonQuery();
            conn.Close();
            SqlCommand update9 = new SqlCommand("update cust_inbox set img_url2='Images/msg_unchecked.jpg' where token_no=" + Label5.Text + ";", conn);
            conn.Open();
            update9.ExecuteNonQuery();
            conn.Close();
            DataList1.DataBind();
            TextBox1.Text = "";
        }
    }
}