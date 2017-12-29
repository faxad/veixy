using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cust_products : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Attributes["onmouseover"] =
                        "javascript:setMouseOverColor(this);";
        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackEventReference(this.GridView1, "Select$" + e.Row.RowIndex.ToString());
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();
        try
        {
            SqlCommand my_update = new SqlCommand("UPDATE my_product SET comments=comments+char(13)+ '" + my_time + "\n" + "'+@msg WHERE prod_sno='" + GridView1.SelectedDataKey.Value.ToString() + "'AND user_name='" + Session["user_session"].ToString() + "';", conn);
            my_update.Parameters.Add("@msg", 8000).Value = TextBox1.Text + "\n";
            conn.Open();
            my_update.ExecuteNonQuery();
            conn.Close();
        }
        catch
        {
            Response.Redirect("error_gpage.aspx?error_id=1328");
        }
        Label1.Visible = true;
        Label1.Text = "Your comments have been added. Thank You for your comments.";
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Visible = false;
    }

    protected void LinkButton_tkt_Click(object sender, EventArgs e)
    {
        SqlCommand my_update = new SqlCommand("UPDATE my_product SET rating='" + DropDownList1.SelectedItem.Value + "' WHERE user_name='" + Session["user_session"].ToString() + "' AND prod_sno='" + GridView1.SelectedDataKey.Value.ToString() + "';", conn);
        conn.Open();
        my_update.ExecuteNonQuery();
        conn.Close();
    }
}