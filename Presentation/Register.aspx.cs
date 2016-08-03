using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Registration
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void InitControl()
        { 
        
        }

        protected void ClearControl()
        { 
        
        }

        protected void btnRegister_Click(object sender, ImageClickEventArgs e)
        {
            User objUser = new User();
            UserFactory objUserFactory = new UserFactory();
            int result = 0;

            objUser.FirstName = txtFname.Text;
            objUser.LastName = txtLname.Text;
            objUser.Gender = Convert.ToInt32(rdoGender.SelectedValue);
            objUser.Email = Convert.ToString(txtEmail.Text);
            objUser.Password = Convert.ToString(txtPassword.Text);
            result = Convert.ToInt32(objUserFactory.SaveUser(objUser));
            if (result > 0)
            {
                Response.Redirect("~/Welcome.aspx");
            }
            else
            {
                spnMessage.InnerText = "Email is Already Exist";
            }
        }


    }
}