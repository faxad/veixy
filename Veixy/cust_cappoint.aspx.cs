using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

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
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        SqlCommand my_insert = new SqlCommand("INSERT INTO cust_appoint(user_name,app_date,app_detail,contact_no,app_status,lock_by) VALUES('" + Session["user_session"].ToString() + "','" + RadDateTimePicker1.SelectedDate.ToString() + "',@detail,'" + TextBox2.Text + "','" + DropDownList1.SelectedItem.Text + "','none');", conn);
        my_insert.Parameters.Add("@detail", 5000).Value = TextBox1.Text + "\n";
        conn.Open();
        my_insert.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("cust_appoint.aspx");
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
    }
}