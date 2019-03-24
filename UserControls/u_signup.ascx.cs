using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_u_signup : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.loginTableAdapter ta = new AWPDataSetTableAdapters.loginTableAdapter();
            ta.SP_IN_Login(txtUserName.Text, txtPassword.Text, "Customer");

            int s = Convert.ToInt32(ta.select_login_ID());

            AWPDataSetTableAdapters.CustomersTableAdapter ta1 = new AWPDataSetTableAdapters.CustomersTableAdapter();
            ta1.SP_IN_Customer(txtEmail.Text, txtFullName.Text, Convert.ToInt32(lstGender.SelectedValue), DateTime.Parse(txtBirthDate.Text), Convert.ToInt32(lstNationality.SelectedValue), Convert.ToInt32(DropDownList4.SelectedValue), Convert.ToInt32(DropDownList5.SelectedValue), s, txtHoppies.Text);

            /* Login */
            AWPDataSet.loginDataTable dt = ta.GetDataByCheck(txtUserName.Text, txtPassword.Text, "Customer");

            HttpCookie cook = new HttpCookie("Login");
            cook["UserName"] = txtUserName.Text;
            cook["AuthLevel"] = "Customer";
            cook.Expires = DateTime.MaxValue;
            Response.Cookies.Add(cook);

            Session["CurrentUser"] = dt.Rows[0];

            if (!clsGlobal.IsAdmin)
            {
                AWPDataSetTableAdapters.CustomersTableAdapter cta = new AWPDataSetTableAdapters.CustomersTableAdapter();
                Session["CurrentCustomer"] = cta.GetDataByLoginID(clsGlobal.CurrentUser.loginID).Rows[0];
            }
            /* Login */

            //Label10.Text = "Saved";
            //Label10.Visible = true;
            Response.Redirect("~");
        }

        catch
        {
            Label10.Text = "False";
            Label10.Visible = true;
        }
    }
}