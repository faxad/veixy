using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cust_track : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
        if (Page.IsPostBack)
        {
            Label open_closeLabel = (Label)FormView1.FindControl("open_closeLabel");
            Label Label2 = (Label)FormView1.FindControl("Label2");
            if (open_closeLabel.Text != "0" && open_closeLabel.Text != "C")
            {
                Label4.Visible = true;
            }
            else
            {
                Label4.Visible = false;
            }
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            DataList1.DataBind();
            FormView1.DataBind();
        }
        catch (FormatException fxb)
        {
            TextBox1.Text = "Invalid Ticket" + fxb.ToString();
        }
    }

    protected void DataList2_ItemCreated(object sender, DataListItemEventArgs e)
    {
    }

    protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
    {
    }

    protected void DataList2_DataBinding(object sender, EventArgs e)
    {
    }

    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        Label open_closeLabel = (Label)FormView1.FindControl("open_closeLabel");
        Label Label2 = (Label)FormView1.FindControl("Label2");
        if (open_closeLabel.Text == "O")
        {
            Label2.Text = "Open";
            Label2.Visible = true;
            Label4.Visible = false;
        }
        else if (open_closeLabel.Text == "C")
        {
            Label2.Text = "Close";
            Label2.Visible = true;
            Label4.Visible = false;
        }
    }
}