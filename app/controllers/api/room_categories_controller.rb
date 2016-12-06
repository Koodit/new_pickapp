class Api::RoomCategoriesController < Api::ApiController

  before_filter :set_room_category, only: [:show]
  before_filter :authenticate_admin_user!, only: [:create, :update]

  def index
    @room_categories = RoomCategory.all
    render :json => @room_categories, each_serializer: SlimRoomCategorySerializer, root: false, status: 200
  end

  def create
    room_category = RoomCategory.new name: params[:name]
    unless params[:image].nil?
      image = paperclip_object_from_base64(params[:image][:base64], params[:image][:filename], params[:image][:filetype])
      room_category.image = image
    end
    if room_category.save
      render json: room_category.id, root: false, status: 201
    else
      render :json => {:error => "Non è stato possibile creare la stanza"}.to_json, :status => 500
    end
  end

  def show
    render :json => @room_category, root: false
  end

  def update
    set_room_category
    unless params[:image].nil?
      image = paperclip_object_from_base64(params[:image][:base64], params[:image][:filename], params[:image][:filetype])
      @room_category.image = image
      @room_category.save
    end
    if @room_category.update(room_category_params)
      render :json => @room_category, root: false, status: 201
    else
      render :json => {:error => "Non è stato possibile aggiornare la stanza"}.to_json, :status => 500
    end
  end

  private

  def set_room_category
    @room_category = RoomCategory.find(params[:id])
  end

  def room_category_params
    params.require(:room_category).permit(:id, :name)
  end
  
end
