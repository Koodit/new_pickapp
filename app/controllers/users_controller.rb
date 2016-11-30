class UsersController < ApplicationController
  def profile
    @travels_as_driver = travels_for_user_as_driver
    @travels_as_applied = travels_for_user_as_applied
    @travels_as_approved = travels_for_user_as_approved
    @travels_as_passenger = travels_for_user_as_passenger
  end

  def edit
  end

  def update
    if current_user.update user_params
      redirect_to profile_path, notice: "I tuoi dati sono stati aggiornati con successo"
    else
      render :edit
    end
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

  def user_params
    params.require(:user).permit(:address, :comune, :prov, :zip_code, :birth_date)
  end
end