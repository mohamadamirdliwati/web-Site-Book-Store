using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Comments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        AWPDataSetTableAdapters.BookCommentsTableAdapter ta = new AWPDataSetTableAdapters.BookCommentsTableAdapter();
        ta.UpdateApproved(e.CommandName == "Approve",int.Parse( e.CommandArgument.ToString()));
        GridView1.DataBind();
    }
}