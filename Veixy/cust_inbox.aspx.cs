using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cust_inbox : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
        Label1.Visible = false;
        Image3.Visible = false;
        ImageButton3.Attributes.Add("OnClick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
        Image4.Visible = false;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        {
            e.Row.Attributes["onmouseover"] =
                "javascript:setMouseOverColor(this);";
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackEventReference(this.GridView1, "Select$" + e.Row.RowIndex.ToString());
            max_label.Text = "-1";
            max_label.Visible = false;
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Image4.Visible = true;
        try
        {
            SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
            string temp = GridView1.SelectedRow.Cells[2].Text;
            try
            {
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select MAX(msg_counter) from act_onbox where token_no=" + temp + ";", conn);
                da.Fill(ds);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    max_label.Text = dr[0].ToString();
                }
            }
            catch (Exception ez)
            {
                max_label.Text = ez.Message.ToString();
            }
            SqlCommand update1 = new SqlCommand("update cust_inbox set img_url='Images/msg_checked.jpg' where token_no=" + temp + ";", conn);
            conn.Open();
            update1.ExecuteNonQuery();
            conn.Close();
            if (GridView1.SelectedRow.Cells[3].Text == "close")
            {
                Label5.Text = "This issue is now closed. Contact staff for a re-open";
            }
        }
        catch (Exception ex)
        {
            string t;
            t = ex.Message.ToString();
        }
    }

    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
    }

    protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DataList1.Visible = false;
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Image4.Visible = true;
        Label1.Visible = true;
        Image3.Visible = true;
        DataList1.Visible = true;
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("CheckBox2");

            if (checkbox.Checked)
            {
                int temp = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                SqlCommand my_delete = new SqlCommand("DELETE from cust_inbox WHERE token_no ='" + temp + "';", conn);
                conn.Open();
                my_delete.ExecuteNonQuery();
                conn.Close();
            }
        }
        GridView1.DataBind();
    }

    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        string temp = GridView1.SelectedRow.Cells[2].Text;
        SqlCommand update1 = new SqlCommand("update cust_inbox set open_close='C',close_date='" + System.DateTime.Now.ToString() + "' where token_no=" + temp + ";", conn);
        conn.Open();
        update1.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();
    }

    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        string temp = GridView1.SelectedRow.Cells[2].Text;
        SqlCommand update1 = new SqlCommand("update cust_inbox set held_by='none' where token_no=" + temp + ";", conn);
        SqlCommand update2 = new SqlCommand("UPDATE eval_tab2 SET force_unheld=force_unheld+1 WHERE user_id='" + GridView1.SelectedRow.Cells[5].Text + "';", conn);
        conn.Open();
        update1.ExecuteNonQuery();
        update2.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();
    }

    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        int temp = GridView1.SelectedIndex;
        ImageButton btn = (ImageButton)sender;
        DataListItem dli = (DataListItem)btn.NamingContainer;
        TextBox TextBox2 = (TextBox)dli.FindControl("TextBox2");
        if (TextBox2.Text != "")
        {
            DateTime obj = new DateTime();
            obj = System.DateTime.Now;
            string my_time = obj.ToString();
            string token_temp = GridView1.SelectedDataKey.Value.ToString();
            SqlCommand my_insert2 = new SqlCommand("INSERT INTO act_onbox(token_no,act_msg,msg_date,msg_from) VALUES(" + token_temp + ",@msg,'" + my_time + "','" + Session["user_session"].ToString() + "');", conn);
            my_insert2.Parameters.Add("@msg", 8000).Value = TextBox2.Text;
            conn.Open();
            my_insert2.ExecuteNonQuery();
            conn.Close();
            SqlCommand update9 = new SqlCommand("update cust_inbox set img_url2='Images/msg_unchecked.jpg' where token_no=" + GridView1.SelectedDataKey.Value.ToString() + ";", conn);
            conn.Open();
            update9.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
            DataList2.DataBind();
            DataList1.DataBind();
            TextBox2.Text = "";
        }
    }
}