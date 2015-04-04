using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    private void add_cus()
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            //                string insertString = @"INSERT INTO Customer (CustomerID, CustomerName, CustomerNameExcludedFromReports, Address1, Address2, City, StateProvince, PostalCode, CountryRegion, Phone, Fax, WebSite,Description) VALUES ('" + CusFirstName.Text + "','" + CusLastName.Text + "','" + CusTitle.Text + "','" + CusPhone.Text + "','" + CusFax.Text + "','" + CusEmail.Text + "')";
            string insertString = @"INSERT INTO Customer (CustomerName,CustomerNameExcludedFromReports,Address1,Address2,City,StateProvince,PostalCode,CountryRegion,Phone,Fax,WebSite,Description) VALUES ('" + cusCustomerName.Text + "','" +
            cusCustomerNameExcludedFromReports.Checked + "','" +
            cusAddress1.Text.Replace("'", "''") + "','" +
            cusAddress2.Text.Replace("'", "''") + "','" +
            cusCity.Text.Replace("'", "''") + "','" +
            cusStateProvince.Text.Replace("'", "''") + "','" +
            cusPostalCode.Text.Replace("'", "''") + "','" +
            cusCountryRegion.Text.Replace("'", "''") + "','" +
            cusPhone.Text.Replace("'", "''") + "','" +
            cusFax.Text.Replace("'", "''") + "','" +
            cusWebSite.Text.Replace("'", "''") + "','" +
            cusDescription.Text.Replace("'", "''") + "')";

            //CustomerID, CustomerName, CustomerNameExcludedFromReports, Address1, Address2, City, StateProvince, PostalCode, CountryRegion, Phone, Fax, WebSite
            SqlCommand addCus = new SqlCommand(insertString, dbConnection);
            addCus.ExecuteNonQuery();
            string SQLString = "SELECT @@Identity [rownum]";
            SqlCommand load = new SqlCommand(SQLString, dbConnection);
            SqlDataReader loadRecord = load.ExecuteReader();
            if (loadRecord.Read())
            {

                Session["cusID"] = Convert.ToInt16(Convert.ToString(loadRecord["rownum"])); ;
            }
            loadRecord.Close();
            Response.Redirect(System.IO.Path.GetFileName(Request.PhysicalPath));

            //Response.Write("<P>SAVED SUCCESSFULLY</P>");
        }
        catch (SqlException exception)
        {
            displayerror("Error code "
                + exception.Number + ": "
                + exception.Message);
        }
        finally
        {
            dbConnection.Close();
        }
    }

    private void update_cus(int ind)
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            //                string updateString = @"UPDATE Cusloyee SET FirstName ='" + CusFirstName.Text + "', LastName ='" + CusLastName.Text + "', Title ='" + CusTitle.Text + "', Phone ='" + CusPhone.Text + "', Fax ='" + CusFax.Text + "', Email ='" + CusEmail.Text + "' WHERE CusloyeeID=" + Session["CusId"];
            string updateString = @"UPDATE Customer SET CustomerName='" + cusCustomerName.Text.Replace("'", "''") +
             "', CustomerNameExcludedFromReports='" + cusCustomerNameExcludedFromReports.Checked +
             "', Address1='" + cusAddress1.Text.Replace("'", "''") +
             "', Address2='" + cusAddress2.Text.Replace("'", "''") +
             "', City='" + cusCity.Text.Replace("'", "''") +
             "', StateProvince='" + cusStateProvince.Text.Replace("'", "''") +
             "', PostalCode='" + cusPostalCode.Text.Replace("'", "''") +
             "', CountryRegion='" + cusCountryRegion.Text.Replace("'", "''") +
             "', Phone='" + cusPhone.Text.Replace("'", "''") +
             "', Fax='" + cusFax.Text.Replace("'", "''") +
             "', WebSite='" + cusWebSite.Text.Replace("'", "''") +
             "', Description='" + cusDescription.Text.Replace("'", "''") + "' WHERE CustomerID=" + ind;

            SqlCommand updateCus = new SqlCommand(updateString, dbConnection);
            if (updateCus.ExecuteNonQuery() > 0)
            {
                //                    displayerror("<P>update successfull</p>");
                Response.Redirect("CustomersSearchPage.aspx");
            }
            else
            {
                displayerror("Update not successfull, No records were updated.");
            }

        }
        catch (SqlException exception)
        {
            displayerror("Error code "
                + exception.Number + ": "
                + exception.Message);
        }
        finally
        {
            dbConnection.Close();
        }
    }
    private void delete_cus(int ind)
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        try
        {
            dbConnection.Open();
            //                string updateString = @"UPDATE Cusloyee SET FirstName ='" + CusFirstName.Text + "', LastName ='" + CusLastName.Text + "', Title ='" + CusTitle.Text + "', Phone ='" + CusPhone.Text + "', Fax ='" + CusFax.Text + "', Email ='" + CusEmail.Text + "' WHERE CusloyeeID=" + Session["CusId"];
            string updateString = @"Delete from Customer WHERE CustomerID=" + ind;

            SqlCommand updateCus = new SqlCommand(updateString, dbConnection);
            if (updateCus.ExecuteNonQuery() > 0)
            {
                //                    displayerror("<P>Delete successfull</p>");
                Response.Redirect("CustomersSearchPage.aspx");
            }
            else
            {
                displayerror("Delete not successfull, No records were updated.");
            }

        }
        catch (SqlException exception)
        {
            if (exception.Number == 547) //The DELETE statement conflicted with the REFERENCE constraint "FK_CustomerContact_Customer". The conflict occurred in database "C:\USERS\OFIR\DOCUMENTS\SCHOOL\PROG FOR INTERNET\PROJECT\PROJECTNEW\SKILLS MANAGER 522011\APP_DATA\SKILLSMANAGER.MDF", table "dbo.CustomerContact", column 'CustomerID'. The statement has been terminated.
            {
                displayerror( "You must delete all contacts before deleting the customer.");
            }
            else
            {
                displayerror("Error code "
                 + exception.Number + ": "
                 + exception.Message);
            }
        }
        finally
        {
            dbConnection.Close();
        }
    }

    private int load_cus(int ind)
    {
        SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\SkillsManager.mdf;Integrated Security=True;User Instance=True");
        int cus = -3;
        try
        {
            dbConnection.Open();
            string SQLString = "SELECT * from Customer WHERE CustomerID=" + ind;
            SqlCommand load = new SqlCommand(SQLString, dbConnection);
            SqlDataReader loadRecord = load.ExecuteReader();
            if (loadRecord.Read())
            {
                cusCustomerName.Text = Convert.ToString(loadRecord["CustomerName"]);
                cusCustomerNameExcludedFromReports.Checked = Convert.ToBoolean(Convert.ToString(loadRecord["CustomerNameExcludedFromReports"]));
                cusAddress1.Text = Convert.ToString(loadRecord["Address1"]);
                cusAddress2.Text = Convert.ToString(loadRecord["Address2"]);
                cusCity.Text = Convert.ToString(loadRecord["City"]);
                cusStateProvince.Text = Convert.ToString(loadRecord["StateProvince"]);
                cusPostalCode.Text = Convert.ToString(loadRecord["PostalCode"]);
                cusCountryRegion.Text = Convert.ToString(loadRecord["CountryRegion"]);
                cusPhone.Text = Convert.ToString(loadRecord["Phone"]);
                cusFax.Text = Convert.ToString(loadRecord["Fax"]);
                cusWebSite.Text = Convert.ToString(loadRecord["WebSite"]);
                cusDescription.Text = Convert.ToString(loadRecord["Description"]);
                cus = Convert.ToInt16(Convert.ToString(loadRecord["CustomerID"]));
                Session["cusID"] = cus;
            }
            loadRecord.Close();
        }
        catch (SqlException exception)
        {
            displayerror("Error code " + exception.Number + ": " + exception.Message);
        }
        catch (Exception exception)
        {
            displayerror("Error: " + exception.Message);
        }
        finally
        {
            dbConnection.Close();
        }
        return cus;
    }



    protected void Page_Load(object sender, EventArgs e)
    {
       
        int cusIndex;
        try
        {
            cusIndex = Convert.ToInt16(Session["cusID"]);
        }
        catch (Exception)
        {
            cusIndex = -1;
        }
        if (cusIndex != -1)
        {
            if (!IsPostBack)
            {
                load_cus(cusIndex);
            }
        }
        if (cusIndex > 0)
        {
            SubmitCustomer.Text = "Save";
        }
        else
        {
            SubmitCustomer.Text = "Add";
        }
        Session["cusID"] = cusIndex;
        SqlDataSource1.InsertParameters["CustomerID"].DefaultValue = cusIndex.ToString();
        SqlDataSource1.UpdateParameters["CustomerID"].DefaultValue = cusIndex.ToString();
    }


    protected void AddContact_Click(object sender, EventArgs e)
    {
        if (GridView1.EditIndex > -1)
        {
            try
            {
                GridView1.UpdateRow(GridView1.EditIndex, true);
            }
            catch (SqlException exception)
            {
                displayerror("Error code "
                + exception.Number + ": "
                + exception.Message);
            }
            catch (Exception exception)
            {
                displayerror(exception.Message);
            }
            
        }
        else
        {
            try
            {
                SqlDataSource1.InsertParameters["CustomerID"].DefaultValue = Session["cusID"].ToString(); //setup for the insert to work
                SqlDataSource1.Insert();
                //       GridView1.SelectedIndex = GridView1.Rows.Count;
                GridView1.EditIndex = GridView1.Rows.Count;

                //        ListBox1.Items.Add(TextBox4.Text);
            }
            catch (SqlException exception)
            {
                if (exception.Number == 547) //      Error code 547: The INSERT statement conflicted with the FOREIGN KEY constraint "FK_CustomerContact_Customer". The conflict occurred in database "C:\USERS\OFIR\DOCUMENTS\SCHOOL\PROG FOR INTERNET\PROJECT\PROJECTNEW\SKILLS MANAGER 552011\APP_DATA\SKILLSMANAGER.MDF", table "dbo.Customer", column 'CustomerID'. The statement has been terminated. 
                {
                    displayerror("Please make sure you have added the Customer first.");
                }
                else
                {
                    displayerror("Error code "
                    + exception.Number + ": "
                    + exception.Message);
                }
            }
            catch (Exception exception)
            {
                displayerror(exception.Message);
            }
            
        }

    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(GridView1, "Edit$" + e.Row.RowIndex));
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='yellow';this.style.cursor='pointer';");
            if (e.Row.RowState == DataControlRowState.Alternate)
            {
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + System.Drawing.ColorTranslator.ToHtml(((GridView)(e.Row.Parent.Parent)).AlternatingRowStyle.BackColor) + "';"); //this.style.cursor='default';
            }
            else if (e.Row.RowState == DataControlRowState.Selected)
            {
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + System.Drawing.ColorTranslator.ToHtml(((GridView)(e.Row.Parent.Parent)).SelectedRowStyle.BackColor) + "';"); //this.style.cursor='default';

            }
            else if ((e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == DataControlRowState.Insert || (e.Row.RowIndex == GridView1.EditIndex)))
            {
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + System.Drawing.ColorTranslator.ToHtml(((GridView)(e.Row.Parent.Parent)).EditRowStyle.BackColor) + "';"); //this.style.cursor='default';
                e.Row.Attributes.Remove("onclick");
                e.Row.Attributes.Remove("onmouseover");
                if (((TextBox)e.Row.Cells[2].Controls[1]).Text == "")
                { ///make sure to textbox validation control diffrent for each row.
                    ((Button)(e.Row.Cells[8].Controls[2])).Visible = false;
                    //                    ((Button)(e.Row.Cells[8].Controls[2])).Enabled = false;
                    //                    ((Button)(e.Row.Cells[8].Controls[2])).Attributes.Add("disabled", "true");
                }
            }
            else
            {
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + System.Drawing.ColorTranslator.ToHtml(((GridView)(e.Row.Parent.Parent)).RowStyle.BackColor) + "';"); //this.style.cursor='default';
            }
        }


    }
    protected void GridView1_SelectedIndexChanging(Object sender, GridViewSelectEventArgs e)
    {

        GridViewRow Row = GridView1.Rows[e.NewSelectedIndex];
        if (Row != null)
        {
            Row.Attributes.Remove("onmouseout");
            Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + System.Drawing.ColorTranslator.ToHtml(((GridView)(Row.Parent.Parent)).SelectedRowStyle.BackColor) + "';"); //this.style.cursor='default';
        }

        if (GridView1.SelectedIndex > -1)
        {
            if (GridView1.SelectedIndex == GridView1.EditIndex)
                //GridView1.UpdateRow(GridView1.SelectedIndex, false); //DONT UPDATE

                if (GridView1.SelectedIndex == e.NewSelectedIndex)
                {

                    GridView1.EditIndex = e.NewSelectedIndex;

                    GridView1.Rows[e.NewSelectedIndex].Attributes.Remove("onmouseout");
                    GridView1.Rows[e.NewSelectedIndex].Attributes.Remove("onmouseover");
                    GridView1.Rows[e.NewSelectedIndex].Attributes.Remove("onclick");//this.style.cursor='default';
                }
                else
                {


                    GridView1.EditIndex = -1;

                }



            Row = GridView1.Rows[GridView1.SelectedIndex];
            GridView1.SelectedIndex = e.NewSelectedIndex;
            if (Row != null)
            {
                Row.Attributes.Remove("onmouseout");
                if (Row.RowIndex == GridView1.EditIndex) //(Row.RowState == DataControlRowState.Edit || Row.RowState == DataControlRowState.Insert ||
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
    protected void SubmitCustomer_Click(object sender, EventArgs e)
    {
        int cus = -2;
        try
        {
            cus = Convert.ToInt16(Session["cusID"]);
        }
        catch (Exception)
        { }
        if (cus > 0)
            update_cus(cus);
        else
            add_cus();
    }
    protected void DeleteCustomer_Click(object sender, EventArgs e)
    {
        int cus = -2;
        try
        {
            cus = Convert.ToInt16(Session["cusID"]);
        }
        catch (Exception)
        { }
        delete_cus(cus);
    }
    protected void displayerror(string eror)
    {
        lblError.Visible = true;
        lblError.Focus();
//        lblError.Text = lblError.Text + eror + "<BR>";
        lblError.Text = eror;
    }




}
