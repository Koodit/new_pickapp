class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @latest_room = Room.latest
    if current_user
      @preferred_rooms = current_user.preferred_rooms.active.map(&:room)
    end
  end

  def progetto
  end

  def regolamento
  end

  def contatti
  end
end
