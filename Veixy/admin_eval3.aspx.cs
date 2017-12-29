using System;
using System.Data;
using System.Data.SqlClient;

public partial class admin_eval3 : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource4.ID;
        GridView1.DataBind();
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource2.ID;
        GridView1.DataBind();
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource1.ID;
        GridView1.DataBind();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();
        string c1 = "";
        string c2 = "";
        string c3 = "";
        string c4 = "";
        string c5 = "";
        string c11 = "";
        string c22 = "";
        DataSet ds1 = new DataSet();
        DataSet ds2 = new DataSet();
        DataSet ds3 = new DataSet();
        DataSet ds4 = new DataSet();
        SqlDataAdapter da1 = new SqlDataAdapter("SELECT user_id,SUM(lock),((SUM(lock) - SUM(unlocks)) * 100)  AS Expr1 FROM eval_tab1 GROUP BY user_id", conn);
        da1.Fill(ds1);
        foreach (DataRow dr1 in ds1.Tables[0].Rows)
        {
            c1 = dr1[0].ToString();
            c11 = dr1[1].ToString();
            c2 = dr1[2].ToString();
            if (c2 != "0")
            {
                c2 = Convert.ToString(Convert.ToInt32(c2) / Convert.ToInt32(c11));
            }

            SqlDataAdapter da2 = new SqlDataAdapter("SELECT user_id, force_unheld*100, held AS Expr1 FROM eval_tab2 WHERE user_id ='" + c1 + "';", conn);
            da2.Fill(ds2);
            foreach (DataRow dr2 in ds2.Tables[0].Rows)
            {
                c22 = dr2[2].ToString();
                c3 = dr2[1].ToString();
                if (c3 != "0")
                {
                    c3 = Convert.ToString(Convert.ToInt32(c3) / Convert.ToInt32(c22));
                }
            }
            SqlDataAdapter da3 = new SqlDataAdapter("SELECT user_id, rec_made + rec_accept AS Expr1 FROM eval_tab2 WHERE user_id ='" + c1 + "';", conn);
            da3.Fill(ds3);
            foreach (DataRow dr3 in ds3.Tables[0].Rows)
            {
                c4 = dr3[1].ToString();
            }
            SqlDataAdapter da4 = new SqlDataAdapter("SELECT user_id, msg_sent FROM eval_tab2 WHERE user_id ='" + c1 + "';", conn);
            da4.Fill(ds4);
            foreach (DataRow dr4 in ds4.Tables[0].Rows)
            {
                c5 = dr4[1].ToString();
            }

            SqlCommand my_insert = new SqlCommand("INSERT INTO eval_tab4(user_id,rep_date,perf,dis_sat,t_work,interact) VALUES('" + c1 + "','" + my_time + "','" + c2 + "','" + c3 + "','" + c4 + "','" + c5 + "');", conn);
            conn.Open();
            my_insert.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "View Most Recent")
        {
            GridView1.DataSourceID = SqlDataSource4.ID;
            GridView1.DataBind();
        }
        else if (RadioButtonList1.SelectedItem.Text == "View Complete History")
        {
            GridView1.DataSourceID = SqlDataSource1.ID;
            GridView1.DataBind();
        }
    }
}