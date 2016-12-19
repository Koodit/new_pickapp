class Api::RoomCategoriesController < Api::ApiController
  def index
    @room_categories = RoomCategory.all
    render json: @room_categories, each_serializer: SlimRoomCategorySerializer, root: false, status: 200
  end

  def show
    @room_category = RoomCategory.find(params[:id])
    render json: @room_category, root: false
  end  
end
