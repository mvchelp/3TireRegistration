using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Registration
{
    public partial class Forget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InitialControl()
        { 
        
        }

        protected void ClearControl()
        {
            txtEmail.Text = String.Empty;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            UserFactory objUserFactory = new UserFactory();
            int result = 0;
            result = (int)objUserFactory.ForgetEmail(txtEmail.Text);
            if (result > 0)
            {
                Sendemail(Convert.ToString(result));
                spnMessage.InnerText = "Check Email For Reset Password";
            }
            else
            {
                spnMessage.InnerText = "Please Enter Valid Email";
            }
            ClearControl();
        }

        public void Sendemail(String UserId)
        {
            string ActivationUrl;
            try
            {
                MailMessage message = new MailMessage();
                message.From = new MailAddress("rahul.raval868@gmail.com","Rahul");
                message.To.Add(txtEmail.Text);
                message.Subject = "Reset Email";
                ActivationUrl = Server.HtmlEncode("http://localhost:7478/ResetPassword?UserId=" + UserId);
                message.Body = "<a href='" + ActivationUrl + "'>Click Here to Reset Password</a>";
                message.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("rahul.raval868@gmail.com", "dream@ongc");
                smtp.EnableSsl = true;
                smtp.Send(message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}