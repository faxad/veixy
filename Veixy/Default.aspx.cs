using System;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["mail_session"].ToString() == "cust")
        {
            RadioButtonList1.SelectedIndex = 0;
        }
        else if (Session["mail_session"].ToString() == "staff")
        {
            RadioButtonList1.SelectedIndex = 3;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Session.Add("mail_session", "staff");
        if (Session["mail_session"].ToString() == "cust")
        {
            RadioButtonList1.SelectedIndex = 0;
        }
        else if (Session["mail_session"].ToString() == "staff")
        {
            RadioButtonList1.SelectedIndex = 3;
        }
        Response.Redirect("Default.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Label1.Text = RadCalendar1.SelectedDates[0].Date.ToString();

        Label2.Text = RadCalendar1.SelectedDates[6].Date.ToString();
    }
}