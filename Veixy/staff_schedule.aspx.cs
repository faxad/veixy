using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.WebControls;

public partial class staff_schedule : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime obj = new DateTime();
        obj = System.DateTime.Today;
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
        Panel2.Visible = false;
        if (RadCalendar3.SelectedDates.Count == 0)
        {
            DateTime obj2 = new DateTime();
            obj2 = System.DateTime.Today;
            string my_time2 = obj.ToString();
            Label2.Text = my_time2;
            Label8.Text = obj2.AddDays(7).ToString();
            GridView1.DataBind();
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Attributes["onmouseover"] =
                   "javascript:setMouseOverColor(this);";
        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackEventReference(this.GridView1, "Select$" + e.Row.RowIndex.ToString());
        Panel2.Visible = false;
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        FormView dli = (FormView)btn.NamingContainer;
        TextBox email_addTextBox = (TextBox)dli.FindControl("email_addTextBox");
        TextBox user_passTextBox = (TextBox)FormView1.FindControl("user_passTextBox");
        if (user_passTextBox.Text == Session["user_session"].ToString())
        {
            email_addTextBox.ReadOnly = false;
            email_addTextBox.Text = " ";
        }
        else
        {
            email_addTextBox.ReadOnly = true;
        }
    }

    protected void LinkButton14_Click(object sender, EventArgs e)
    {
        SqlCommand my_insert = new SqlCommand("INSERT INTO staff_schedule(staff_id,date,priority,status,task_detail,scheduled_by) VALUES('" + DropDownList2.SelectedItem.Text + "','" + RadDateTimePicker1.SelectedDate.Value.ToString() + "','" + DropDownList3.SelectedItem.Text + "','Not Done','" + TextBox3.Text + "\n" + "','" + Session["user_session"] + "');", conn);
        conn.Open();
        my_insert.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();
        FormView1.Visible = true;
    }

    protected void LinkButton22_Click(object sender, EventArgs e)
    {
        FormView1.Visible = true;
        Panel2.Visible = false;
        if (RadCalendar3.SelectedDates.Count == 0)
        {
            DateTime obj = new DateTime();
            obj = System.DateTime.Now;
            DateTime obj2 = new DateTime();
            obj2 = System.DateTime.Now;
            string my_time2 = obj.ToString();
            Label2.Text = my_time2;
            Label8.Text = obj2.AddDays(7).ToString();
            GridView1.DataBind();
        }
        else
        {
            Label2.Text = RadCalendar3.SelectedDates[0].Date.ToString();
            Label8.Text = RadCalendar3.SelectedDates[RadCalendar3.SelectedDates.Count - 1].Date.ToString();
            GridView1.DataBind();
        }
    }

    protected void LinkButton15_Click(object sender, EventArgs e)
    {
        string my_time2 = System.DateTime.Now.ToString();
        LinkButton btn = (LinkButton)sender;
        FormView dli = (FormView)btn.NamingContainer;
        Label user_idLabel1 = (Label)dli.FindControl("user_idLabel1");
        Label Label12 = (Label)dli.FindControl("Label12");
        TextBox email_addTextBox = (TextBox)dli.FindControl("email_addTextBox");
        TextBox user_contact_noTextBox = (TextBox)dli.FindControl("user_contact_noTextBox");
        DropDownList DropDownList11 = (DropDownList)dli.FindControl("DropDownList11");
        DropDownList DropDownList33 = (DropDownList)dli.FindControl("DropDownList33");
        RadDateTimePicker RadDateTimePicker2 = (RadDateTimePicker)dli.FindControl("RadDateTimePicker2");
        if (RadDateTimePicker2.IsEmpty == false)
        {
            DateTime obj2 = new DateTime();
            SqlCommand my_update = new SqlCommand("UPDATE staff_schedule SET date='" + RadDateTimePicker2.SelectedDate.Value.ToString() + "',priority='" + DropDownList33.SelectedItem.Text + "',status='" + DropDownList11.SelectedItem.Text + "' WHERE schedule_id='" + user_idLabel1.Text + "';", conn);
            conn.Open();
            if (email_addTextBox.ReadOnly == false)
            {
                SqlCommand my_update2 = new SqlCommand("UPDATE staff_schedule SET task_detail=task_detail+char(13)+'" + my_time2 + "'+@comment", conn);
                my_update2.Parameters.Add("@comment", 5000).Value = "\n" + email_addTextBox.Text + "\n";
                my_update2.ExecuteNonQuery();
            }
            if (user_contact_noTextBox.ReadOnly == false)
            {
                SqlCommand my_update3 = new SqlCommand("UPDATE staff_schedule SET staff_comments=staff_comments+char(13)+'" + my_time2 + "'+@comment", conn);
                my_update3.Parameters.Add("@comment", 5000).Value = "\n" + user_contact_noTextBox.Text + "\n";
                my_update3.ExecuteNonQuery();
            }
            my_update.ExecuteNonQuery();
            conn.Close();
        }
        else
        {
            DateTime obj2 = new DateTime();
            SqlCommand my_update = new SqlCommand("UPDATE staff_schedule SET priority='" + DropDownList33.SelectedItem.Text + "',status='" + DropDownList11.SelectedItem.Text + "' WHERE schedule_id='" + user_idLabel1.Text + "';", conn);
            conn.Open();
            if (email_addTextBox.ReadOnly == false)
            {
                SqlCommand my_update2 = new SqlCommand("UPDATE staff_schedule SET task_detail=task_detail+char(13)+'" + my_time2 + "'+@comment", conn);
                my_update2.Parameters.Add("@comment", 5000).Value = "\n" + email_addTextBox.Text + "\n";
                my_update2.ExecuteNonQuery();
            }
            if (user_contact_noTextBox.ReadOnly == false)
            {
                SqlCommand my_update3 = new SqlCommand("UPDATE staff_schedule SET staff_comments=staff_comments+char(13)+'" + my_time2 + "'+@comment", conn);
                my_update3.Parameters.Add("@comment", 5000).Value = "\n" + user_contact_noTextBox.Text + "\n";
                my_update3.ExecuteNonQuery();
            }
            my_update.ExecuteNonQuery();
            conn.Close();
        }
        GridView1.DataBind();
        GridView1.SelectedIndex = -1;
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        DropDownList1.SelectedIndex = 0;
        GridView1.DataSourceID = SqlDataSource1.ID;
        GridView1.DataBind();
    }

    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource1.ID;
        GridView1.DataBind();
    }

    protected void LinkButton12_Click1(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource3.ID;
        GridView1.DataBind();
    }

    protected void LinkButton32_Click(object sender, EventArgs e)
    {
        RadCalendar3.SelectedDates.RemoveRange(0, RadCalendar3.SelectedDates.Count);
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();
        Label2.Text = my_time;
        Label8.Text = obj.AddDays(7).ToString();
        GridView1.DataBind();
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        FormView1.Visible = false;
        Panel2.Visible = true;
    }

    protected void LinkButton33_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        FormView dli = (FormView)btn.NamingContainer;
        TextBox user_contact_noTextBox = (TextBox)dli.FindControl("user_contact_noTextBox");
        user_contact_noTextBox.ReadOnly = false;
        user_contact_noTextBox.Text = " ";
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        FormView1.Visible = true;
        Panel2.Visible = false;
    }
}