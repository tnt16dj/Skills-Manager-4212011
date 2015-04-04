using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void catNextButton_Click(object sender, EventArgs e)
    {
        Session["skillCat"]=Convert.ToString(skillCatDropDown.SelectedItem.Value);
        Response.Redirect("EmployeeSkillSkillPage.aspx");
    }
}
