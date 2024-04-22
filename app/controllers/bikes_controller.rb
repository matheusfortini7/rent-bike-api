class BikesController < ApplicationController
  def create
    @bike = Bike.new(bike_params)

    if @bike.save
      render json: { brand: @bike.brand, model: @bike.model, color: @bike.color }, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def index
    render json: BikesRepresenter.new(Bike.all)
  end

  def show

  end

  private

  def bike_params
    params.require(:bike).permit(:brand, :model, :color)
  end
end
