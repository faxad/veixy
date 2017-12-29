using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class staff_reg : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("country_list.xml"));
            DataView dv = ds.Tables["ISO_3166-1_Entry"].DefaultView;
            DropDownList1.DataSource = dv;
            DropDownList1.DataTextField = "ISO_3166-1_Country_name";
            DropDownList1.DataBind();
        }
    }

    protected void LinkButton14_Click(object sender, EventArgs e)
    {
        SqlCommand my_insert = new SqlCommand("INSERT INTO staff_info(staff_id,staff_pass,f_name,l_name,dob,country,city,staff_contact_no,staff_contact_no2,email_add,staff_id_no,post_title,postal_address) VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox13.Text + "','" + DropDownList1.SelectedItem.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "','" + TextBox9.Text + "','" + TextBox11.Text + "','" + TextBox12.Text + "','" + TextBox10.Text + "');", conn);
        conn.Open();
        my_insert.ExecuteNonQuery();
        conn.Close();
        Session.Add("user_session", TextBox1.Text);
        Response.Redirect("staff_inbox.aspx");
    }

    protected void TextBox6_TextChanged(object sender, EventArgs e)
    {
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (LinkButton1.Text == "(Change ID)")
        {
            Label1.Text = "";
            TextBox1.ReadOnly = false;
            LinkButton1.Text = "Check Availability";
            LinkButton14.Enabled = false;
        }
        else
        {
            int ck = 0;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT staff_id FROM staff_info WHERE staff_id='" + TextBox1.Text + "';", conn);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (TextBox1.Text == dr[0].ToString())
                    {
                        LinkButton14.Enabled = false;
                        Label1.Text = "Not Available";
                        ck = 1;
                        break;
                    }
                    else
                    {
                        ck = 0;
                    }
                }
            }
            if (ck == 0)
            {
                DataSet ds2 = new DataSet();
                SqlDataAdapter da2 = new SqlDataAdapter("SELECT user_id FROM user_info WHERE user_id='" + TextBox1.Text + "';", conn);
                da2.Fill(ds2);
                if (ds2.Tables[0].Rows.Count == 0)
                {
                    LinkButton14.Enabled = true;
                    Label1.ForeColor = Color.DarkGreen;
                    Label1.Text = "Available";
                    TextBox1.ReadOnly = true;
                    LinkButton1.Text = "(Change ID)";
                }
                else
                {
                    LinkButton14.Enabled = false;
                    Label1.Text = "Not Available";
                    ck = 1;
                }
            }
        }
    }

    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {
    }

    protected void TextBox12_TextChanged(object sender, EventArgs e)
    {
    }
}