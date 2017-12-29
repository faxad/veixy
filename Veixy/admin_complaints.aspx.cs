using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_accounts : System.Web.UI.Page
{
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
        if (DropDownList1.SelectedItem.Text == "--------")
        {
            GridView1.DataSourceID = SqlDataSource1.ID;
        }
        GridView1.DataBind();
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        string temp_id;
        temp_id = GridView1.SelectedValue.ToString();
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        SqlCommand my_update = new SqlCommand("UPDATE cust_complaints SET complaint_status='" + DropDownList2.SelectedValue.ToString() + "'WHERE complaint_no='" + temp_id + "';", conn);
        conn.Open();
        my_update.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource1.ID;
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource2.ID;
        GridView1.DataBind();
    }
}