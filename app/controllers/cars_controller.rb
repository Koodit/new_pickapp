class CarsController < ApplicationController
  def index
    @cars = current_user.cars.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = current_user.cars.build car_params
    if @car.save
      redirect_to user_path(current_user), notice: "Macchina aggiunta con successo"
    else
      render :new
    end
  end

  def destroy
    @car = Car.find params[:id]
    if @car
      @car.destroy
      redirect_to cars_path, notice: "Macchina eliminata con successo"
    end
  end

  private

  def car_params
    params.require(:car).permit(
      :plate, :sits, :can_smoke, :animals_allowed, :cc,
      :notes, :model, :car_category_id, :user_id
    )
  end
end