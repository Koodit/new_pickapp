class RoomsController < ApplicationController
  def show
    @room = Room.find params[:id]
    if @room.is_school
      if @room.school_room_partecipants.any? { |srp| srp.user_id != current_user.id } || current_user.role != "administrator"
        redirect_to room_category_path(@room.room_category), notice: "Non puoi accedere a questa stanza"
      end
    end

    js room: { latitude: @room.lat, longitude: @room.long }
  end
end