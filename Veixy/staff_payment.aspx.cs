using System;

public partial class staff_inbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
        if (!IsPostBack)
        {
            TextBox2.Text = System.DateTime.Now.ToShortDateString();
            TextBox1.Text = System.DateTime.Now.AddDays(-7).ToShortDateString();
        }
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "Payments Made")
        {
            GridView1.DataSourceID = SqlDataSource1.ID;
            GridView1.DataBind();
        }
        else if (RadioButtonList1.SelectedItem.Text == "Due Payments")
        {
            GridView1.DataSourceID = SqlDataSource2.ID;
            GridView1.DataBind();
        }
    }
}