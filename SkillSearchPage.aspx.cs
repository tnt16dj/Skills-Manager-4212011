using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SkillSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["searchKey"] = null;
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='yellow'; this.style.cursor='pointer';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white'");
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + (e.Row.RowIndex)));
        }
    }
    protected void AddNewSkill_Click(object sender, EventArgs e)
    {
        Response.Redirect("SkillContentPage.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (GridView1.SelectedIndex != -1)
        {
            Session["searchKey"] = GridView1.DataKeys[GridView1.SelectedIndex].Value;
            Response.Redirect("SkillContentPage.aspx");
        }
    }                                           
    protected void Button2_PreRender(object sender, EventArgs e)
    {
        if (GridView1.SelectedIndex == -1)             //On this pre-render event I'm checking if a row selection has
        {                                              //been made, otherwise I'm overriding the OnClick event to call
            Button2.Attributes.Add("onclick", "show_alert()");  //the JavaScript pop-up message.  This only persists during
        }                                              //the page render... When refreshed will use regular onclick event...
        else
        {
            Button2.Attributes.Remove("onclick");
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
    }
}
