using System;
using System.Data;

public partial class main_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        ds.ReadXml(Server.MapPath("country_list.xml"));
        DataView dv = ds.Tables["ISO_3166-1_Entry"].DefaultView;
        DropDownList1.DataSource = dv;
        DropDownList1.DataTextField = "ISO_3166-1_Country_name";
        DropDownList1.DataBind();
    }
}