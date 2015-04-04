using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    Boolean addnew = true;

    private void add_emp()
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string insertString = @"INSERT INTO Employee (FirstName, LastName, Title, Phone, Fax, Email) VALUES ('" + empFirstName.Text + "','" + empLastName.Text + "','" + empTitle.Text + "','" + empPhone.Text + "','" + empFax.Text + "','" + empEmail.Text + "')";
            SqlCommand addEmp = new SqlCommand(insertString, dbConnection);
            addEmp.ExecuteNonQuery();
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

    private void update_emp()
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string updateString = @"UPDATE Employee SET FirstName ='" + empFirstName.Text + "', LastName ='" + empLastName.Text + "', Title ='" + empTitle.Text + "', Phone ='" + empPhone.Text + "', Fax ='" + empFax.Text + "', Email ='" + empEmail.Text + "' WHERE EmployeeID=" + Session["empId"];
            SqlCommand updateEmp = new SqlCommand(updateString, dbConnection);
            updateEmp.ExecuteNonQuery();
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

    private string load_emp(int ind)
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string SQLString = "SELECT * from Employee WHERE EmployeeID=" + ind;
            SqlCommand load=new SqlCommand(SQLString,dbConnection);
            SqlDataReader loadRecord=load.ExecuteReader();
            if (loadRecord.Read())
            {
                empIdLabel.Text = Convert.ToString(loadRecord["EmployeeID"]);
                empFirstName.Text =Convert.ToString(loadRecord["FirstName"]);
                empLastName.Text =Convert.ToString(loadRecord["LastName"]);
                empTitle.Text =Convert.ToString(loadRecord["Title"]);
                empPhone.Text =Convert.ToString(loadRecord["Phone"]);
                empFax.Text =Convert.ToString(loadRecord["Fax"]);
                empEmail.Text =Convert.ToString(loadRecord["Email"]);
            }
            loadRecord.Close();
        }
        catch(SqlException exception)
        {
            Response.Write("<p>Error code "+exception.Number+": "+exception.Message+"<p>");
        }
        finally
        {
            dbConnection.Close();
        }
        return empIdLabel.Text;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        int empIndex;
        string empId;

        if (Session["empID"] != "")
        {
            empIndex = Convert.ToInt16(Session["empID"]);
            if (empIndex != 0)
            {
                addnew = false;
                if (!IsPostBack)
                {
                    empId = load_emp(empIndex);
                }
            }
        }
        if (addnew == true)
        {
            NewPrevEmpButton.Visible = false;
            AddSkillButton.Visible = false;
            DelEmpButton.Visible = false;
        }
        if (prevEmpGrid.Rows.Count == 0)
        {
            EditPrevEmpButton.Visible = false;
        }
        if (projEmpGrid.Rows.Count == 0)
        {
            projEmpGridButton.Visible = false;
        }
        if (prevProjEmpGrid.Rows.Count == 0)
        {
            prevProjEmpButton.Visible = false;
        }
        if (SkillGrid.Rows.Count == 0)
        {
            deleteSkillDetailButton.Visible = false;
        }
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        //TextBox1.Focus();
    }
    protected void AddEmpSubmitButton_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (IsValid)
        {
            if (addnew == true)
            {
                add_emp();
            }
            else
            {
                update_emp();
            }
            Response.Redirect("EmployeeSearchPage.aspx");
        }
    }

    protected void NewPrevEmpButton_Click(object sender, EventArgs e)
    {
        Session["prevEmpID"] = "";
        Response.Redirect("PrevEmployeeDetailPage.aspx");
    }
    protected void EditPrevEmpButton_Click(object sender, EventArgs e)
    {
        if (prevEmpGrid.SelectedIndex != -1)
        {
            Session["prevEmpID"] = prevEmpGrid.DataKeys[prevEmpGrid.SelectedIndex].Value;
            Response.Redirect("PrevEmployeeDetailPage.aspx");
        }
    }
    protected void EditPrevEmpButton_PreRender(object sender, EventArgs e)
    {
        if (prevEmpGrid.SelectedIndex == -1)             //On this pre-render event I'm checking if a row selection has
        {                                              //been made, otherwise I'm overriding the OnClick event to call
            EditPrevEmpButton.Attributes.Add("onclick", "prevEmpSelectAlert()");  //the JavaScript pop-up message.  This only persists during
        } //the page render... When refreshed will use regular onclick event...
        else
        {
            EditPrevEmpButton.Attributes.Remove("onclick");
        }
    }
    protected void deleteSkillDetailButton_PreRender(object sender, EventArgs e)
    {
        if (SkillGrid.SelectedIndex == -1)             //On this pre-render event I'm checking if a row selection has
        {                                              //been made, otherwise I'm overriding the OnClick event to call
            deleteSkillDetailButton.Attributes.Add("onclick", "empSkillSelectAlert()");  //the JavaScript pop-up message.  This only persists during
        } //the page render... When refreshed will use regular onclick event...
        else
        {
            deleteSkillDetailButton.Attributes.Remove("onclick");
            deleteSkillDetailButton.Attributes.Add("onclick", "return confirm('Are you sure you wish to delete this item?')");
        }
    }
    protected void prevEmpGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='yellow'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white'");
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(prevEmpGrid, "Select$" + (e.Row.RowIndex)));
        }
    }

    protected void prevEmpGrid_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        prevEmpGrid.SelectedIndex = e.NewSelectedIndex;  //Setting the selected index on a row click event...
        //       e.Cancel = true;                               //However, here I'm canceling the Selected Index Change Event
    } //so that we can still utilize the 'Search' button per the Use Case

    protected void projEmpGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='yellow'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white'");
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(projEmpGrid, "Select$" + (e.Row.RowIndex)));
        }
    }

    protected void projEmpGrid_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        projEmpGrid.SelectedIndex = e.NewSelectedIndex;  //Setting the selected index on a row click event...
        //       e.Cancel = true;                               //However, here I'm canceling the Selected Index Change Event
    } //so that we can still utilize the 'Search' button per the Use Case

    protected void prevProjEmpGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='yellow'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white'");
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(prevProjEmpGrid, "Select$" + (e.Row.RowIndex)));
        }
    }

    protected void prevProjEmpGrid_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        prevProjEmpGrid.SelectedIndex = e.NewSelectedIndex;  //Setting the selected index on a row click event...
        //       e.Cancel = true;                               //However, here I'm canceling the Selected Index Change Event
    } //so that we can still utilize the 'Search' button per the Use Case
    protected void SkillGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='yellow'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white'");
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(SkillGrid, "Select$" + (e.Row.RowIndex)));
        }
    }

    protected void SkillGrid_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        SkillGrid.SelectedIndex = e.NewSelectedIndex;  //Setting the selected index on a row click event...
        //       e.Cancel = true;                               //However, here I'm canceling the Selected Index Change Event
    } //so that we can still utilize the 'Search' button per the Use Case
    protected void AddSkillButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployeeSkillCatPage.aspx");
    }
    protected void deleteSkillDetailButton_Click(object sender, EventArgs e)
    {
        if (SkillGrid.SelectedIndex != -1)
        {
            SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
            try
            {
                dbConnection.Open();
                string deleteString = @"DELETE FROM SkillDetail WHERE SkillDetailID = " + SkillGrid.DataKeys[SkillGrid.SelectedIndex].Value;
                SqlCommand deleteEmp = new SqlCommand(deleteString, dbConnection);
                deleteEmp.ExecuteNonQuery();
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
    protected void DelEmpButton_Click(object sender, EventArgs e)
    {
        Boolean nodelete = false;

        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string deleteString = @"DELETE FROM Employee WHERE EmployeeID = " + Session["empId"];
            SqlCommand deleteEmp = new SqlCommand(deleteString, dbConnection);
            deleteEmp.ExecuteNonQuery();
        }
        catch (SqlException exception)
        {
            nodelete = true;
        }
        finally
        {
            dbConnection.Close();
        }
        if (nodelete == true)
        {
            deleteWarningLabel.Text = "Cannot delete. There are foreign keys!";
        }
        else
        {
            Response.Redirect("EmployeeSearchPage.aspx");
        }
    }
    protected void projEmpGridButton_Click(object sender, EventArgs e)
    {
        if (projEmpGrid.SelectedIndex != -1)
        {
            Session["ProjectID"] = projEmpGrid.DataKeys[projEmpGrid.SelectedIndex].Value;
            Response.Redirect("NewProject.aspx");
        }

    }
    protected void projEmpGridButton_PreRender(object sender, EventArgs e)
    {
        if (projEmpGrid.SelectedIndex == -1)             //On this pre-render event I'm checking if a row selection has
        {                                              //been made, otherwise I'm overriding the OnClick event to call
            projEmpGridButton.Attributes.Add("onclick", "empProjAlert()");  //the JavaScript pop-up message.  This only persists during
        } //the page render... When refreshed will use regular onclick event...
        else
        {
            projEmpGridButton.Attributes.Remove("onclick");
        }
    }
    protected void prevProjEmpButton_PreRender(object sender, EventArgs e)
    {
        if (prevProjEmpGrid.SelectedIndex == -1)             //On this pre-render event I'm checking if a row selection has
        {                                              //been made, otherwise I'm overriding the OnClick event to call
            prevProjEmpButton.Attributes.Add("onclick", "empProjAlert()");  //the JavaScript pop-up message.  This only persists during
        } //the page render... When refreshed will use regular onclick event...
        else
        {
            prevProjEmpButton.Attributes.Remove("onclick");
        }
    }

    protected void prevProjEmpButton_Click(object sender, EventArgs e)
    {
        if (prevProjEmpGrid.SelectedIndex != -1)
        {
            Session["ProjectID"] = prevProjEmpGrid.DataKeys[prevProjEmpGrid.SelectedIndex].Value;
            Response.Redirect("NewProject.aspx");
        }

    }
}
