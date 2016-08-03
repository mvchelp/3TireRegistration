using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Registration
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["UserId"] != null)
            {
                User objUser = new User();
                UserFactory objUserFactory = new UserFactory();
                int result = 0;
                objUser.UserId = Convert.ToInt32(Request.QueryString["UserId"]);
                objUser.Password = Convert.ToString(txtNewPassword.Text);
                result = (int)objUserFactory.ResetPassword(objUser);
                if (result > 0)
                {
                    spnMessage.InnerText = "You have successfull Reset Password";
                    Response.Redirect("~/Profile.aspx");
                }
            }
        }
    }
}