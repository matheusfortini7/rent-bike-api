module Api
  module V1
    class BikesController < ApplicationController
      include ActionController::HttpAuthentication::Token

      before_action :authenticate_user

      def create
        bike = Bike.new(bike_params)

        if bike.save
          render json: BikeRepresenter.new(bike).as_json, status: :created
        else
          render status: :unprocessable_entity
        end
      end

      def index
        bikes = Bike.all
        render json: BikesRepresenter.new(bikes).as_json
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

      def authenticate_user
        token, _options = token_and_options(request)
        user_id = AuthenticationTokenService.decode(token)
        User.find_by(user_id)
        rescue ActiveRecord::RecordNotFound, JWT::DecodeError
          render status: :unauthorized
      end

      def find_bike
        Bike.find(params[:id])
      end

      def bike_params
        params.require(:bike).permit(:brand, :model, :color)
      end
    end
  end
end
