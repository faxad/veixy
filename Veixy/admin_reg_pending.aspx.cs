using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_reg_pending : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        DropDownList ddl1 = (DropDownList)FormView1.FindControl("DropDownList1");
        Label lbl = (Label)FormView1.FindControl("staff_idLabel1");
        TextBox TextBox1 = (TextBox)FormView1.FindControl("TextBox1");
        if (ddl1.SelectedItem.Text == "Activated")
        {
            SqlCommand my_update = new SqlCommand("UPDATE staff_info set reg_status='Registered',acc_status='Activated' WHERE staff_id='" + lbl.Text + "';", conn);
            SqlCommand my_update2 = new SqlCommand("INSERT INTO eval_tab2(user_id,held) VALUES('" + lbl.Text + "','0');", conn);
            SqlCommand my_update3 = new SqlCommand("UPDATE staff_info set admin_comments=@comment WHERE staff_id='" + lbl.Text + "';", conn);
            my_update3.Parameters.Add("@comment", 8000).Value = TextBox1.Text;
            conn.Open();
            my_update.ExecuteNonQuery();
            my_update2.ExecuteNonQuery();
            my_update3.ExecuteNonQuery();
            conn.Close();
            FormView1.DataBind();
        }
    }
}