using System;
using System.Data;
using System.Data.SqlClient;

public partial class cust_settings : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
    private string cust_profile = "00000000";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
        try
        {
            SqlDataAdapter my_select = new SqlDataAdapter("SELECT cust_profile FROM user_info WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
            DataSet dss = new DataSet();
            my_select.Fill(dss);
            foreach (DataRow dr in dss.Tables[0].Rows)
            {
                cust_profile = dr[0].ToString();
            }
        }
        catch
        {
        }
        if (!IsPostBack)
        {
            if (cust_profile[0] == '1')
            {
                CheckBox1.Checked = true;
            }
            else
            {
                CheckBox1.Checked = false;
            }
            if (cust_profile[1] == '1')
            {
                CheckBox2.Checked = true;
            }
            else
            {
                CheckBox2.Checked = false;
            }
            if (cust_profile[2] == '1')
            {
                CheckBox3.Checked = true;
            }
            else
            {
                CheckBox3.Checked = false;
            }
            if (cust_profile[3] == '1')
            {
                CheckBox4.Checked = true;
            }
            else
            {
                CheckBox4.Checked = false;
            }
            if (cust_profile[4] == '1')
            {
                CheckBox5.Checked = true;
            }
            else
            {
                CheckBox5.Checked = false;
            }
            if (cust_profile[5] == '1')
            {
                CheckBox6.Checked = true;
            }
            else
            {
                CheckBox6.Checked = false;
            }
            if (cust_profile[6] == '1')
            {
                CheckBox7.Checked = true;
            }
            else
            {
                CheckBox7.Checked = false;
            }
            if (cust_profile[7] == '1')
            {
                CheckBox8.Checked = true;
            }
            else
            {
                CheckBox8.Checked = false;
            }
        }
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Label13.Visible = true;
    }

    protected void LinkButton17_Click(object sender, EventArgs e)
    {
        Label13.Visible = true;
        char[] profile_code = new char[8];
        if (CheckBox1.Checked == true)
        {
            profile_code[0] = '1';
        }
        else
        {
            profile_code[0] = '0';
        }
        if (CheckBox2.Checked == true)
        {
            profile_code[1] = '1';
        }
        else
        {
            profile_code[1] = '0';
        }
        if (CheckBox3.Checked == true)
        {
            profile_code[2] = '1';
        }
        else
        {
            profile_code[2] = '0';
        }
        if (CheckBox4.Checked == true)
        {
            profile_code[3] = '1';
        }
        else
        {
            profile_code[3] = '0';
        }
        if (CheckBox5.Checked == true)
        {
            profile_code[4] = '1';
        }
        else
        {
            profile_code[4] = '0';
        }
        if (CheckBox6.Checked == true)
        {
            profile_code[5] = '1';
        }
        else
        {
            profile_code[5] = '0';
        }
        if (CheckBox7.Checked == true)
        {
            profile_code[6] = '1';
        }
        else
        {
            profile_code[6] = '0';
        }
        if (CheckBox8.Checked == true)
        {
            profile_code[7] = '1';
        }
        else
        {
            profile_code[7] = '0';
        }
        string s = new string(profile_code);
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        SqlCommand my_update = new SqlCommand("UPDATE user_info SET cust_profile='" + s.ToString() + "' WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update.ExecuteNonQuery();
        conn.Close();
    }
}