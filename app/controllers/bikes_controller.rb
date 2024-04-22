class BikesController < ApplicationController
  def create
    bike = Bike.new(bike_params)

    if bike.save
      render json: { brand: bike.brand, model: bike.model, color: bike.color }, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def index
    render json: BikesRepresenter.new(Bike.all).as_json
  end

  def show
    bike = find_bike
    render json: BikeRepresenter.new(bike).as_json
  end

  private

  def find_bike
    Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:brand, :model, :color)
  end
end
