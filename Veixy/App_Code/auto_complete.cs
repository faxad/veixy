using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

/// <summary>
/// Summary description for auto_complete
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
//[System.Web.Services.WebService]
public class auto_complete : System.Web.Services.WebService
{
    SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
    public auto_complete()
    {
        //Uncomment the following line if using designed components
        //InitializeComponent();
    }

    [WebMethod]
    public string[] complete_webmethod(string prefixText)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT user_id FROM activ_users WHERE user_id LIKE '%" + prefixText + "%'", conn);
        da.Fill(ds);
        int i = 0;
        string[] items = new string[ds.Tables[0].Rows.Count];
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            items.SetValue(dr[0].ToString(), i);
            i++;
        }
        return items;
    }
}