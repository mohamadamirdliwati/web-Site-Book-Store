using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_ctlBookEval : System.Web.UI.UserControl
{
    public string BookID
    {
        get
        {
            return txtBookID.Value;
        }
        set
        {
            txtBookID.Value = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lnkAddEvaluation_Click(object sender, EventArgs e)
    {
        RadioButtonList evalList = ((Control)sender).Parent.FindControl("lstEvaluation") as RadioButtonList;
        if (evalList.SelectedItem != null)
        {
            AWPDataSetTableAdapters.BookEvalsTableAdapter ta = new AWPDataSetTableAdapters.BookEvalsTableAdapter();
            ta.Insert(int.Parse(BookID), clsGlobal.CurrentCustomer.CustomerID, int.Parse(evalList.SelectedValue), DateTime.Now);
            lstEval.DataBind();
        }
    }
}