using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsGlobal
/// </summary>
public class clsGlobal
{
	public clsGlobal()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public const string BookCoverURL = "~/Images_book/{0}.jpg";

    public static AWPDataSet.loginRow CurrentUser
    {
        get
        {
            return HttpContext.Current.Session["CurrentUser"] as AWPDataSet.loginRow;
        }
    }
    public static AWPDataSet.CustomersRow CurrentCustomer
    {
        get
        {
            return HttpContext.Current.Session["CurrentCustomer"] as AWPDataSet.CustomersRow;
        }
    }

    public static bool IsLogged
    {
        get
        {
            return CurrentUser != null;
        }
    }
    public static bool IsAdmin
    {
        get
        {
            return IsLogged && (CurrentUser.user_type == "Admin");
        }
    }
    public static bool IsCustomer
    {
        get
        {
            return IsLogged && (CurrentUser.user_type == "Customer");
        }
    }
    public static string CurrentUserName()
    {
        if (IsLogged)
            return CurrentUser.user_name;
        else
            return "";
    }


    public static AWPDataSet.Books_VDataTable Basket
    {
        get
        {
            AWPDataSet.Books_VDataTable dt = new AWPDataSet.Books_VDataTable();
            if (HttpContext.Current.Session["Basket"] != null)
                dt = HttpContext.Current.Session["Basket"] as AWPDataSet.Books_VDataTable;
            return dt;
        }
    }
    public static void AddToBasket(int bookID)
    {
        AWPDataSetTableAdapters.Books_VTableAdapter ta = new AWPDataSetTableAdapters.Books_VTableAdapter();
        AWPDataSet.Books_VRow r = ta.GetDataByBookID(bookID).Rows[0] as AWPDataSet.Books_VRow;
        AWPDataSet.Books_VDataTable dt = Basket;
        dt.Rows.Add(r.ItemArray);
        
        HttpContext.Current.Session["Basket"] = dt;
    }
    public static void RemoveFromBasket(int bookID)
    {
        AWPDataSet.Books_VDataTable dt = Basket;
        foreach (AWPDataSet.Books_VRow r in dt.Rows)
            if (r.BookID == bookID)
            {
                dt.Rows.Remove(r);
                break;
            }
    }
}