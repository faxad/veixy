using System;
using System.Data;
using System.Data.SqlClient;

public partial class staff_edit_prof : System.Web.UI.Page
{
    private int x = 0;
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_session"].ToString() == "")
        {
            Response.Redirect("user_login.aspx");
        }
        {
        }
    }

    protected void LinkButton14_Click(object sender, EventArgs e)
    {
        SqlCommand my_update = new SqlCommand("UPDATE staff_info SET staff_pass='" + TextBox2.Text + "',f_name='" + TextBox4.Text + "',l_name='" + TextBox5.Text + "',dob='" + Convert.ToDateTime(TextBox13.Text) + "',country='" + DropDownList1.SelectedItem.Text + "',city='" + TextBox6.Text + "',email_add='" + TextBox9.Text + "',staff_id_no='" + TextBox11.Text + "',post_title='" + TextBox12.Text + "',postal_address='" + TextBox10.Text + "' WHERE staff_id='" + Session["user_session"].ToString() + "';", conn);
        SqlCommand my_update2 = new SqlCommand("UPDATE staff_info SET staff_contact_no='" + TextBox7.Text + "',staff_contact_no2='" + TextBox8.Text + "';", conn);
        conn.Open();
        try
        {
            my_update2.ExecuteNonQuery();
            my_update.ExecuteNonQuery();
            email_class obje = new email_class();
            string my_time = System.DateTime.Now.ToString();
            string email_msg = "Staff Member " + TextBox1.Text + " has updated his/her profile";
            SqlCommand my_insert_m = new SqlCommand("INSERT INTO msg_box(msg_from,msg_date,subject,msg_text,msg_to,msg_img,from_type,to_type,box_type) VALUES('CRM_System','" + my_time + "','Profile Updated','" + email_msg + "','admin','Images/msg_unchecked.jpg','staff','admin','inbox');", conn);
            my_insert_m.ExecuteNonQuery();
            Label4.Text = "Profile Updated";
        }
        catch
        {
            Label2.Text = "Invalid Contact No";
        }
        conn.Close();
        Label1.Text = "";

        x = 1;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        RequiredFieldValidator1.Enabled = false;
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT staff_id,staff_pass,f_name,l_name,dob,country,city,staff_contact_no,staff_contact_no2,email_add,staff_id_no,post_title,postal_address FROM staff_info WHERE staff_id='" + Session["user_session"].ToString() + "';", conn);
        da.Fill(ds);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            TextBox1.Text = dr[0].ToString();
            TextBox2.Text = dr[1].ToString();
            TextBox3.Text = dr[1].ToString();
            TextBox4.Text = dr[2].ToString();
            TextBox5.Text = dr[3].ToString();
            TextBox13.Text = dr[4].ToString();
            for (int i = 0; i < (DropDownList1.Items.Count); i++)
            {
                string temp = DropDownList1.Items[i].Value.ToString();
                string temp2 = dr[5].ToString();
                if (temp2 == temp)
                {
                    DropDownList1.SelectedIndex = i;
                    break;
                }
            }
            TextBox6.Text = dr[6].ToString();
            TextBox7.Text = dr[7].ToString();
            TextBox8.Text = dr[8].ToString();
            TextBox9.Text = dr[9].ToString();
            TextBox11.Text = dr[10].ToString();
            TextBox12.Text = dr[11].ToString();
            TextBox10.Text = dr[12].ToString();
        }
    }

    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {
    }
}