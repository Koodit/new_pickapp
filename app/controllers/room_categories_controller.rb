class RoomCategoriesController < ApplicationController
  def index
    @room_categories = RoomCategory.all.order(:name).with_rooms
  end

  def show
    @room_category = RoomCategory.find params[:id]
  end
end