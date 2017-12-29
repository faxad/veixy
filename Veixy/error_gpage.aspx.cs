using System;

public partial class error_gpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label4.Text = Request.QueryString[0].ToString();
    }
}