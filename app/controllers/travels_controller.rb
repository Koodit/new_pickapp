class TravelsController < ApplicationController
  def show
    @travel = Travel.includes(:public_messages).find_by(id: params[:room_id])
    @public_message = PublicMessage.new
  end
end