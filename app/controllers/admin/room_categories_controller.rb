class Admin::RoomCategoriesController < AdminController
  before_action :set_room_category, except: [:index, :new, :create]

  def index
    @room_categories = RoomCategory.all
  end

  def show
  end

  def new
    @room_category = RoomCategory.new
  end

  def create
    @room_category = RoomCategory.new room_category_params
    if @room_category.save
      redirect_to admin_room_categories_path, notice: "Categoria stanze creata con successo"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room_category.update room_category_params
      redirect_to admin_room_categories_path, notice: "Categoria stanze aggiornata con successo"
    else
      render :edit
    end
  end

  def destroy
    if @room_category
      @room_category.destroy
      redirect_to admin_room_categories_path, notice: "Categoria stanze eliminata con successo"
    end
  end

  private

  def set_room_category
    @room_category = RoomCategory.find params[:id]
  end

  def room_category_params
    params.require(:room_category).permit(:name, :image)
  end
end
