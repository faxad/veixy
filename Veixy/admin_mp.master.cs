using System;
using System.Data;
using System.Data.SqlClient;

public partial class staff_mp : System.Web.UI.MasterPage
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        string c1 = "";
        string c2 = "";
        Label2.Text = System.DateTime.Now.ToShortDateString();
        DataSet ds1 = new DataSet();
        DataSet ds22 = new DataSet();
        string staff_count = "0";
        string cust_count = "0";
        SqlDataAdapter da1 = new SqlDataAdapter("SELECT COUNT(user_id) from activ_users WHERE user_type='staff'", conn);
        da1.Fill(ds1);
        foreach (DataRow dr1 in ds1.Tables[0].Rows)
        {
            c1 = dr1[0].ToString();
        }
        SqlDataAdapter da22 = new SqlDataAdapter("SELECT COUNT(user_id) from activ_users WHERE user_type='cust';", conn);
        da22.Fill(ds22);
        foreach (DataRow dr22 in ds22.Tables[0].Rows)
        {
            c2 = dr22[0].ToString();
        }

        DataSet ds2 = new DataSet();
        DataSet ds3 = new DataSet();
        SqlDataAdapter da2 = new SqlDataAdapter("SELECT COUNT(user_id) FROM activ_users WHERE user_type='staff';", conn);
        da2.Fill(ds2);
        foreach (DataRow dr2 in ds2.Tables[0].Rows)
        {
        }
        SqlDataAdapter da3 = new SqlDataAdapter("SELECT COUNT(user_id) FROM activ_users WHERE user_type='staff';", conn);
        da3.Fill(ds3);
        foreach (DataRow dr3 in ds3.Tables[0].Rows)
        {
        }
        Label6.Text = c2;
        Label7.Text = c1;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();
        System.Data.SqlClient.SqlCommand my_insert = new System.Data.SqlClient.SqlCommand("UPDATE system_log SET logout_at='" + my_time + "' WHERE user_id='" + Session["user_session"].ToString() + "' AND login_at='" + Session["staff_time"].ToString() + "';", conn);
        System.Data.SqlClient.SqlCommand my_delete = new System.Data.SqlClient.SqlCommand("DELETE FROM activ_users WHERE user_id='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_insert.ExecuteNonQuery();
        my_delete.ExecuteNonQuery();
        conn.Close();

        System.Data.DataSet ds0 = new System.Data.DataSet();
        int x = 0;
        System.Data.SqlClient.SqlDataAdapter da0 = new System.Data.SqlClient.SqlDataAdapter("SELECT COUNT(loc_by) FROM staff_loc WHERE loc_by='" + Session["user_session"].ToString() + "'", conn);
        da0.Fill(ds0);
        foreach (System.Data.DataRow dr0 in ds0.Tables[0].Rows)
        {
            string temp = dr0[0].ToString();
            x = Convert.ToInt32(temp);
        }

        System.Data.SqlClient.SqlCommand my_delete2 = new System.Data.SqlClient.SqlCommand("DELETE FROM staff_loc WHERE loc_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_delete2.ExecuteNonQuery();
        conn.Close();

        System.Data.SqlClient.SqlCommand my_update1 = new System.Data.SqlClient.SqlCommand("UPDATE cust_inbox SET lock_by='none' WHERE lock_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update1.ExecuteNonQuery();
        conn.Close();

        System.Data.SqlClient.SqlCommand my_update2 = new System.Data.SqlClient.SqlCommand("UPDATE my_calls SET lock_by='none' WHERE lock_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update2.ExecuteNonQuery();
        conn.Close();

        System.Data.SqlClient.SqlCommand my_update3 = new System.Data.SqlClient.SqlCommand("UPDATE cust_appoint SET lock_by='none' WHERE lock_by='" + Session["user_session"].ToString() + "';", conn);
        conn.Open();
        my_update3.ExecuteNonQuery();
        conn.Close();

        System.Data.SqlClient.SqlCommand inc_unlock = new System.Data.SqlClient.SqlCommand("UPDATE eval_tab1 SET unlocks=unlocks+" + x + " WHERE user_id='" + Session["user_session"].ToString() + "' AND user_login='" + Session["staff_time"].ToString() + "';", conn);
        conn.Open();
        inc_unlock.ExecuteNonQuery();
        conn.Close();
        Session["user_session"] = "";
        Session["staff_time"] = "";
        Session["txt_session"] = "";
        Session["type_session"] = "";
        Session["mail_session"] = "";
        Session["temp"] = "";
        Session.Abandon();
        Response.Redirect("user_login.aspx");
    }
}