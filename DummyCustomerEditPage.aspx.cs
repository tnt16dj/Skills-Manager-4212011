using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    public void data_load(int ind)
    {

        switch (ind)
        {
            case 0:
                empFirstName.Text = "Edit";
                empLastName.Text = "Edit";
                empTitle.Text = "Edit";
                CheckBox3.Checked = false;
                empFirstName0.Text = "Edit Road";
                empLastName0.Text = "Edit Road2";
                empTitle0.Text = "Edit City";
                empFirstName1.Text = "Edit State";
                empLastName1.Text = "12345";
                empTitle1.Text = "USA";
                empFirstName2.Text = "(111) 222-3333";
                empLastName2.Text = "(444) 555-6666";
                break;
            case 1:
                empFirstName.Text = "New";
                empLastName.Text = "New";
                empTitle.Text = "New";
                CheckBox3.Checked = false;
                empFirstName0.Text = "New Road";
                empLastName0.Text = "New Road 2";
                empTitle0.Text = "New City";
                empFirstName1.Text = "New State";
                empLastName1.Text = "12345";
                empTitle1.Text = "USA";
                empFirstName2.Text = "(111) 222-3333";
                empLastName2.Text = "(444) 555-6666";
                break;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        int cusIndex;

        cusIndex = Convert.ToInt16(Request.QueryString["customer"]);
        if (cusIndex != -1)
        {
            data_load(cusIndex);
        }
    }
    protected void SubmitCustomer_Click(object sender, EventArgs e)
    {

    }
    protected void DeleteCustomer_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomersSearchPage.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
