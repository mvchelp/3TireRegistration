using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Registration
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InitControl()
        { 
        
        }

        protected void btnLogin_Click(object sender, ImageClickEventArgs e)
        {
            User objUser = new User();
            UserFactory objUserFactory = new UserFactory();
            int result = 0;

            objUser.Email = Convert.ToString(txtEmail.Text);
            objUser.Password = Convert.ToString(txtPassword.Text);
            result = (int)objUserFactory.ValidateUser(objUser);
            if (result > 0)
            {
                Response.Redirect("~/Profile.aspx");
            }
            else {
                spnError.InnerText = "Email or Password is Wrong";
            }

        }

        protected void btnSignUp_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }
    }
}