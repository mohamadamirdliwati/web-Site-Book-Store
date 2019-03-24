using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_ctlBookComments : System.Web.UI.UserControl
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
    protected void lnkAddComment_Click(object sender, EventArgs e)
    {
        TextBox txtComment = ((Control)sender).Parent.FindControl("txtCommentText") as TextBox;
        if (txtComment.Text != "")
        {
            AWPDataSetTableAdapters.BookCommentsTableAdapter ta = new AWPDataSetTableAdapters.BookCommentsTableAdapter();
            ta.Insert(int.Parse(BookID), clsGlobal.CurrentCustomer.CustomerID, txtComment.Text, DateTime.Now, null, null);
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        txtCommentText.Focus();
    }
}