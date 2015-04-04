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

    }
    protected void NewEmpButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployeeDetailPage.aspx");
    }
    protected void EmpSelectButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployeeDetailPage.aspx?Employee=" + "1");
    }
    protected void EmpFindButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployeeSearchPage.aspx");
    }
}
