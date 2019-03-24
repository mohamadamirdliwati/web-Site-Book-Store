using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class ctlMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected string GetImageName(string PageUrl)
        {
            return ResolveUrl( "~/images" + PageUrl.Replace(".aspx", ".png").Replace("~", ""));
        }
    
    }
