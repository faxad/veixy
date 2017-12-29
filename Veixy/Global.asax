<%@ Application Language="C#" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
    }
    
    void Application_End(object sender, EventArgs e) 
    {
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
    }

    void Session_Start(object sender, EventArgs e) 
    {
        Session.Add("user_session", Session.SessionID);
        Session.Add("staff_time", Session.SessionID);
        Session.Add("txt_session", Session.SessionID);
        Session.Add("type_session", Session.SessionID);
        Session.Add("mail_session", Session.SessionID);
        Session.Add("temp", Session.SessionID);
        Session["user_session"] = "";
        Session["staff_time"] = "";
        Session["txt_session"] = "";
        Session["type_session"] = "";
        Session["mail_session"] = "";
        Session["temp"] = "";
        
    }

    void Session_End(object sender, EventArgs e) 
    {
        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();
        System.Data.SqlClient.SqlCommand my_insert = new System.Data.SqlClient.SqlCommand("UPDATE system_log SET logout_at='" + my_time + "' WHERE user_id='" + Session["user_session"].ToString() + "' AND login_at='" + Session["staff_time"].ToString() + "';", conn);
        System.Data.SqlClient.SqlCommand my_delete=new System.Data.SqlClient.SqlCommand("DELETE FROM activ_users WHERE user_id='"+Session["user_session"].ToString()+"';",conn);
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
    }
       
</script>
