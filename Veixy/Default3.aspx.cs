using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Button2.Attributes.Add("OnClick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
        Button3.Attributes.Add("OnClick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
        Button8.Attributes.Add("onclick", "alert('Please select a msg first');");
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackEventReference(this.GridView1, "Select$" + e.Row.RowIndex.ToString());
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        Label1.Text = GridView1.SelectedRow.Cells[1].Text;
        SqlCommand update1 = new SqlCommand("update cust_inbox set img_url=img_url2 where token_no=" + Label1.Text + ";", conn);
        conn.Open();
        update1.ExecuteNonQuery();
        conn.Close();
    }

    protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (GridDataItem item in RadGrid1.MasterTableView.GetItems(new GridItemType[] { GridItemType.Item, GridItemType.AlternatingItem }))
        {
            GridDataItem dataitem = (GridDataItem)item;

            if (dataitem.Selected)
            {
                Label1.Text = dataitem["sent_from"].Text;
            }
        }
    }

    protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
    {
        GridItemType item = e.Item.ItemType;

        switch (item)
        {
            case GridItemType.AlternatingItem:
            case GridItemType.Item:

                TableRow row = e.Item as TableRow;
                row.Attributes.Add("onclick", Page.ClientScript.GetPostBackEventReference(this.GridView1, "Select$" + row.Cells.ToString()));
                break;
        }
    }

    protected void RadGrid1_ItemCommand(object source, GridCommandEventArgs e)
    {
        e.Item.Attributes["onclick"] = Page.ClientScript.GetPostBackEventReference(this.GridView1, "Select$" + e.Item.RowIndex.ToString());
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int temp1 = 0;
        if (RadioButton1.Checked == true)
        {
            temp1 = 15;
        }
        if (CheckBox1.Checked == true)
        {
            temp1 = 25;
        }
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        SqlCommand my_insert2 = new SqlCommand("INSERT INTO test_1(name,token_no,fname) VALUES('fawad'," + TextBox1.Text + ",'fawadz');", conn);

        SqlCommand my_insert = new SqlCommand("INSERT INTO test_2(token_no,sub1,sub2,sub3) VALUES(" + TextBox1.Text + "," + Convert.ToInt32(RadioButtonList1.SelectedValue.ToString()) + "," +
            temp1 + "," + Convert.ToInt32(CheckBoxList1.SelectedValue.ToString()) + ");", conn);
        conn.Open();
        my_insert2.ExecuteNonQuery();
        my_insert.ExecuteNonQuery();

        conn.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string gvIDs = "";
        bool chkBox = false;

        foreach (GridViewRow gv in GridView2.Rows)
        {
            CheckBox deleteChkBxItem = (CheckBox)gv.FindControl("CheckBox2");
            if (deleteChkBxItem.Checked)
            {
                chkBox = true;
                gvIDs += ((Label)gv.FindControl("CheckBox2")).Text.ToString() + ",";
            }
        }

        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        if (chkBox)
        {
            try
            {
                string deleteSQL = "DELETE from test_1 WHERE token_no IN (" +
                  gvIDs.Substring(0, gvIDs.LastIndexOf(",")) + ")";
                SqlCommand cmd = new SqlCommand(deleteSQL, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
            }
            catch (SqlException err)
            {
                Response.Write(err.Message.ToString());
            }
            finally
            {
                conn.Close();
            }
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=Toshiba;Initial Catalog=CRM_db;Integrated Security=True");
        foreach (GridViewRow row in GridView2.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("CheckBox2");

            if (checkbox.Checked)
            {
                int employeeID = Convert.ToInt32(GridView2.DataKeys[row.RowIndex].Value);
                SqlCommand my_delete = new SqlCommand("DELETE from test_1 WHERE token_no ='" + employeeID + "';", conn);
                conn.Open();
                my_delete.ExecuteNonQuery();
                conn.Close();
            }
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        TextBox2.Text = TextBox3.Text + " " + TextBox4.Text;
        System.DateTime obj = new DateTime();
        obj = Convert.ToDateTime(TextBox2.Text);
        TextBox2.Text = obj.ToString();
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Label2.Text = Calendar1.SelectedDate.ToString();
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        GridViewRow row = ((Button)sender).Parent.Parent as GridViewRow;
        Label2.Text = row.RowIndex.ToString();
        Label3.Text = GridView5.Rows[row.RowIndex].Cells[1].Text;
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string GetDynamicContent(string contextKey)
    {
        return default(string);
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        return default(string[]);
    }
}