class PickAppMailer < ApplicationMailer
  def welcome_email
    mail(to: 'roberto.vergallo@gmail.com',
         subject: 'Welcome to My Awesome Site',
         body: 'ciao',
         content_type: 'text/plain')
    puts 'Mail inviata'
  end

  def send_email(to, subject, body, link)
    mail(to: to,
         subject: subject,
         body: body+"\n\n"+link,
         content_type: 'text/plain')
    puts 'Mail inviata'
  end
end