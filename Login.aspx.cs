using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.UrlReferrer != null)
                if (!Request.UrlReferrer.ToString().ToLower().Contains("login.aspx"))
                    Session["UrlReferrer"] = Request.UrlReferrer.ToString();

        }
        else
            goBack();  
    }
    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);
        goBack();
    }

    private void goBack()
    {
        if (clsGlobal.IsLogged)
        {
            if (Session["UrlReferrer"] != null)
                Response.Redirect(Session["UrlReferrer"].ToString());
            else
                Response.Redirect("~");
        }    
    }
}