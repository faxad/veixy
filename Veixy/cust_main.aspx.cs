using System;
using System.Web.UI.WebControls;

public partial class cust_main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label Labell = (Label)this.Master.FindControl("Label1");
        Labell.Text = Session["user_session"].ToString();
    }
}