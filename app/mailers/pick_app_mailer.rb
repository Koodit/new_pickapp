class PickAppMailer < ApplicationMailer
  def send_email(to, subject, body, link, player_id)

    # notify the player (this will fail because we haven't configured the app yet)
	params = {
	  app_id: "bf81fd5f-ada4-41ef-bd01-b44ef4cafd45",
	  headings: subject,
	  contents: body,
	  ios_badgeType: 'None',
	  ios_badgeCount: 1,
	  include_player_ids: [player_id]
	}

    response = OneSignal::Notification.create(params: params)
	notification_id = JSON.parse(response.body)["id"]

    mail(to: to,
         subject: subject,
         body: body+"<br/><br/>"+link,
         content_type: 'text/html')
  end
end