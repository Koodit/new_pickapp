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

  def search
    @filter = RoomFilter.new(params[:q])
    @travels = @room.travels.includes(:car, :driver).available_now.where(towards_room: @filter.towards_room)

    if @filter.flexible_departure
      @travels.each do |t|
        @travels = @travels - [t] if (t.has_not_flexible_departure)
      end
    end

    if @filter.can_repay
      @travels.each do |t|
        @travels = @travels - [t] if (t.cannot_repay)
      end
    end

    if @filter.can_smoke
      @travels.each do |t|
        @travels = @travels - [t] if (t.cannot_smoke)
      end
    end

    if @filter.animals_allowed
      @travels.each do |t|
        @travels = @travels - [t] if (t.animals_not_allowed)
      end
    end

    if @filter.is_recursive
      @travels.each do |t|
        @travels = @travels - [t] if (t.is_not_recursive)
      end
    end

    if @filter.min_departure_datetime
      @travels.each do |t|
        @travels = @travels - [t] if (t.departure_datetime < @filter.min_departure_datetime)
      end
    end

    if @filter.max_departure_datetime
      @travels.each do |t|
        @travels = @travels - [t] if (t.departure_datetime > @filter.max_departure_datetime)
      end
    end

    js min_departure_datetime: @filter.min_departure_datetime, max_departure_datetime: @filter.max_departure_datetime

    # if params[:only_with_review]
    #   travels_temp = []
    #   travels.each do |travel|
    #     if travel.driver.travel_reviews_as_target.where(made_by_driver: false).count > 0
    #       travels_temp << travel
    #     end
    #   end
    #   travels = travels_temp
    #   travels_temp = nil
    # end
  end

  private

  def set_room
    @room = Room.find params[:id]
  end
end