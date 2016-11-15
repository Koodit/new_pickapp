class RoomCategoriesController < ApplicationController
  def index
    @room_categories = RoomCategory.with_rooms
  end

  def show
    @room_category = RoomCategory.find params[:id]
  end
end