using System;
using System.Data;
using System.Data.SqlClient;

public partial class staff_inbox : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
        TextBox3.Text = Request.QueryString[0].ToString();
        if (DropDownList1.Items.Count == 1)
        {
            DropDownList1.Enabled = false;
        }
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT prod_id,product_cost FROM prod_info WHERE prod_name='" + DropDownList2.SelectedItem.Text + "';", conn);
            da.Fill(ds);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                SqlCommand my_insert2 = new SqlCommand("INSERT INTO my_product(prod_title,user_name,purchase_date,prod_sno) VALUES('" + DropDownList2.SelectedItem.Text + "','" + TextBox3.Text + "','" + System.DateTime.Now.ToString() + "','" + dr[0].ToString() + "');", conn);
                conn.Open();
                my_insert2.ExecuteNonQuery();
                conn.Close();
            }
            SqlCommand my_insert = new SqlCommand("INSERT INTO cust_payment(payment_name,payment_date,due_date,amount,payment_duration,amount_due,payment_by,product_name) VALUES('" + TextBox8.Text + "','" + System.DateTime.Now.ToString() + "','" + TextBox7.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox3.Text + "','" + DropDownList2.SelectedItem.Text + "');", conn);
            conn.Open();
            my_insert.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }
        else
        {
            SqlCommand my_insert = new SqlCommand("INSERT INTO cust_payment(payment_name,payment_date,due_date,amount,payment_duration,amount_due,payment_by,product_name) VALUES('" + TextBox8.Text + "','" + System.DateTime.Now.ToString() + "','" + TextBox7.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox3.Text + "','" + DropDownList1.SelectedItem.Text + "');", conn);
            conn.Open();
            my_insert.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            DropDownList1.Enabled = false;
            DropDownList2.Enabled = true;
        }
        else
        {
            DropDownList1.Enabled = true;
            DropDownList2.Enabled = false;
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT product_cost FROM prod_info WHERE prod_name='" + DropDownList1.SelectedItem.Text + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            Label2.Text = dr[0].ToString();
        }
        TextBox5.Text = "1";
        TextBox4.Text = Label2.Text;
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT product_cost FROM prod_info WHERE prod_name='" + DropDownList2.SelectedItem.Text + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            Label2.Text = dr[0].ToString();
        }
        TextBox5.Text = "1";
        TextBox4.Text = Label2.Text;
    }

    protected void TextBox5_TextChanged(object sender, EventArgs e)
    {
        TextBox4.Text = Convert.ToString(Convert.ToInt32(Label2.Text) * Convert.ToInt32(TextBox5.Text));
    }
}