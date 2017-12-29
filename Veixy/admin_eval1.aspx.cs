using System;
using System.Data;
using System.Data.SqlClient;

public partial class admin_eval1 : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime obj = new DateTime();
        obj = System.DateTime.Now;
        string my_time = obj.ToString();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string c1 = "";
        string c2 = "";
        string c3 = "";
        string c4 = "";
        string c5 = "";
        DataSet ds1 = new DataSet();
        DataSet ds2 = new DataSet();
        DataSet ds3 = new DataSet();
        if (RadioButtonList1.SelectedItem.Text == "Over All View")
        {
            SqlDataAdapter da1 = new SqlDataAdapter("SELECT user_id,SUM(lock) AS exp1,SUM(unlocks) AS exp2 FROM eval_tab1 GROUP BY user_id", conn);
            da1.Fill(ds1);
            foreach (DataRow dr1 in ds1.Tables[0].Rows)
            {
                c1 = dr1[0].ToString();
                c2 = dr1[1].ToString();
                c3 = dr1[2].ToString();
                DateTime obj2 = new DateTime();
                obj2 = System.DateTime.Now;
                string my_time2 = obj2.ToString();
                SqlDataAdapter da2 = new SqlDataAdapter("SELECT COUNT(ans_by) AS expr3 FROM  my_calls WHERE  ans_by = '" + c1 + "'", conn);
                da2.Fill(ds2);
                foreach (DataRow dr2 in ds2.Tables[0].Rows)
                {
                    c4 = dr2[0].ToString();
                }
                SqlDataAdapter da3 = new SqlDataAdapter("SELECT COUNT(schedule_id) AS Expr1 FROM staff_schedule WHERE staff_id='" + c1 + "';", conn);
                da3.Fill(ds3);
                foreach (DataRow dr3 in ds3.Tables[0].Rows)
                {
                    c5 = dr3[0].ToString();
                }

                SqlCommand my_insert = new SqlCommand("INSERT INTO eval_tab3(user_id,report_date,lock_count,unlock_count,calls_ans,schedule) VALUES('" + c1 + "','" + my_time2 + "','" + c2 + "','" + c3 + "','" + c4 + "','" + c5 + "');", conn);
                conn.Open();
                my_insert.ExecuteNonQuery();
                conn.Close();
                GridView1.DataBind();
            }
        }
        else if (RadioButtonList1.SelectedItem.Text == "Time Based View")
        {
            SqlDataAdapter da1 = new SqlDataAdapter("SELECT user_id,SUM(lock) AS exp1,SUM(unlocks) AS exp2 FROM eval_tab1 WHERE user_login>='" + RadDateTimePicker1.SelectedDate.Value.ToString() + "' AND user_login<='" + RadDateTimePicker2.SelectedDate.Value.ToString() + "' GROUP BY user_id", conn);
            da1.Fill(ds1);
            foreach (DataRow dr1 in ds1.Tables[0].Rows)
            {
                c1 = dr1[0].ToString();
                c2 = dr1[1].ToString();
                c3 = dr1[2].ToString();
                DateTime obj2 = new DateTime();
                obj2 = System.DateTime.Now;
                string my_time2 = obj2.ToString();
                SqlDataAdapter da2 = new SqlDataAdapter("SELECT COUNT(ans_by) AS expr3 FROM  my_calls WHERE call_init_date>='" + RadDateTimePicker1.SelectedDate.Value.ToString() + "' AND call_init_date<='" + RadDateTimePicker2.SelectedDate.Value.ToString() + "' AND  ans_by = '" + c1 + "'", conn);
                da2.Fill(ds2);
                foreach (DataRow dr2 in ds2.Tables[0].Rows)
                {
                    c4 = dr2[0].ToString();
                }
                SqlDataAdapter da3 = new SqlDataAdapter("SELECT COUNT(staff_id) AS expr4 FROM  staff_schedule WHERE date>='" + RadDateTimePicker1.SelectedDate.Value.ToString() + "' AND date<='" + RadDateTimePicker2.SelectedDate.Value.ToString() + "' AND  staff_id = '" + c1 + "'", conn);
                da3.Fill(ds3);
                foreach (DataRow dr3 in ds3.Tables[0].Rows)
                {
                    c5 = dr3[0].ToString();
                }

                SqlCommand my_insert = new SqlCommand("INSERT INTO eval_tab3(user_id,s_date,e_date,report_date,lock_count,unlock_count,calls_ans,schedule) VALUES('" + c1 + "','" + RadDateTimePicker1.SelectedDate.Value.ToString() + "','" + RadDateTimePicker2.SelectedDate.Value.ToString() + "','" + my_time2 + "','" + c2 + "','" + c3 + "','" + c4 + "','" + c5 + "');", conn);
                conn.Open();
                my_insert.ExecuteNonQuery();
                conn.Close();
                GridView1.DataBind();
            }
        }
        GridView1.DataSourceID = SqlDataSource2.ID;
        GridView1.DataBind();
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource2.ID;
        GridView1.DataBind();
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = SqlDataSource1.ID;
        GridView1.DataBind();
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "Time Based View")
        {
            RadDateTimePicker1.Enabled = true;
            RadDateTimePicker2.Enabled = true;
        }
        else
        {
            RadDateTimePicker1.Enabled = false;
            RadDateTimePicker2.Enabled = false;
        }
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "Time Based View")
        {
            GridView1.DataSourceID = SqlDataSource5.ID;
        }
        else
        {
            GridView1.DataSourceID = SqlDataSource4.ID;
        }
        GridView1.DataBind();
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "Time Based View")
        {
            GridView1.DataSourceID = SqlDataSource2.ID;
        }
        else
        {
            GridView1.DataSourceID = SqlDataSource1.ID;
        }
        GridView1.DataBind();
    }
}