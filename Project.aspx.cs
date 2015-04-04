using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.DefaultButton = SearchButton.UniqueID;
    }
    protected void AddProjButton_Click(object sender, EventArgs e)
    {
        Session["ProjectID"] = -1;
        Response.Redirect("NewProject.aspx");
    }
    protected void SearchButton_Click(object sender, EventArgs e)
    {
        SqlDataSource1.FilterParameters.Clear();
        if (ProjectNameBox.Text != "")
        {
            updateFilter("Title", ProjectNameBox.Text);
        }
        if (ProjStartBox.Text != "")
        {
            updateFilter("DateStarted", ProjStartBox.Text);
        }
        if (ProjCompBox.Text != "")
        {
            updateFilter("DateCompleted", ProjCompBox.Text);
        }
        if (KeywordBox.Text != "")
        {
            updateFilter("Description", KeywordBox.Text);
        }
    }

    protected void updateFilter(string sfield, string stext)
    {
        if (sfield.Contains("Date"))
        {
            if (SqlDataSource1.FilterExpression.Length == 0)
            {
                SqlDataSource1.FilterExpression = sfield + " = '" + stext + "'";
            }
            else
            {
                SqlDataSource1.FilterExpression = SqlDataSource1.FilterExpression + " and " + sfield + " = '" + stext + "'";
            }
        }
        else
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
        
            
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (projectGrid.SelectedIndex != -1)
        {
            SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
            try
            {
                dbConnection.Open();
                string deleteString = @"DELETE FROM Project WHERE ProjectID = " + projectGrid.DataKeys[projectGrid.SelectedIndex].Value;
                SqlCommand deleteProject = new SqlCommand(deleteString, dbConnection);
                deleteProject.ExecuteNonQuery();
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
            }
            finally
            {
                dbConnection.Close();
            }
            Response.Redirect("Project.aspx");
        }
    }
    protected void projectGrid_SelectedIndexChanged(object sender, GridViewSelectEventArgs e)
    {
       // projectGrid.SelectedIndex = e.NewSelectedIndex;

    }
    protected void projectGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
         Response.Write("selected");
    }

    protected void OKButton_Click(object sender, EventArgs e)
    {
       
        if (projectGrid.SelectedIndex != -1)
        {
            Session["ProjectID"] = projectGrid.DataKeys[projectGrid.SelectedIndex].Value;
            Response.Redirect("NewProject.aspx");
        } 

    }
    protected void projectGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(projectGrid, "Select$" + e.Row.RowIndex));
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='yellow';this.style.cursor='pointer';");
            if (e.Row.RowState == DataControlRowState.Alternate)
            {
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + System.Drawing.ColorTranslator.ToHtml(((GridView)(e.Row.Parent.Parent)).AlternatingRowStyle.BackColor) + "';"); //this.style.cursor='default';
            }
            else if (e.Row.RowState == DataControlRowState.Selected)
            {
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + System.Drawing.ColorTranslator.ToHtml(((GridView)(e.Row.Parent.Parent)).SelectedRowStyle.BackColor) + "';"); //this.style.cursor='default';

            }
            else if ((e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == DataControlRowState.Insert || (e.Row.RowIndex == projectGrid.EditIndex)))
            {
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + System.Drawing.ColorTranslator.ToHtml(((GridView)(e.Row.Parent.Parent)).EditRowStyle.BackColor) + "';"); //this.style.cursor='default';
                e.Row.Attributes.Remove("onclick");
                e.Row.Attributes.Remove("onmouseover");
            }
            else
            {
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + System.Drawing.ColorTranslator.ToHtml(((GridView)(e.Row.Parent.Parent)).RowStyle.BackColor) + "';"); //this.style.cursor='default';
            }
        }


    }
    protected void projectGrid_SelectedIndexChanging(Object sender, GridViewSelectEventArgs e)
    {

        GridViewRow Row = projectGrid.Rows[e.NewSelectedIndex];
        if (Row != null)
        {
            Row.Attributes.Remove("onmouseout");
            Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + System.Drawing.ColorTranslator.ToHtml(((GridView)(Row.Parent.Parent)).SelectedRowStyle.BackColor) + "';"); //this.style.cursor='default';
        }

        if (projectGrid.SelectedIndex > -1)
        {

            Row = projectGrid.Rows[projectGrid.SelectedIndex];
            projectGrid.SelectedIndex = e.NewSelectedIndex;
            if (Row != null)
            {
                Row.Attributes.Remove("onmouseout");
                if (Row.RowIndex == projectGrid.EditIndex) //(Row.RowState == DataControlRowState.Edit || Row.RowState == DataControlRowState.Insert ||
                {
                    Row.Attributes.Remove("onmouseover");
                    Row.Attributes.Remove("onclick");//this.style.cursor='default';

                }
                else if (Row.RowState == DataControlRowState.Alternate)
                {
                    Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + System.Drawing.ColorTranslator.ToHtml(((GridView)(Row.Parent.Parent)).AlternatingRowStyle.BackColor) + "';"); //this.style.cursor='default';
                }

//                 else if ((Row.RowState == DataControlRowState.Selected) && (Row.RowIndex != GridView1.SelectedIndex))
                //                 {
                //                     Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + System.Drawing.ColorTranslator.ToHtml(((GridView)(Row.Parent.Parent)).SelectedRowStyle.BackColor) + "';"); //this.style.cursor='default';
                //                 }
                else
                {
                    //Row.RowState == DataControlRowState.Normal
                    Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + System.Drawing.ColorTranslator.ToHtml(((GridView)(Row.Parent.Parent)).RowStyle.BackColor) + "';"); //this.style.cursor='default';
                }

            }
        }
    }

    protected void deleteButton_PreRender(object sender, EventArgs e)
    {
        if (projectGrid.SelectedIndex == -1)             //On this pre-render event I'm checking if a row selection has
        {                                              //been made, otherwise I'm overriding the OnClick event to call
            deleteButton.Attributes.Add("onclick", "alert('Please select an existing Project first...');");  //the JavaScript pop-up message.  This only persists during
        } //the page render... When refreshed will use regular onclick event...
        else
        {
            deleteButton.Attributes.Remove("onclick");
        }
    }
    protected void OKButton_PreRender(object sender, EventArgs e)
    {
        if (projectGrid.SelectedIndex == -1)             //On this pre-render event I'm checking if a row selection has
        {                                              //been made, otherwise I'm overriding the OnClick event to call
            OKButton.Attributes.Add("onclick", "alert('Please select an existing Project first...');");  //the JavaScript pop-up message.  This only persists during
        } //the page render... When refreshed will use regular onclick event...
        else
        {
            OKButton.Attributes.Remove("onclick");
        }
    }
}
    



