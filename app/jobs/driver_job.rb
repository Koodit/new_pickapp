class DriverJob < ApplicationJob
  queue_as :default

  def perform(user_id, options)
    if options[:deny_driver]
      ApplicationMailer.deny_driver_email(user_id).deliver_now
    elsif options[:approve_driver]
      ApplicationMailer.approve_driver_email(user_id).deliver_now  
    end
  end
end
