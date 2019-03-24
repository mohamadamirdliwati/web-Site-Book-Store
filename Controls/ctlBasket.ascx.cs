using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_ctlBasket : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!clsGlobal.IsCustomer)
            Response.Redirect("~");

        FillData();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FillData();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        clsGlobal.RemoveFromBasket(int.Parse(e.Keys[0].ToString()));
        Page.Master.FindControl("ctlMenu1").DataBind();
        FillData();
    }
    protected void btnCommit_Click(object sender, EventArgs e)
    {
        AWPDataSetTableAdapters.SalesTableAdapter ta = new AWPDataSetTableAdapters.SalesTableAdapter();
        while(clsGlobal.Basket.Count>0)
        {
            AWPDataSet.Books_VRow b = (AWPDataSet.Books_VRow)clsGlobal.Basket.Rows[0];
            ta.Insert(b.BookID, clsGlobal.CurrentCustomer.CustomerID, DateTime.Now, b.BookPrice);
            clsGlobal.RemoveFromBasket(b.BookID);
        }
        Page.Master.FindControl("ctlMenu1").DataBind();
        FillData();
    }

    private void FillData()
    {
        GridView1.DataSource = clsGlobal.Basket;
        GridView1.DataBind();

        lblCount.Text = clsGlobal.Basket.Count.ToString();
        lblPrice.Text =string.Format("{0:c}", clsGlobal.Basket.Compute("Sum(BookPrice)",""));
    }
}