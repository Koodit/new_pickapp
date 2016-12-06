class Api::CarsController < Api::ApiController
  before_filter :authenticate_owner_user!
  before_filter :set_car, only: [:show, :update, :destroy]
  def index
    cars = current_user.cars
    render json: cars, root: false, status: 200
  end

  def index_slim
    cars = current_user.cars
    render json: cars, each_serializer: SlimCarSerializer, root: false, status: 200
  end

  def show
    render :json => @car, root: false
  end

  def create
    car = Car.new(car_params)
      if car.save
        current_user.car_count += 1
        current_user.save
        render json: current_user.car_count, status: 201
      else
        render :json => {:error => "Non è stato possibile creare l'auto."}.to_json, :status => 500
      end
  end

  def update
    if @car.update(car_params)
      render nothing:true, status: 200
    else
      render :json => {:error => "Non è stato possibile aggiornare l'auto"}.to_json, :status => 500
    end
  end

  def destroy
    @car.destroy
    current_user.car_count -= 1
    current_user.save
    cars = current_user.cars
    resp = {}
    resp[:cars] = cars
    resp[:user_car_count] = current_user.car_count
    render json: resp, root: false, status: 202
  end

  private

  def authenticate_owner_user!
    unless current_user.id == params[:user_id].to_i
      render :json => {:error => "Owner user only."}.to_json, :status => 403
    end
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:animals_allowed, :can_smoke, :cc, :model, :notes, :plate, :sits, :user_id)
  end
end
