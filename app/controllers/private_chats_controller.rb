class PrivateChatsController < ApplicationController
  def show
    @travel_offer = Travel.find(params[:travel_id])
    @private_chat = PrivateChat.find(params[:id])
    @private_message = PrivateMessage.new
  end

  def create
    private_chat = PrivateChat.new travel_id: params[:travel_id]
    private_chat.passenger = current_user
    private_chat.driver_id = travel.driver_id
    if private_chat.save
      redirect_to room_travel_private_chat_path(travel.room, travel, private_chat)
    else
      redirect_to room_travel_path(travel.room, travel)
    end
  end

  private

  def travel
    Travel.find(params[:travel_id])
  end

  def is_driver
    Travel.find(params[:travel_id]).driver_id == current_user.id
  end
end