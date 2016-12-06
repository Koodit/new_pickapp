class Api::PrivateChatsController < ApplicationController

  def create
    private_chat = PrivateChat.new travel_id:params[:travel_id]
    if is_driver
      private_chat.driver = current_user
      private_chat.passenger_id = params[:user_id]
    else
      private_chat.passenger = current_user
      private_chat.driver_id = params[:user_id]
    end
    if private_chat.save
      render json: private_chat.id, root: false, status: 201
    else
      render :json => {:error => "Non è stato possibile creare la chat."}.to_json, :status => 500
    end
  end

  private
  def is_driver
    Travel.find(params[:travel_id]).driver_id == current_user.id
  end
end
