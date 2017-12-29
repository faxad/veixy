using System;
using System.Web.Mail;

public class email_class : System.Web.UI.Page
{
    public email_class()
    {
    }
    public int send_email(string m_address, string m_subject, string m_msg)
    {
        MailMessage mailMsg = new MailMessage();
        mailMsg.From = "fawad@website.com";
        mailMsg.To = m_address;
        mailMsg.Subject = m_subject;
        mailMsg.BodyFormat = MailFormat.Text;
        mailMsg.Body = m_msg;
        mailMsg.Priority = MailPriority.High;
        SmtpMail.SmtpServer = "smtp.gmail.com";
        mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
        mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "xxxxx@gmail.com");
        mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "xxxxx");
        mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "465");
        mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", "true");
        try
        {
            SmtpMail.Send(mailMsg);
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }
        return 1;
    }
}