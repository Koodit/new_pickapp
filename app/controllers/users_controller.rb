class UsersController < ApplicationController
  def profile
    @user = current_user

    @travels_as_driver = travels_for_user_as_driver
    @travels_as_applied = travels_for_user_as_applied
    @travels_as_approved = travels_for_user_as_approved
    @travels_as_passenger = travels_for_user_as_passenger
  end

  private

  def travels_for_user_as_driver
    current_user.travels_as_driver
  end

  def travels_for_user_as_applied
    applied_users = current_user.applied_users
    travels = []
    applied_users.each do |au|
      travels << au.travel
    end
    travels
  end

  def travels_for_user_as_approved
    approved_users = current_user.approved_users
    travels = []
    approved_users.each do |au|
      travels << au.travel
    end
    travels
  end

  def travels_for_user_as_passenger
    passenger_travels = current_user.passenger_travels
    travels = []
    passenger_travels.each do |au|
      travels << au.travel
    end
    travels
  end
end