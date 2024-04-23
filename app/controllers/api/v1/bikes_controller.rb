module Api
  module V1
    class BikesController < ApplicationController
      def create
        bike = Bike.new(bike_params)

        if bike.save
          render json: BikeRepresenter.new(bike).as_json, status: :created
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

      def update
        bike = find_bike
        if bike.update(bike_params)
          render json: BikeRepresenter.new(bike).as_json, status: :no_content
        else
          render status: :unprocessable_entity
        end
      end

      def destroy
        bike = find_bike

        bike.destroy
        head :no_content
      end

      private

      def find_bike
        Bike.find(params[:id])
      end

      def bike_params
        params.require(:bike).permit(:brand, :model, :color)
      end
    end
  end
end
