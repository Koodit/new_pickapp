class TravelEmailJob < ApplicationJob
  queue_as :default

  def perform(user_id, options)
    if options[:for_travel_completion]
      ApplicationMailer.travel_completition_email(user_id, options[:room_id], options[:travel_id]).deliver_now
    elsif options[:for_applied_user]
      ApplicationMailer.applied_user_email(user_id, options[:emitter_id], options[:room_id], options[:travel_id]).deliver_now
    elsif options[:for_user_approved]
      ApplicationMailer.approved_user_email(user_id, options[:emitter_id], options[:room_id], options[:travel_id]).deliver_now
    end
  end
end
