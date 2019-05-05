require 'one_signal'

class PickAppMailer < ApplicationMailer
  def send_email(to, subject, body, link, player_id)
    Rails.logger.info to
    Rails.logger.info subject
    Rails.logger.info body
    Rails.logger.info link
    Rails.logger.info player_id
    mail(to: to,
         subject: subject,
         body: body+"<br/><br/>"+link,
         content_type: 'text/html')

    #params = {
    #  app_id: 'bf81fd5f-ada4-41ef-bd01-b44ef4cafd45',
    #  headings: subject,
    #  contents: body,
    #  ios_badgeType: 'None',
    #  ios_badgeCount: 1,
    #  include_player_ids: [player_id]
    #}
   
    #response = OneSignal::Notification.create(params: params)
    #notification_id = JSON.parse(response.body)["id"]

  end
end