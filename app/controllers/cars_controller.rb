class CarsController < ApplicationController
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

  private

  def car_params
    params.require(:car).permit(
      :plate, :sits, :can_smoke, :animals_allowed, :cc,
      :notes, :model, :car_category_id, :user_id
    )
  end
end