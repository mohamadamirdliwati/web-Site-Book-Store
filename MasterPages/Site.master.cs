using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_SiteMaster : System.Web.UI.MasterPage
{
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~");
    }
}

