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
        string dataType = "";
        string req = "";
        
        skillCatDetLabel.Text = Convert.ToString(Session["skillCat"]);
        skillSkillDetLabel.Text = Convert.ToString(Session["skillSkill"]);
        skillDescDetLabel.Text=Convert.ToString(Session["skillDet"]);
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True"); Page.Validate();
        try
        {
            dbConnection.Open();
            CheckIDSQLString = "SELECT DataType.Description, CategoryProperty.IsRequired FROM CategoryProperty INNER JOIN DataType ON CategoryProperty.DataTypeID = DataType.DataTypeID WHERE (CategoryProperty.Description = '"+Session["skillDet"]+"')";
            SqlCommand checkID = new SqlCommand(CheckIDSQLString, dbConnection);
            SqlDataReader idRecord = checkID.ExecuteReader();
            if (idRecord.Read())
            {
                dataType = Convert.ToString(idRecord["Description"]);
                req = Convert.ToString(idRecord["IsRequired"]);
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
        if (req == "True")
        {
            skillDataRequiredFieldValidator.Enabled = true;
            skillDataRequiredFieldValidator.Visible = true;
        }
        switch (dataType)
        {
            case "integer":
                skillDataCompareValidator.Type = ValidationDataType.Integer;
                skillDataCompareValidator.ErrorMessage = "Integer value required";
                skillDataCompareValidator.Enabled = true;
                skillDataCompareValidator.Visible = true;
                break;
            case "date":
                skillDataCompareValidator.Type = ValidationDataType.Date;
                skillDataCompareValidator.ErrorMessage = "Date value required";
                skillDataCompareValidator.Enabled = true;
                skillDataCompareValidator.Visible = true;
                break;
            case "decimal":
                skillDataCompareValidator.Type = ValidationDataType.Double;
                skillDataCompareValidator.ErrorMessage = "Double value required";
                skillDataCompareValidator.Enabled = true;
                skillDataCompareValidator.Visible = true;
                break;
            case "string":
                skillDataCompareValidator.Type = ValidationDataType.String;
                skillDataCompareValidator.ErrorMessage = "String value required";
                skillDataCompareValidator.Enabled = true;
                skillDataCompareValidator.Visible = true;
                break;
            case "boolean":
                skillDataRegularExpressionValidator.ValidationExpression = "true|false";
                skillDataRegularExpressionValidator.ErrorMessage = "boolean value required";
                skillDataRegularExpressionValidator.Enabled = true;
                skillDataRegularExpressionValidator.Visible = true;
                break;
            default:
                Response.Write("No handler for this data type");
                break;
        }
    }

    protected void skillDetSubmitButton_Click(object sender, EventArgs e)
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string insertString = @"INSERT INTO SkillDetail (Category, Skill, EmployeeID, Description, Data) VALUES ('" + Session["skillCat"] + "','" + Session["skillSkill"] + "','" + Session["empId"] + "','" + Session["skillDet"] + "','" + empSkilldataTextBox.Text +"')";
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
}
