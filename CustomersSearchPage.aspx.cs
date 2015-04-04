using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

public partial class CustomersSearchPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Form.DefaultButton = FindCusButton.UniqueID;
        //http://imar.spaanjaars.com/374/how-do-i-set-the-defaultfocus-or-defaultbutton-in-a-page-based-on-a-master-page-in-aspnet-20
        //Page.Form.DefaultFocus = TextBox1.ClientID
        //You can apply the same technique to set the DefaultButton but then you should use its UniqueID property:
        //Page.Form.DefaultButton = Button1.UniqueID
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.SelectedRow.Focus();
//        PlaceHolder1.Visible = !(GridView1.SelectedIndex > -1);
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex));
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        if (GridView1.SelectedIndex > -1)
        {

            string cuskey = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString();
            Session["cusID"] = cuskey;
            Response.Redirect("CustomerDetailPage.aspx");
        }
            
    }
    protected void NewCusButton_Click(object sender, EventArgs e)
    {
        Session["cusID"] = -1;
        Response.Redirect("CustomerDetailPage.aspx");

    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.FilterParameters.Clear();
        
   
        List<TextBox> listItem = new List<TextBox>() {txtCity,txtCustomerName,txtPostalCode,txtState};

        List<String> listNames = new List<String>() { "City", "CustomerName", "PostalCode", "StateProvince" };



        for (int i=0; i < listItem.Count();i++ )
        {
            TextBox txtbox = listItem[i];
            string txtboxname = listNames[i];
//string value1 = "'--Sql injection won't work here ;)";


            if (txtbox.Text != "")
//                SqlDataSource1.FilterParameters.Add(txtboxname, txtbox.Text);
                if (SqlDataSource1.FilterExpression.Length > 0)
                {

                    SqlDataSource1.FilterExpression = SqlDataSource1.FilterExpression + " and " + txtboxname + " LIKE '%" + txtbox.Text.Replace("'", "''").Replace("%", "[%]") + "%'";
                }
                else
                {
                    SqlDataSource1.FilterExpression = txtboxname + " LIKE '%" + txtbox.Text.Replace("'", "''").Replace("%", "[%]") + "%'";
                }
            

        }
        if (SqlDataSource1.FilterExpression.Length > 0)
        {
            try {
                SqlDataSource1.DataBind();
                GridView1.DataBind();
            }
            catch (Exception) {
//             if (x.Message.Contains("The expression contains an invalid string constant"))
//             {
                SqlDataSource1.FilterExpression = "";
                SqlDataSource1.DataBind();
                GridView1.DataBind();
//             }
//             else
//             {
//              throw x;
//             }
            }


        }
    }
    protected void Button2_PreRender(object sender, EventArgs e)
    {
        if (GridView1.SelectedIndex == -1)             //On this pre-render event I'm checking if a row selection has
        {                                              //been made, otherwise I'm overriding the OnClick event to call
            Button2.Attributes.Add("onclick", "alert('Please select an existing Customer first...');");  //the JavaScript pop-up message.  This only persists during
        } //the page render... When refreshed will use regular onclick event...
        else
        {
            Button2.Attributes.Remove("onclick");
        }
    }

}

