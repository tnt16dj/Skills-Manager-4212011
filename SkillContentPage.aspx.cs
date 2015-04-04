using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    private void add_skill(string newCategory)
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string insertString = @"INSERT INTO [Category] ([CategoryName]) VALUES ('" + newCategory + "')";

            SqlCommand addSkill = new SqlCommand(insertString, dbConnection);
            addSkill.ExecuteNonQuery();
        }
        catch (SqlException exception)
        {
            Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
        }
        finally
        {
            dbConnection.Close();
        }
    }

    private void add_cat_definition(string newCategoryField, int newDataType, bool newRequiredCheckbox, int searchKey)
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string insertString = @"INSERT INTO [CategoryProperty] ([CategoryID], [Description], [DataTypeID], [IsRequired]) VALUES ('" + searchKey + "','" + newCategoryField + "','" + newDataType + "','" + newRequiredCheckbox + "')";

            SqlCommand addCatDefinition = new SqlCommand(insertString, dbConnection);
            addCatDefinition.ExecuteNonQuery();
        }
        catch (SqlException exception)
        {
            Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
        }
        finally
        {
            dbConnection.Close();
        }
    }

    private void add_category_skill(string categorySkill, int searchKey)
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string insertString = @"INSERT INTO [Skill] ([SkillName], [CategoryID]) VALUES ('" + categorySkill + "','" + searchKey + "')";

            SqlCommand addCatSkill = new SqlCommand(insertString, dbConnection);
            addCatSkill.ExecuteNonQuery();
        }
        catch (SqlException exception)
        {
            Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
        }
        finally
        {
            dbConnection.Close();
        }
    }

    private int get_DataTypeID(string DataType)
    {
        int selectedDataTypeID = 0;
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string CheckIDSQLString = "SELECT DataTypeID From DataType WHERE Description='" + DataType + "'";
            SqlCommand checkID = new SqlCommand(CheckIDSQLString, dbConnection);
            SqlDataReader idRecord = checkID.ExecuteReader();
            if (idRecord.Read())
            {
                selectedDataTypeID = Convert.ToInt32(idRecord["DataTypeID"]);
            }
            idRecord.Close();
        }
        catch (SqlException exception)
        {
            Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
        }
        finally
        {
            dbConnection.Close();
        }
        return selectedDataTypeID;
    }

    private int get_new_id(string newCategory)
    {
        int newID = 0;
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string CheckIDSQLString = "SELECT CategoryID From Category WHERE CategoryName='" + newCategory + "'";
            SqlCommand checkID = new SqlCommand(CheckIDSQLString, dbConnection);
            SqlDataReader idRecord = checkID.ExecuteReader();
            if (idRecord.Read())
            {
                SkillAddConfirm.Text = "New Skill Category has been added successfully.";
                newID = Convert.ToInt32(idRecord["CategoryID"]);
            }
            else
            {
                SkillAddConfirm.Text = "Failed to add new Skill Category!";
            }
            idRecord.Close();
        }
        catch (SqlException exception)
        {
            Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
        }
        finally
        {
            dbConnection.Close();
        }
        return newID;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SkillAddConfirm.Text = "";
        SkillDeleteConfirm.Text = "";
        SkillDefAddConfirm.Text = "";
        SkillDefDeleteConfirm.Text = "";
        SkillCatAddConfirm.Text = "";
        SkillCatDeleteConfirm.Text = "";

        if (Session["searchKey"] == null)
        {
            GridView2.Visible = false;
            GridView1.Visible = false;
            AddNewCategoryDefinition.Visible = false;
            AddNewSkillCategory.Visible = false;
        }
    }

    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName.Equals("NewSkillInsert"))
        {
            TextBox newCategory = GridView3.Controls[0].Controls[0].FindControl("NewSkillTextBox") as TextBox;
            add_skill(newCategory.Text);
            Session["searchKey"] = get_new_id(newCategory.Text);
            GridView3.DataBind();
            GridView1.Visible = true;
            GridView2.Visible = true;
            AddNewCategoryDefinition.Visible = true;
            AddNewSkillCategory.Visible = true;
        }
    }

    protected void AddNewCategoryDefinition_Click(object sender, EventArgs e)
    {
        GridView1.ShowFooter = true;
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("NewCatInsert"))
        {
            TextBox newCategoryLabel = GridView1.FooterRow.FindControl("NewCategoryTextBox") as TextBox;
            DropDownList newDataType = GridView1.FooterRow.FindControl("NewSkillCategoryDropDown") as DropDownList;
            CheckBox newRequiredInd = GridView1.FooterRow.FindControl("NewRequiredCheckBox") as CheckBox;
            int DTid = get_DataTypeID(newDataType.SelectedItem.Text);
            add_cat_definition(newCategoryLabel.Text, DTid, newRequiredInd.Checked, Convert.ToInt32(Session["searchKey"]));
            GridView1.ShowFooter = false;
            GridView1.DataBind();
        }
        else if(e.CommandName.Equals("EmptyCatInsert"))
        {
            TextBox newCategoryLabel = GridView1.Controls[0].Controls[0].FindControl("EmptyCatDefinition") as TextBox;
            DropDownList newDataType = GridView1.Controls[0].Controls[0].FindControl("EmptyDataTypeDropDown") as DropDownList;
            CheckBox newRequiredInd = GridView1.Controls[0].Controls[0].FindControl("EmptyReqInd") as CheckBox;
            int DTid = get_DataTypeID(newDataType.SelectedItem.Text);
            add_cat_definition(newCategoryLabel.Text, DTid, newRequiredInd.Checked, Convert.ToInt32(Session["searchKey"]));
            GridView1.DataBind();
        }
        else if(e.CommandName.Equals("Cancel"))
        {
            GridView1.ShowFooter = false;
        }
    }

    protected void AddNewSkillCategory_Click(object sender, EventArgs e)
    {
        GridView2.ShowFooter = true;
    }


    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("NewCategorySkill"))
        {
            TextBox newCategorySkill = GridView2.FooterRow.FindControl("NewCategorySkillTextBox") as TextBox;
            add_category_skill(newCategorySkill.Text, Convert.ToInt32(Session["searchKey"]));
            GridView2.DataBind();
            GridView2.ShowFooter = false;
        }
        else if (e.CommandName.Equals("EmptyCategorySkill"))
        {
            TextBox newCategorySkill = GridView2.Controls[0].Controls[0].FindControl("EmptyCatSkillTextBox") as TextBox;
            add_category_skill(newCategorySkill.Text, Convert.ToInt32(Session["searchKey"]));
            GridView2.DataBind();
        }
        else if (e.CommandName.Equals("Cancel"))
        {
            GridView2.ShowFooter = false;
        }
    }
    protected void SqlDataSourceSkillCategory_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            SkillDeleteConfirm.Text = "Delete Failed! Please delete all Category Definitions and Category Skills first!";
        }
    }
    protected void SqlDataSourceSkillCategoryDefinitions_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            SkillDefDeleteConfirm.Text = "Delete Failed! This Category Definition is in use by other Skill Manager Function!";
        }
    }
    protected void SqlDataSourceSkillCategorySkills_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            SkillCatDeleteConfirm.Text = "Delete Failed! This Category Definition is in use by other Skill Manager Function!";
        }
    }
}