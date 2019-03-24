using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_ctlBooks : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);
        if (!IsPostBack)
        {
            if (Request.QueryString["cid"] != null)
            {
                lstCategories.DataBind();
                for (int i = 0; i < lstCategories.Items.Count; i++)
                    if (lstCategories.Items[i].Value.Trim() == Request.QueryString["cid"].Trim())
                    {
                        lstCategories.SelectedValue = Request.QueryString["cid"];
                        break;
                    }

                Search();
            }

            if (Request.QueryString["pid"] != null)
            {
                lstPublisher.DataBind();
                for (int i = 0; i < lstPublisher.Items.Count; i++)
                    if (lstPublisher.Items[i].Value.Trim() == Request.QueryString["pid"].Trim())
                    {
                        lstPublisher.SelectedValue = Request.QueryString["pid"];
                        break;
                    }

                Search();
            }

            if (Request.QueryString["aid"] != null)
            {
                lstAuthors.DataBind();
                for (int i = 0; i < lstAuthors.Items.Count; i++)
                    if (lstAuthors.Items[i].Value.Trim() == Request.QueryString["aid"].Trim())
                    {
                        lstAuthors.SelectedValue = Request.QueryString["aid"];
                        break;
                    }

                Search();
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Search();
    }

    protected void Search()
    {
        odsBooks.DataBind();
    }
    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        (sender as DropDownList).Items.Insert(0, new ListItem("[All]", "0"));
    }

}