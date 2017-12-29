using System;
using System.Data;
using System.Data.SqlClient;

public partial class sms_test : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void fetch_info()
    {
        string contact_no = "aaa";
        string email_add = "bbb";
        string cust_profile = "00000000";
        try
        {
            SqlDataAdapter my_select = new SqlDataAdapter("SELECT email_add,user_contact_no,cust_profile FROM user_info WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
            DataSet dss = new DataSet();
            my_select.Fill(dss);
            foreach (DataRow dr in dss.Tables[0].Rows)
            {
                email_add = dr[0].ToString();
                contact_no = dr[1].ToString();
                cust_profile = dr[2].ToString();
            }
        }
        catch
        {
            Response.Redirect("error_gpage.aspx?error_id=1259");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        sms_class objj = new sms_class();
        string num = "000000000";
        int status = objj.send_sms(num, "Testing 1,2,3..");
        if (status == 1)
        {
        }
        else if (status == 0)
        {
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Session.Add("user_session", TextBox1.Text);
    }
}