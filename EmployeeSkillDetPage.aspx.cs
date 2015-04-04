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
        string CheckIDSQLString;
        
        skillCatDetLabel.Text = Convert.ToString(Session["skillCat"]);
        skillSkillDetLabel.Text = Convert.ToString(Session["skillSkill"]);
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            CheckIDSQLString = "SELECT CategoryProperty.Description FROM CategoryProperty INNER JOIN Category ON CategoryProperty.CategoryID = Category.CategoryID WHERE (Category.CategoryName = '"+skillCatDetLabel.Text+"')";
            SqlCommand checkID = new SqlCommand(CheckIDSQLString, dbConnection);
            SqlDataReader idRecord = checkID.ExecuteReader();
            if (idRecord.Read())
            {       
            }
            else
            {
                skillDescDropDown.Visible=false;
                skillDetSubmitButton.Visible = true;
                skillDescLabel.Visible = false;
                skilldetNextButton.Visible = false;
            }
            idRecord.Close();
        }
        catch (SqlException exception)
        {
            Response.Write("<p>Error code "
                + exception.Number + ": "
                + exception.Message + "</p>");
        }
        finally
        {
            dbConnection.Close();
        }
    }

    protected void skillDetSubmitButton_Click(object sender, EventArgs e)
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string insertString = @"INSERT INTO SkillDetail (Category, Skill, EmployeeID) VALUES ('" + Session["skillCat"] + "','" + Session["skillSkill"] + "','" + Session["empId"] + "')";
            SqlCommand addEmpSkill = new SqlCommand(insertString, dbConnection);
            addEmpSkill.ExecuteNonQuery();
        }
        catch (SqlException exception)
        {
            Response.Write("<p>Error code "
                + exception.Number + ": "
                + exception.Message + "</p>");
        }
        finally
        {
            dbConnection.Close();
        }
        Response.Redirect("EmployeeDetailPage.aspx");
    }
    protected void skilldetNextButton_Click(object sender, EventArgs e)
    {
        Session["skillDet"] = Convert.ToString(skillDescDropDown.SelectedItem.Value);
        Response.Redirect("EmployeeSkillDataPage.aspx");
    }
}
