using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_accounts : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Attributes["onmouseover"] =
                   "javascript:setMouseOverColor(this);";
        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackEventReference(this.GridView1, "Select$" + e.Row.RowIndex.ToString());
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text == "User Name")
        {
            GridView1.DataSourceID = SqlDataSource3.ID;
        }
        else if (DropDownList1.SelectedItem.Text == "Country")
        {
            GridView1.DataSourceID = SqlDataSource4.ID;
        }
        else if (DropDownList1.SelectedItem.Text == "Email Address")
        {
            GridView1.DataSourceID = SqlDataSource7.ID;
        }
        else if (DropDownList1.SelectedItem.Text == "First Name")
        {
            GridView1.DataSourceID = SqlDataSource5.ID;
        }
        else if (DropDownList1.SelectedItem.Text == "Last Name")
        {
            GridView1.DataSourceID = SqlDataSource6.ID;
        }
        GridView1.DataBind();
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        string temp = GridView1.SelectedDataKey.Value.ToString();
        LinkButton btn = (LinkButton)sender;
        FormView dli = (FormView)btn.NamingContainer;
        DropDownList DropDownList2 = (DropDownList)dli.FindControl("DropDownList2");
        if (DropDownList2.SelectedItem.Text != "Current Status")
        {
            SqlCommand my_insert = new SqlCommand("UPDATE user_info SET acc_status='" + DropDownList2.SelectedItem.Text + "' WHERE user_id='" + temp + "';", conn);
            conn.Open();
            my_insert.ExecuteNonQuery();
            conn.Close();
        }
        GridView1.SelectedIndex = -1;
        GridView1.DataBind();
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource1.ID;
        GridView1.DataBind();
    }
}