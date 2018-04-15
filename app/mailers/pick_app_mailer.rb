class PickAppMailer < ApplicationMailer
  def send_email(to, subject, body, link)
    mail(to: to,
         subject: subject,
         body: body+"<br/><br/>"+link,
         content_type: 'text/html')
  end
end