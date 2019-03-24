using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_ctlAuthors : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            lstLetters.SelectedIndex = 0;
    }
    protected void lstLetters_SelectedIndexChanged(object sender, EventArgs e)
    {
        lstLetters.DataBind();
    }
}