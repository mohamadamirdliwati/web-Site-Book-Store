using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_ctlBook : System.Web.UI.UserControl
{

    public string BookID
    {
        get { return bookID.Value; }
        set
        {
            bookID.Value = value;
            if (!IsPostBack)
            {
                if (Session["Book_Read_" + BookID] == null)
                {
                    AWPDataSetTableAdapters.BooksTableAdapter ta = new AWPDataSetTableAdapters.BooksTableAdapter();
                    ta.UpdateReadCount(int.Parse(BookID));
                    Session["Book_Read_" + BookID] = "1";
                }
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void lnkBuy_Click(object sender, EventArgs e)
    {
        int bID = int.Parse(BookID);

        if (clsGlobal.Basket.FindByBookID(bID) == null)
        {
            clsGlobal.AddToBasket(bID);
            Page.Master.FindControl("ctlMenu1").DataBind();
        }
        else
        {
            (FormView1.FindControl("lblError")as Label).Text = "The Book is already in your basket!";
        }
    }
}