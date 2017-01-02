class NotificationWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 0

  def perform(event, emitter_id, receiver_id, options = {})
    if receiver_id.is_a? Array
      behave_as_array(event, emitter_id, receiver_id, options)
    else
      if options["travel_expired_for_driver"]
        notification_for_travel_completion(event, receiver_id, options)
      elsif options["user_applied_to_travel"]
        notification_for_applied_user(event, emitter_id, receiver_id, options)
      elsif options["user_approved_by_driver"]
        notification_for_user_approved_by_driver(event, emitter_id, receiver_id, options)
      elsif options["user_was_reviewed"]
        notification_for_received_review(event, emitter_id, receiver_id, options)
      elsif options["reminder_for_review"]
        notification_to_remind_review(event, emitter_id, receiver_id, options)
      else
        @notification = Notification.new
        notification_from_user?(emitter_id)
        set_notification_content(event, emitter_id, options)
        @notification.receiver_id = receiver_id
        @notification.save
      end
    end
  end

  private

  def behave_as_array(event, emitter_id, receiver_id, options)
    puts "Array Notification"
    if options["from_public_chat"]
      notifications_for_public_chat(event, emitter_id, receiver_id, options)
    elsif options["from_travel_request_chat"]
      notifications_for_travel_request_chat(event, emitter_id, receiver_id, options)
    else
      puts "Sbagliato qualcosa zio"
    end
  end

  def notification_for_travel_completion(event, receiver_id, options)
    travel = Travel.find(options["travel_id"])

    puts "APPROVED USERS: #{travel.approved_users.inspect}"
    puts "TRAVEL PASSENGERS: #{travel.passenger_travels.inspect}"

    if travel.approved_users.count == 0
      travel.destroy
      puts "DESTROYYYY"
    else
      if options["is_passenger"]
        puts "Travel marked as completed, notifications for passengers"
        @notification = Notification.new
        @notification.receiver_id = receiver_id
        ns = NotificationService.new
        @notification.title = ns.title_for_expired_travel_for_passenger
        @notification.body = ns.body_for_expired_travel_for_passenger(travel.room.name)
        @notification.link = ns.link_for_expired_travel_for_passenger(travel.room.id, travel.id)
        @notification.params = options
        @notification.save
        approved_user = ApprovedUser.find(options["approved_user_id"])
        approved_user.destroy
      else
        puts "Travel needs to be marked as completed, notification for driver"
        if options["completion_token"] == travel.completion_token
          travel.waiting_for_confirm = true
          if travel.save
            puts "Travel aggiornato"
          else
            travel.errors.full_messages.each do |msg|
              puts msg
            end
          end
          if travel.approved_users.count > 0
            @notification = Notification.new
            @notification.receiver_id = receiver_id
            ns = NotificationService.new
            @notification.title = ns.title_for_expired_travel
            @notification.body = ns.body_for_expired_travel(travel.room.name)
            @notification.link = ns.link_for_expired_travel(travel.room.id, travel.id)
            @notification.params = options
            @notification.save
          end
        end
      end
    end
  end

  def notification_for_applied_user(event, emitter_id, receiver_id, options)
    @notification = Notification.new
    @notification.receiver_id = receiver_id
    @notification.emitter_id = emitter_id
    ns = NotificationService.new

    travel = Travel.find(options["travel_id"])
    room = travel.room
    applied_user = User.find(emitter_id)

    applied_user_for_notification = AppliedUser.where(user_id: emitter_id).where(travel_id: travel.id).first

    @notification.title = ns.title_for_user_applied_to_travel
    @notification.body = ns.body_for_user_applied_to_travel(applied_user.name, applied_user.surname, travel.towards_room ? "verso" : "da", room.name)
    @notification.link = ns.link_for_user_applied_to_travel(room.id, travel.id)
    @notification.params = options
    if @notification.save
      puts "applied user: #{applied_user_for_notification.user_id}"
      puts "notification: #{@notification.id}"
      applied_user_for_notification.notification_id = @notification.id
      applied_user_for_notification.save
      puts "salva l'id? #{applied_user_for_notification.notification_id}"
    end
  end

  def notification_for_user_approved_by_driver(event, emitter_id, receiver_id, options)
    @notification = Notification.new
    @notification.receiver_id = receiver_id
    @notification.emitter_id = emitter_id
    ns = NotificationService.new

    travel = Travel.find(options["travel_id"])
    room = travel.room
    driver = User.find(emitter_id)

    @notification.title = ns.title_for_user_approved_by_driver(driver.name, driver.surname)
    @notification.body = ns.body_for_user_approved_by_driver(driver.name, driver.surname, travel.towards_room ? "verso" : "da", room.name)
    @notification.link = ns.link_for_user_approved_by_driver(room.id, travel.id)
    @notification.params = options
    @notification.save
  end

  def notification_to_remind_review(event, emitter_id, receiver_id, options)

    puts "Notifica reminder per review"

    travel_review = TravelReview.find(options["travel_review_id"])

    if travel_review.to_be_written == false
      @notification = Notification.new
      @notification.receiver_id = receiver_id
      ns = NotificationService.new

      user_to_review = User.find(options["user_to_review_id"])

      @notification.title = ns.title_to_remind_review
      @notification.body = ns.body_to_remind_review(user_to_review.name, user_to_review.surname)
      @notification.link = ns.link_to_remind_review(options["travel_review_id"])
      @notification.params = options
      @notification.save
    end
  end

  def notification_for_received_review(event, emitter_id, receiver_id, options)
    @notification = Notification.new
    @notification.receiver_id = receiver_id
    @notification.emitter_id = emitter_id
    ns = NotificationService.new

    reviewer = User.find(emitter_id)

    @notification.title = ns.title_for_received_review
    @notification.body = ns.body_for_received_review(reviewer.name, reviewer.surname)
    @notification.link = ns.link_for_received_review(options["travel_review_id"])
    @notification.params = options
    @notification.save
  end

  def notifications_for_travel_request_chat(event, emitter_id, receiver_id, options)
    travel_request = TravelRequest.find(options["travel_request_id"])
    room = travel_request.room
    emitter = User.find(emitter_id)
    ns = NotificationService.new
    @notification = Notification.new
    travel_request.travel_request_chat_partecipants.each do |partecipant|
      unless partecipant.user_id == emitter_id
        if partecipant.user_id == options["owner_id"]
          @notification.title = ns.title_for_request_message_for_requester
          @notification.body = ns.body_for_request_message_for_requester(emitter.name, emitter.surname, room.name)
          @notification.link = ns.link_for_request_message_for_requester(room.id, travel_request.id)
        else
          @notification.title = ns.title_for_request_message_for_non_requester
          @notification.body = ns.body_for_request_message_for_non_requester(emitter.name, emitter.surname, room.name)
          @notification.link = ns.link_for_request_message_for_non_requester(room.id, travel_request.id)
        end
        notification_from_user?(partecipant.user.id)
        @notification.receiver_id = partecipant.user.id
        @notification.save
      end
    end
  end

  def notifications_for_public_chat(event, emitter_id, receiver_id, options)
    travel = Travel.find(options["travel_id"])
    room = travel.room
    emitter = User.find(emitter_id)
    ns = NotificationService.new
    @notification = Notification.new
    @notification.is_message = true
    travel.public_chat_partecipants.each do |partecipant|
      unless partecipant.user_id == emitter_id
        if partecipant.user_id == options["owner_id"]
          puts "Notifica Chat pubblica, per l'owner del viaggio"
          @notification.title = ns.title_for_public_message_for_driver
          @notification.body = ns.body_for_public_message_for_driver(emitter.name, emitter.surname, room.name)
          @notification.link = ns.link_for_public_message_for_driver(room.id, travel.id)
        else
          puts "Notifica Chat pubblica, non owner del viaggio"
          @notification.title = ns.title_for_public_message_for_non_driver
          @notification.body = ns.body_for_public_message_for_non_driver(emitter.name, emitter.surname)
          @notification.link = ns.link_for_public_message_for_non_driver(room.id, travel.id)
        end
        notification_from_user?(partecipant.user.id)
        @notification.receiver_id = partecipant.user.id
        @notification.save
      end
    end
  end

  def notification_from_user?(emitter_id)
    if emitter_id.nil?
      @notification.from_user = false
      @notification.icon = "http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png"
    else
      @notification.from_user = true
      @notification.emitter_id = emitter_id
      user = User.find(emitter_id)
      @notification.icon = "http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png" #user.profile_image.url
    end
  end

  def set_notification_content(event, emitter_id, options)
    if options["from_private_chat"]
      set_private_chat_notification_content(event, emitter_id, options)
    else
      notification_content = t("notification.#{event}")
      @notification.title = notification_content[:title]
      @notification.body = notification_content[:body]
      @notification.event = "notification:#{event}"
      @notification.params = options
      if notification_content.has_key?("link")
        @notification.params = notification_content[:link]
      end
    end
  end

  def set_private_chat_notification_content(event, emitter_id, options)
    pc = PrivateChat.find(options["private_chat_id"])
    travel = pc.travel
    room = travel.room
    emitter = User.find(emitter_id)
    ns = NotificationService.new
    @notification.is_message = true
    if options["from_driver"]
      puts "Notifica Chat privata, da driver a utente"
      @notification.title = ns.title_for_private_message_from_driver
      @notification.body = ns.body_for_private_message_from_driver(emitter.name, emitter.surname, room.name)
      @notification.link = ns.link_for_private_message_from_driver(room.id, travel.id, pc.id)
    else
      puts "Notifica Chat privata, da utente a driver"
      @notification.title = ns.title_for_private_message_from_passenger
      @notification.body = ns.body_for_private_message_from_passenger(emitter.name, emitter.surname, room.name)
      @notification.link = ns.link_for_private_message_from_passenger(room.id, travel.id, pc.id)
    end
    # @notification.title = options[:title]
    # @notification.body = options[:body]
    # @notification.link = options[:link]
  end
end
