class PickAppMailer < ApplicationMailer
  def send_email(to, subject, body, link)
    mail(to: to,
         subject: subject,
         body: body+"\n\n"+link,
         content_type: 'text/plain')
  end
end