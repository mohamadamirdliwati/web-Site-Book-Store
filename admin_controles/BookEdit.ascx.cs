using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_controles_BookEdit : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            if (Request.QueryString["BookID"] == null)
                DetailsView1.ChangeMode(DetailsViewMode.Insert);
    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        SaveFile(Request.QueryString["BookID"].ToString());
    }
    private string SaveFile(string bookID)
    {
        string targetFile="";
        FileUpload f = DetailsView1.FindControl("fileCover") as FileUpload;
        if (f.FileName != "")
        {
            targetFile = string.Format(clsGlobal.BookCoverURL, bookID);
            f.SaveAs(Server.MapPath(targetFile));
        }
        return targetFile;
    }
    protected void odsBook_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        int bookID = ((e.ReturnValue as AWPDataSet.BooksDataTable).Rows[0] as AWPDataSet.BooksRow).BookID;
        SaveFile(bookID.ToString());
        Response.Redirect("~/Admin/BookEdit.aspx?bookid=" + bookID);
    }
}