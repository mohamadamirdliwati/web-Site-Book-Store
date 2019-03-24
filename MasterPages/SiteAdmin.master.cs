using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_SiteAdmin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!clsGlobal.IsAdmin)
            Response.Redirect("~");
    }
    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        /*
        if (TreeView1.SelectedNode.Value != "")
            Response.Redirect(TreeView1.SelectedNode.Value);
        switch (TreeView1.SelectedNode.Value)
        {
            case "Add Books": Response.Redirect("~/Admin/Add_publisher.aspx"); break;
            case "Edit Books": Response.Redirect("~/Admin/Edit_book.aspx"); break;
            case "Add Author": Response.Redirect("~/Admin/Author_Publishert.aspx"); break;
            case "Edit Author": Response.Redirect("~/Admin/Author_Publishert.aspx"); break;
            case "Add Publisher": Response.Redirect("~/Admin/Author_Publishert.aspx"); break;
            case "Edit Publiser": Response.Redirect("~/Admin/Author_Publishert.aspx"); break;
            //case "Edit Customer": Response.Redirect("~/Admin/Edit_book.aspx"); break;
            case "View Author": Response.Redirect("~/Admin/view_authors.aspx"); break;
            case "Edit Catgories": Response.Redirect("~/Admin/Catgories.aspx"); break;
        }
         * */
    }
}
