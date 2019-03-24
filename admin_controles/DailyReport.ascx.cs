using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_controles_DailyReport : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DateTime t = DateTime.Today;
            t = t.AddDays(1 - t.Day);
            t = t.AddMonths(-1);
            txtFromDate.Text = string.Format("{0:dd-MM-yyyy}", t);
            t = t.AddMonths(1).AddDays(-1);
            txtToDate.Text = string.Format("{0:dd-MM-yyyy}", t);
        }
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        AWPDataSet.DailySalesDataTable dv = ((odsReport.Select() as DataView).Table) as AWPDataSet.DailySalesDataTable;
        GridView1.FooterRow.Cells[1].Text = string.Format("{0}", dv.Compute("Sum(SalesCount)", ""));
        GridView1.FooterRow.Cells[2].Text = string.Format("{0:c}", dv.Compute("Sum(TotalSales)", ""));
    }
}