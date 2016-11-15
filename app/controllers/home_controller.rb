class HomeController < ApplicationController
  def index
    @latest_room = Room.latest
    @preferred_rooms = current_user.preferred_rooms.map(&:room)
  end
end