using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class UserControls_u_login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HttpCookie cook = Request.Cookies["Login"];
            if (cook != null)
            {
                lstAuthLevel.SelectedValue = cook["AuthLevel"];
                txtUserName.Text = cook["UserName"];
                txtPassword.Focus();
            }
            else
                txtUserName.Focus();
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        AWPDataSetTableAdapters.loginTableAdapter ta = new AWPDataSetTableAdapters.loginTableAdapter();
        AWPDataSet.loginDataTable dt = ta.GetDataByCheck(txtUserName.Text, txtPassword.Text, lstAuthLevel.Text);
        if (dt == null || dt.Rows.Count == 0)
        {
            txtPassword.Focus();
            lblError.Text = "Please check the user name and the password.";
        }
        else
        {
            HttpCookie cook = new HttpCookie("Login");
            cook["UserName"] = txtUserName.Text;
            cook["AuthLevel"] = lstAuthLevel.SelectedValue;
            cook.Expires = DateTime.MaxValue;
            Response.Cookies.Add(cook);

            Session["CurrentUser"] = dt.Rows[0];

            if (!clsGlobal.IsAdmin)
            {
                AWPDataSetTableAdapters.CustomersTableAdapter cta = new AWPDataSetTableAdapters.CustomersTableAdapter();
                Session["CurrentCustomer"] = cta.GetDataByLoginID(clsGlobal.CurrentUser.loginID).Rows[0];
            }
            /*
            if (lstAuthLevel.SelectedValue == "Admin")
                Response.Redirect("~/Admin");
            else
                Response.Redirect("~");
             * */
        }

        
        
    }
    protected void lnkSignUp_Click(object sender, EventArgs e)
    {
        //Response.Redirect("SignUp.aspx");
    }
}