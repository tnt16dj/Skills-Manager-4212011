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

    private void add_pe()
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string insertString = @"INSERT INTO EmployeePreviousEmployers (EmployeeID, CompanyName, Title, Address1, Address2, City, StateProvince, PostalCode, CountryRegion, Phone, StartDate, EndDate, ContactName) VALUES ('"+Session["empId"]+"','" + PEDCompanyName.Text + "','" + PEDTitle.Text + "','" + PEDAdd1.Text + "','" + PEDAdd2.Text + "','" + PEDCity.Text + "','" + PEDState.Text + "','" + PEDZip.Text + "','" + PEDCountry.Text + "','" + PEDPhone.Text + "','" + PEDSD.Text + "','" + PEDED.Text + "','" + PEDSuper.Text + "')";
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

    private void update_pe()
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string updateString = @"UPDATE EmployeePreviousEmployers SET CompanyName ='"+PEDCompanyName.Text+"', Title ='"+PEDTitle.Text+"', Address1 ='"+PEDAdd1.Text+"', Address2 ='"+PEDAdd2.Text+"', City ='"+PEDCity.Text+"', StateProvince ='"+PEDState.Text+"', PostalCode ='"+PEDZip.Text+"', CountryRegion ='"+PEDCountry.Text+"', Phone ='"+PEDPhone.Text+"', StartDate ='"+PEDSD.Text+"', EndDate ='"+PEDED.Text+"', ContactName ='"+PEDSuper.Text+"' WHERE EmployeePreviousEmployersID="+Session["prevEmpId"];
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

    private string load_prevEmp(int ind)
    {
        string prevEmpId = null;

        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string SQLString = "SELECT * from EmployeePreviousEmployers WHERE EmployeePreviousEmployersID=" + ind;
            SqlCommand load=new SqlCommand(SQLString,dbConnection);
            SqlDataReader loadRecord=load.ExecuteReader();
            if (loadRecord.Read())
            {
                prevEmpId = Convert.ToString(loadRecord["EmployeePreviousEmployersID"]);
                PEDCompanyName.Text = Convert.ToString(loadRecord["CompanyName"]);
                PEDTitle.Text = Convert.ToString(loadRecord["Title"]);
                PEDAdd1.Text = Convert.ToString(loadRecord["Address1"]);
                PEDAdd2.Text = Convert.ToString(loadRecord["Address2"]);
                PEDCity.Text = Convert.ToString(loadRecord["City"]);
                PEDState.Text = Convert.ToString(loadRecord["StateProvince"]);
                PEDZip.Text = Convert.ToString(loadRecord["PostalCode"]);
                PEDCountry.Text = Convert.ToString(loadRecord["CountryRegion"]);
                PEDPhone.Text = Convert.ToString(loadRecord["Phone"]);
                PEDSD.Text = Convert.ToString(loadRecord["StartDate"]);
                PEDED.Text = Convert.ToString(loadRecord["EndDate"]);
                PEDSuper.Text = Convert.ToString(loadRecord["ContactName"]);
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
        return prevEmpId;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        int prevEmpIndex;
        string prevEmpId;

        if (Session["prevEmpID"] != "")
        {
            prevEmpIndex = Convert.ToInt16(Session["prevEmpID"]);
            if (prevEmpIndex != 0)
            {
                addnew = false;
                if (!IsPostBack)
                {
                    prevEmpId = load_prevEmp(prevEmpIndex);
                }
            }
        }
        if (addnew == true)
        {
            prevEmpDeleteButton.Visible = false;
        }
        //          Response.Write("<p>prevEmpId=" + Session["prevEmpId"] + "</p>");
        //          Response.Write("<p>empId=" + Session["empId"] + "</p>");
    }
   
    protected void peSubmitButton_Click(object sender, EventArgs e)
    {
        if (addnew == true)
        {
            add_pe();
        }
        else
        {
            update_pe();
        } 
        Response.Redirect("EmployeeDetailPage.aspx");
    }
    protected void prevEmpDeleteButton_Click(object sender, EventArgs e)
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            string deleteString = @"DELETE FROM EmployeePreviousEmployers WHERE EmployeePreviousEmployersID = "+Session["prevEmpId"];
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
