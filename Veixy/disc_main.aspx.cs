using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class disc_main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() != "")
        {
            ImageButton3.Visible = false;
            ImageButton4.Visible = false;
        }
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Attributes["onmouseover"] =
             "javascript:setMouseOverColor(this);";
        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackEventReference(this.GridView1, "Select$" + e.Row.RowIndex.ToString());
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("disc_threads.aspx?prod_id=" + GridView1.SelectedDataKey.Value.ToString() + "&prod_title=" + GridView1.SelectedRow.Cells[1].Text);
    }
}