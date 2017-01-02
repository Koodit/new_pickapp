class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@pick-app.it'
  layout 'mailer'

  def approve_driver_email(user_id)
    user = User.find(user_id)
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end

  def deny_driver_email(user_id)
    user = User.find(user_id)
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end

  def travel_completition_email(user_id, room_id, travel_id)
    user = User.find(user_id)
    room = Room.find(room_id)
    travel = Travel.find(travel_id)
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end

  def applied_user_email(receiver_id, emitter_id, room_id, travel_id)
    receiver = User.find(receiver_id)
    emitter = User.find(emitter_id)
    room = Room.find(room_id)
    travel = Travel.find(travel_id)
    mail(to: receiver.email, subject: 'Welcome to My Awesome Site')
  end

  def approved_user_email(user_id, emitter_id, room_id, travel_id)
    user = User.find(user_id)
    emitter = User.find(emitter_id)
    room = Room.find(room_id)
    travel = Travel.find(travel_id)
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end
end
