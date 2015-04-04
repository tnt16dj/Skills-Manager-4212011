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
        empSkillCatLabel.Text =Convert.ToString(Session["SkillCat"]);
    }
    protected void empSkillSkillNextButton_Click(object sender, EventArgs e)
    {
        Session["skillSkill"] = Convert.ToString(skillSkillDropDown.SelectedItem.Value);
        Response.Redirect("EmployeeSkillDetPage.aspx");
    }
}   
