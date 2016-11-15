class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @latest_room = Room.latest
    if current_user
      @preferred_rooms = current_user.preferred_rooms.active.map(&:room)
    end
  end
end