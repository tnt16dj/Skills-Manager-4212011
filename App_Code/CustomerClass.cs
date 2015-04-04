using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CustomerClass
/// </summary>
public class CustomerClass
{
    private string _name;
    private string _city;
    private string _state;
    private string _postal;
    private string _country;
    private string _phone;
    //http://webproject.scottgu.com/CSharp/Data/Data.aspx
    public List<CustomerClass> InsertCustomers()
    {
        List<CustomerClass> Customer = GetCustomers();
        Customer.Add(new CustomerClass("NEW", " ", " ", " ", " ", " "));

        return Customer;
    }
    public List<CustomerClass> InsertCustomers(string name, string city, string postal, string state, string country, string phone)
    {
        List<CustomerClass> Customer = GetCustomers();
        Customer.Add(new CustomerClass("NEW", " ", " ", " ", " ", " "));

        return Customer;
    }
    public List<CustomerClass> GetCustomers()
    {
        List<CustomerClass> Customer = new List<CustomerClass>();
        Customer.Add(new CustomerClass("Save-a-lot Markets", "Boise","ID", "83720","USA","(208) 555-8097"));
        Customer.Add(new CustomerClass("Save-a-lot Markets", "Boise", "ID", "83720", "USA", "(208) 555-8097"));
        Customer.Add(new CustomerClass("Save-a-lot Markets", "Boise", "ID", "83720", "USA", "(208) 555-8097"));
        Customer.Add(new CustomerClass("Save-a-lot Markets", "Boise", "ID", "83720", "USA", "(208) 555-8097"));

        return Customer;
    }


    public IOrderedEnumerable<CustomerClass> GetCustomers(String sortExpression)
    {
        List<CustomerClass> Customer = new List<CustomerClass>();
        Customer.Add(new CustomerClass("Save-a-lot Markets00000", "Boise2", "ID2", "837201", "USA1", "5(208) 555-8097"));
        Customer.Add(new CustomerClass("Save-a-lot Markets1", "Boise4", "ID4", "837203", "USA4", "3(208) 555-8097"));
        Customer.Add(new CustomerClass("Save-a-lot Markets3", "Boise5", "ID3", "837204", "USA5", "4(208) 555-8097"));
        Customer.Add(new CustomerClass("Save-a-lot Markets2", "Boise6", "ID1", "837202", "USA3", "1(208) 555-8097"));
       string[] search = sortExpression.Split(' ');
       string searchstring = search[0];
        if (search.Count() > 1)
        {
    
            searchstring = search[0];//(string) (x.GetType().GetField(searchstring, System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Instance)
            return Customer.OrderByDescending(x =>  searchstring);
//            return Customer.OrderByDescending(x => (x.GetType().FindMembers();
      
        }
        else if (search.Count() > 0)
        {
            searchstring = "x." + search[0];
            //this.GetType().FindMembers(string,System.Reflection.BindingFlags.Public, "","");
            return Customer.OrderBy(x => searchstring.ToString());
        }
        else return Customer.OrderBy(x => x.Name);
//        return (from entry in GetCustomers orderby entry.Value ascending select entry);
/*        switch (sortExpression)
        {  
          case "Name DESC":
                return Customer.OrderBy(x => x.Name);
            break;
            case "Name":
                return Customer.OrderByDescending (x => x.Name);
            break;
            case "City":
            return Customer.OrderBy(x => x.City);
            break;
            case "City DESC":
            return Customer.OrderByDescending(x => x.City);
            break;
            case "Phone":
            return Customer.OrderBy(x => x.Phone);
            break;
            case "Phone DESC":
            return Customer.OrderByDescending(x => x.Phone);
            break;
            case "Postal":
            return Customer.OrderBy(x => x.Postal);
            break;
            case "Postal DESC":
            return Customer.OrderByDescending(x => x.Postal);
            break;
            case "State":
            return Customer.OrderBy(x => x.State);
            break;
            case "State DESC":
            return Customer.OrderByDescending(x => x.State);
            break;
            case "Country":
            return Customer.OrderBy(x => x.Country);
            break;
            case "Country DESC":
            return Customer.OrderByDescending(x => x.Country);
            break;
            default:
            return Customer.OrderBy(x => x.Name);
            break;

        }
*/        
    }




       
    public CustomerClass(string name, string city,string postal,string state,string country,string phone)
    {
        this._name = name;
        this._city = city;
        this._postal = postal;
        this._state = state;
        this._country = country;
        this._phone = phone;
    }
    public string Name
    {
        get
        { return _name; }
        set
        { _name = value; }
    }
    public string City
    {
        get
        { return _city; }
        set
        { _city = value; }
    }
    public string State
    {
        get
        { return _state; }
        set
        { _state = value; }
    }
    public string Postal
    {
        get
        { return _postal; }
        set
        { _postal = value; }
    }
    public string Country
    {
        get
        { return _country; }
        set
        { _country = value; }
    }
    public string Phone
    {
        get
        { return _phone; }
        set
        { _phone = value; }
    }
	public CustomerClass()
	{
		//
		// TODO: Add constructor logic here
		//
	}

//    public Boolean AllowDuplicates
//   {
//        get
//        {
//            return (Boolean)ViewState["allowDuplicates"];
//        }
//        set
//        {
//            ViewState["allowDuplicates"] = value;
//        }
//    }
}
