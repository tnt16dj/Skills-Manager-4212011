using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.DefaultButton = EmpFindButton.UniqueID;
    }
    protected void NewEmpButton_Click(object sender, EventArgs e)
    {
        Session["empID"] = "";
        Response.Redirect("EmployeeDetailPage.aspx");
    }
    protected void EmpSelectButton_Click(object sender, EventArgs e)
    {
        if (empGrid.SelectedIndex != -1)
        {
            Session["empID"] = empGrid.DataKeys[empGrid.SelectedIndex].Value;
            Response.Redirect("EmployeeDetailPage.aspx");
        }
    }
    protected void EmpSelectButton_PreRender(object sender, EventArgs e)
    {
        if (empGrid.SelectedIndex == -1)             //On this pre-render event I'm checking if a row selection has
        {                                              //been made, otherwise I'm overriding the OnClick event to call
            EmpSelectButton.Attributes.Add("onclick", "empSelectAlert()");  //the JavaScript pop-up message.  This only persists during
        } //the page render... When refreshed will use regular onclick event...
        else
        {
            EmpSelectButton.Attributes.Remove("onclick");
        }
    }
    protected void EmpFindButton_Click(object sender, EventArgs e)
    {
        SqlDataSource1.FilterParameters.Clear();
        if (FNameTextBox.Text != "")
        {
            updateFilter("FirstName", FNameTextBox.Text);
        }
        if (LNameTextBox.Text != "")
        {
            updateFilter("LastName", LNameTextBox.Text);
        }
    }
    protected void updateFilter(string sfield, string stext)
    {
        if (SqlDataSource1.FilterExpression.Length == 0)
        {
            SqlDataSource1.FilterExpression = sfield + " LIKE '%" + stext + "%'";
        }
        else
        {
            SqlDataSource1.FilterExpression = SqlDataSource1.FilterExpression + " and " + sfield + " LIKE '%" + stext + "%'";
        }
    }
    protected void empGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='yellow'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white'");
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(empGrid, "Select$" + (e.Row.RowIndex)));
        }
    }
    protected void empGrid_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        empGrid.SelectedIndex = e.NewSelectedIndex;  //Setting the selected index on a row click event...
 //       e.Cancel = true;                               //However, here I'm canceling the Selected Index Change Event
    }                                                  //so that we can still utilize the 'Search' button per the Use Case

}
