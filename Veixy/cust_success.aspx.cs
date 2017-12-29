using System;

public partial class cust_success : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Request.QueryString[2].ToString();
        if (Request.QueryString[0].ToString() == "1")
        {
            Label2.Text = "Sent";
        }
        else
        {
            Label2.Text = "Not Sent";
        }

        if (Request.QueryString[1].ToString() == "1")
        {
            Label3.Text = "Sent";
        }
        else
        {
            Label3.Text = "Not Sent";
        }
    }
}