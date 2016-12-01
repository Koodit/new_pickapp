class NotificationService
  def initialize
  end

  def title_for_private_message_from_driver
    I18n.t("notification.received_a_private_message_as_passenger.title")
  end

  def body_for_private_message_from_driver(name, surname, room_name)
    I18n.t("notification.received_a_private_message_as_passenger.body", name: name, surname: surname, room_name: room_name)
  end

  def link_for_private_message_from_driver(room_id, travel_id, private_chat_id)
    I18n.t("notification.received_a_private_message_as_passenger.link", room_id: room_id, travel_id: travel_id, private_chat_id: private_chat_id)
  end

  def title_for_private_message_from_passenger
    I18n.t("notification.received_a_private_message_as_driver.title")
  end

  def body_for_private_message_from_passenger(name, surname, room_name)
    I18n.t("notification.received_a_private_message_as_driver.body", name: name, surname: surname, room_name: room_name)
  end

  def link_for_private_message_from_passenger(room_id, travel_id, private_chat_id)
    I18n.t("notification.received_a_private_message_as_driver.link", room_id: room_id, travel_id: travel_id, private_chat_id: private_chat_id)
  end

  def title_for_public_message_for_driver
    I18n.t("notification.received_a_public_message_as_driver.title")
  end

  def body_for_public_message_for_driver(name, surname, room_name)
    I18n.t("notification.received_a_public_message_as_driver.body", name: name, surname: surname, room_name: room_name)  
  end

  def link_for_public_message_for_driver(room_id, travel_id)
    I18n.t("notification.received_a_public_message_as_driver.link", room_id: room_id, travel_id: travel_id)
  end

  def title_for_public_message_for_non_driver
    I18n.t("notification.received_a_public_message_as_non_driver.title")
  end

  def body_for_public_message_for_non_driver(name, surname)
    I18n.t("notification.received_a_public_message_as_non_driver.body", name: name, surname: surname)
  end

  def link_for_public_message_for_non_driver(room_id, travel_id)
    I18n.t("notification.received_a_public_message_as_non_driver.link", room_id: room_id, travel_id: travel_id)
  end

  ###################### Messaggi in chat TravelRequest

  def title_for_request_message_for_requester
    I18n.t("notification.received_a_travel_request_message_is_owner.title")
  end

  def body_for_request_message_for_requester(name, surname, room_name)
    I18n.t("notification.received_a_travel_request_message_is_owner.body", name: name, surname: surname, room_name: room_name)
  end

  def link_for_request_message_for_requester(room_id, travel_request_id)
    I18n.t("notification.received_a_travel_request_message_is_owner.link", room_id: room_id, travel_request_id: travel_request_id)
  end

  def title_for_request_message_for_non_requester
    I18n.t("notification.received_a_travel_request_message_not_owner.title")
  end

  def body_for_request_message_for_non_requester(name, surname, room_name)
    I18n.t("notification.received_a_travel_request_message_not_owner.body", name: name, surname: surname, room_name: room_name)
  end

  def link_for_request_message_for_non_requester(room_id, travel_request_id)
    I18n.t("notification.received_a_travel_request_message_not_owner.link", room_id: room_id, travel_request_id: travel_request_id)
  end

  ###################### Travel expired
  def title_for_expired_travel
    I18n.t("notification.travel_expired.title")
  end

  def body_for_expired_travel(room_name)
    I18n.t("notification.travel_expired.body", room_name: room_name)
  end

  def link_for_expired_travel(travel_id)
    I18n.t("notification.travel_expired.link", travel_id: travel_id)
  end

  def title_for_expired_travel_for_passenger
    I18n.t("notification.travel_expired_for_passenger.title")
  end

  def body_for_expired_travel_for_passenger(room_name)
    I18n.t("notification.travel_expired_for_passenger.body", room_name: room_name)
  end
  
  def link_for_expired_travel_for_passenger(travel_id)
    I18n.t("notification.travel_expired_for_passenger.link", travel_id: travel_id)
  end

  ###################### user applied for travel
  def title_for_user_applied_to_travel
    I18n.t("notification.user_applied_to_travel.title")
  end

  def body_for_user_applied_to_travel(name, surname, to_room, room_name)
    I18n.t("notification.user_applied_to_travel.body", name: name, surname: surname, to_room: to_room, room_name: room_name)
  end

  def link_for_user_applied_to_travel(room_id, travel_id)
    I18n.t("notification.user_applied_to_travel.link", room_id: room_id, travel_id: travel_id)
  end

  ###################### user approved by driver
  def title_for_user_approved_by_driver(name, surname)
    I18n.t("notification.user_approved_by_driver.title", name: name, surname: surname)
  end

  def body_for_user_approved_by_driver(name, surname, to_room, room_name)
    I18n.t("notification.user_approved_by_driver.body", name: name, surname: surname, to_room: to_room, room_name: room_name)
  end

  def link_for_user_approved_by_driver(room_id, travel_id)
    I18n.t("notification.user_approved_by_driver.link", room_id: room_id, travel_id: travel_id)
  end

  ###################### user received a review
  def title_for_received_review
    I18n.t("notification.user_received_review.title")
  end

  def body_for_received_review(name, surname)
    I18n.t("notification.user_received_review.body", name: name, surname: surname)
  end

  def link_for_received_review(review_id)
    I18n.t("notification.user_received_review.link", review_id: review_id)
  end

  ###################### review reminder
  def title_to_remind_review
    I18n.t("notification.remind_to_review.title")
  end

  def body_to_remind_review(name, surname)
    I18n.t("notification.remind_to_review.body", name: name, surname: surname)
  end

  def link_to_remind_review(review_id)
    I18n.t("notification.remind_to_review.link", review_id: review_id)
  end

end