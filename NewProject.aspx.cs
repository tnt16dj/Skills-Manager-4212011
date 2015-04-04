using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
 

public partial class NewProject : System.Web.UI.Page
{
    Boolean addnew = true;
    /*int ind;
        private string load_proj()
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string SQLString = "SELECT * from Project WHERE ProjectID=" + ind;
            SqlCommand load = new SqlCommand(SQLString, dbConnection);
            SqlDataReader loadRecord = load.ExecuteReader();
            if (loadRecord.Read())
            {
                
                projectTitleTextBox.Text = Convert.ToString(loadRecord["Title"]);
                startDateTextBox.Text = Convert.ToString(loadRecord["DateStarted"]);
                endDateTextBox.Text = Convert.ToString(loadRecord["DateCompleted"]);
                descriptionTextBox.Text = Convert.ToString(loadRecord["Description"]);

            }
            loadRecord.Close();
        }
        catch (SqlException exception)
        {
            Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "<p>");
        }
        finally
        {
            dbConnection.Close();
        }
        return projectTitleTextBox.Text;

    }*/
    private string load_prevProj(int ind)
    {
        string prevProjId = null;

        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string SQLString = "SELECT * from Project WHERE ProjectID=" + ind;
            SqlCommand load = new SqlCommand(SQLString, dbConnection);
            SqlDataReader loadRecord = load.ExecuteReader();
            if (loadRecord.Read())
            {
                projectTitleTextBox.Text = Convert.ToString(loadRecord["Title"]);
                startDateTextBox.Text = Convert.ToString(loadRecord["DateStarted"]);
                endDateTextBox.Text = Convert.ToString(loadRecord["DateCompleted"]);
                descriptionTextBox.Text = Convert.ToString(loadRecord["Description"]);
                customerDropDownList.DataBind();

                try
                {
                    customerDropDownList.ClearSelection();
                        ListItem x = customerDropDownList.Items.FindByValue(loadRecord["CustomerID"].ToString());
                        if (x != null)
                            x.Selected = true;
                }
                catch (Exception) { }
                contactDropDownList.DataBind();
                try
                {
                    contactDropDownList.ClearSelection();
                    ListItem x = contactDropDownList.Items.FindByValue(loadRecord["ContactID"].ToString());
                    if (x != null)
                            x.Selected = true;
                }
                catch (Exception) { }
            }
            loadRecord.Close();

        }
        catch (SqlException exception)
        {
            Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "<p>");
        }
        finally
        {
            dbConnection.Close();
        }

        return prevProjId;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
      //  if (Session["ProjectID"] != "")
      //  {
      //      load_prevProj(Convert.ToInt16(Session["ProjectID"]));
      //  }
        int prevProjIndex;
        string prevProjId;

        if (Session["ProjectID"] != "")
        {
            prevProjIndex = Convert.ToInt16(Session["ProjectID"]);
            if (prevProjIndex != 0)
            {
                addnew = false;
                if (!IsPostBack)
                {
                    prevProjId = load_prevProj(prevProjIndex);
                }
            }
        }

    }

    protected void cancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Project.aspx");
    }

    private void updateProject()
    { 
                SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
                try
                {
                    dbConnection.Open();
                    string cusid = customerDropDownList.SelectedValue == null || customerDropDownList.SelectedValue == "" ? "null" : "'" + customerDropDownList.SelectedValue + "'";
                    string conid = contactDropDownList.SelectedValue == null || contactDropDownList.SelectedValue == "" ? "null" : "'" + contactDropDownList.SelectedValue + "'";
                    string updateProjectString = @"UPDATE Project SET CustomerID =" + cusid + ", ContactID =" + conid + ", Title ='" + projectTitleTextBox.Text + "', DateStarted ='" + startDateTextBox.Text + "', DateCompleted ='" + endDateTextBox.Text + "', Description ='" + descriptionTextBox.Text + "' WHERE ProjectID = '" + Session["ProjectID"] + "'";
                        SqlCommand updateProject = new SqlCommand(updateProjectString, dbConnection);
                    updateProject.ExecuteNonQuery();
                    Response.Redirect("Project.aspx");
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
    private void addProject()
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            Response.Write("Success, Connected to Database.\n");
            string cusid = customerDropDownList.SelectedValue == null || customerDropDownList.SelectedValue == "" ? "null" : "'" + customerDropDownList.SelectedValue + "'";
            string conid = contactDropDownList.SelectedValue == null || contactDropDownList.SelectedValue == "" ? "null" : "'" + contactDropDownList.SelectedValue + "'";
            //CustomerID ='" + customerDropDownList.SelectedValue + "', ContactID ='" + contactDropDownList.SelectedValue + "
            string projectInsertString = @"INSERT INTO Project (Title, DateStarted, DateCompleted, Description,CustomerID,ContactID) VALUES ('" + projectTitleTextBox.Text + "','" + startDateTextBox.Text + "','" + endDateTextBox.Text + "','" + descriptionTextBox.Text + "'," + cusid + "," + conid + ")";
            SqlCommand addProject = new SqlCommand(projectInsertString, dbConnection);
            addProject.ExecuteNonQuery();
//            Response.Write("Project Added");
            Response.Redirect("Project.aspx");
        }
        catch (SqlException exception)
        {
                Response.Write("The database is currently unavaible, please contact your Database Administrator with the following information: \n");
            Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
        }
        finally
        {
            dbConnection.Close();
        }
    }
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        if ((Session["ProjectID"] ==null ) || (Session["ProjectID"].ToString() == "-1") || (Session["ProjectID"].ToString() == ""))
        {
            addProject();
//            Response.Redirect("Project.aspx");
        }
        else
        {
            updateProject();
//            Response.Redirect("Project.aspx");
        }
           
    }

}
