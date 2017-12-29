using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.WebControls;

public partial class cust_appoint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        DataListItem dli = (DataListItem)btn.NamingContainer;

        TextBox TextBox1 = (TextBox)dli.FindControl("TextBox1");
        TextBox TextBox2 = (TextBox)dli.FindControl("TextBox2");

        TextBox1.Visible = true;
        TextBox2.Visible = false;
    }

    protected void DataList1_ItemCreated(object sender, DataListItemEventArgs e)
    {
    }

    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        DataListItem dli = (DataListItem)btn.NamingContainer;

        TextBox TextBox1 = (TextBox)dli.FindControl("TextBox1");
        TextBox TextBox2 = (TextBox)dli.FindControl("TextBox2");

        TextBox1.Visible = false;
        TextBox2.Visible = true;
    }

    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        string temp_id;
        temp_id = GridView1.SelectedValue.ToString();
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT held_by FROM cust_inbox WHERE token_no='" + temp_id + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            if (dr[0].ToString() == "none")
            {
                SqlCommand my_update6 = new SqlCommand("UPDATE cust_inbox SET held_by='" + Session["user_session"].ToString() + "' WHERE token_no='" + temp_id + "';", conn);
                conn.Open();
                my_update6.ExecuteNonQuery();
            }
        }
        conn.Close();
        GridView1.DataBind();
        GridView1.SelectedIndex = -1;
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        DataListItem dli = (DataListItem)btn.NamingContainer;
        TextBox TextBox3 = (TextBox)dli.FindControl("TextBox3");
        TextBox TextBox1 = (TextBox)dli.FindControl("TextBox1");
        RadDateTimePicker RadDateTimePicker1 = (RadDateTimePicker)dli.FindControl("RadDateTimePicker1");

        CheckBox CheckBox1 = (CheckBox)dli.FindControl("CheckBox1");
        DropDownList DropDownList1 = (DropDownList)dli.FindControl("DropDownList1");
        string temp_id;
        temp_id = GridView1.SelectedValue.ToString();
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();
        SqlCommand my_update = new SqlCommand("UPDATE cust_appoint SET app_status='Closed' WHERE app_no='" + temp_id + "';", conn);
        conn.Open();
        if (CheckBox1.Checked == true)
        {
            my_update.ExecuteNonQuery();
        }
        if (TextBox1.ReadOnly == true)
        {
            TextBox1.Text = "";
        }
        if (RadDateTimePicker1.SelectedDate.ToString() == "")
        {
            SqlCommand my_update2 = new SqlCommand("UPDATE cust_appoint SET app_detail=app_detail+char(13)+'" + my_time + "\n" + "'+@msg_text WHERE app_no='" + temp_id + "';", conn);
            my_update2.Parameters.Add("@msg_text", 8000).Value = TextBox1.Text + "\n";
            my_update2.ExecuteNonQuery();
        }
        else
        {
            DateTime obj2 = new DateTime();
            SqlCommand my_update2 = new SqlCommand("UPDATE cust_appoint SET app_detail=app_detail+char(13)+'" + my_time + "\n" + "'+@msg_text,app_date='" + RadDateTimePicker1.SelectedDate.ToString() + "',app_status='Pendnig' WHERE app_no='" + temp_id + "';", conn);
            my_update2.Parameters.Add("@msg_text", 8000).Value = TextBox1.Text + "\n";
            my_update2.ExecuteNonQuery();
        }
        conn.Close();
        TextBox3.Text = "";
        DataList1.DataBind();
        GridView1.DataBind();
        GridView1.SelectedIndex = 0;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox TextBox1 = (TextBox)DataList1.Items[0].FindControl("TextBox1");
        TextBox TextBox2 = (TextBox)DataList1.Items[0].FindControl("TextBox2");

        TextBox1.Visible = true;
        TextBox2.Visible = false;
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        string temp_id;
        temp_id = GridView1.SelectedValue.ToString();
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        SqlCommand my_update = new SqlCommand("DELETE FROM cust_appoint WHERE app_no='" + temp_id + "';", conn);
        conn.Open();
        my_update.ExecuteNonQuery();
        conn.Close();
        DataList1.DataBind();
        GridView1.DataBind();
        GridView1.SelectedIndex = -1;
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Attributes["onmouseover"] =
    "javascript:setMouseOverColor(this);";
        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackEventReference(this.GridView1, "Select$" + e.Row.RowIndex.ToString());
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        TextBox TextBox1 = (TextBox)DataList2.Items[0].FindControl("TextBox1");
        TextBox1.Text = "";
        TextBox1.ReadOnly = false;
    }
}