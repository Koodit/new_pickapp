class RoomsController < ApplicationController
  before_action :set_room

  def show
    if @room.is_school
      if @room.school_room_partecipants.any? { |srp| srp.user_id != current_user.id } || current_user.role != "administrator"
        redirect_to room_category_path(@room.room_category), notice: "Non puoi accedere a questa stanza"
      end
    end

    @travel_requests = @room.travel_requests.next_24_hours
    @travel_offers = @room.travels.next_24_hours

    js room: { latitude: @room.lat, longitude: @room.long }
  end

  def set_favourite
    preferred_room = PreferredRoom.new user_id: current_user.id, room_id: @room.id
    if preferred_room.save
      redirect_to room_path(@room), notice: "Stanza aggiunta ai preferiti"
    else
      redirect_to room_path(@room), notice: "La stanza non è stata aggiunta ai preferiti"
    end
  end

  def unset_favourite
    preferred_room = current_user.preferred_rooms.where(room_id: @room.id).first
    preferred_room.destroy
    redirect_to room_path(@room), notice: "Stanza rimossa dai preferiti"
  end

  private

  def set_room
    @room = Room.find params[:id]
  end
end