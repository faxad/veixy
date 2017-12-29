using System;
using System.Data;
using System.Data.SqlClient;

public partial class admin_rep1 : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        Label7.Text = obj.ToString();

        string c1 = "";
        string c2 = "";
        string c3 = "";
        string c4 = "";
        string c5 = "";
        string c6 = "";
        DataSet ds1 = new DataSet();
        DataSet ds2 = new DataSet();
        DataSet ds3 = new DataSet();
        DataSet ds4 = new DataSet();
        DataSet ds5 = new DataSet();
        DataSet ds6 = new DataSet();
        SqlDataAdapter da1 = new SqlDataAdapter("SELECT COUNT(user_id) from activ_users WHERE user_type='staff'", conn);
        da1.Fill(ds1);
        foreach (DataRow dr1 in ds1.Tables[0].Rows)
        {
            c1 = dr1[0].ToString();
        }
        SqlDataAdapter da2 = new SqlDataAdapter("SELECT COUNT(user_id) from activ_users WHERE user_type='cust';", conn);
        da2.Fill(ds2);
        foreach (DataRow dr2 in ds2.Tables[0].Rows)
        {
            c2 = dr2[0].ToString();
        }
        SqlDataAdapter da3 = new SqlDataAdapter("SELECT COUNT(loc_sno) from staff_loc;", conn);
        da3.Fill(ds3);
        foreach (DataRow dr3 in ds3.Tables[0].Rows)
        {
            c3 = dr3[0].ToString();
        }
        SqlDataAdapter da4 = new SqlDataAdapter("SELECT COUNT(held_by) AS Expr1 FROM cust_inbox WHERE held_by <> 'none';", conn);
        da4.Fill(ds4);
        foreach (DataRow dr4 in ds4.Tables[0].Rows)
        {
            c4 = dr4[0].ToString();
        }
        SqlDataAdapter da5 = new SqlDataAdapter("SELECT COUNT(open_close) AS Expr1 FROM cust_inbox WHERE open_close ='O';", conn);
        da5.Fill(ds5);
        foreach (DataRow dr5 in ds5.Tables[0].Rows)
        {
            c5 = dr5[0].ToString();
        }
        SqlDataAdapter da6 = new SqlDataAdapter("SELECT COUNT(app_status) AS Expr1 FROM cust_appoint WHERE app_status='Pending';", conn);
        da6.Fill(ds6);
        foreach (DataRow dr6 in ds6.Tables[0].Rows)
        {
            c6 = dr6[0].ToString();
        }
        Label1.Text = c1;
        Label2.Text = c2;
        Label3.Text = c3;
        Label4.Text = c4;
        Label5.Text = c5;
        Label6.Text = c6;
    }
}