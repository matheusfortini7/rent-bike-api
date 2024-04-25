module Api
  module V1
    class RentsController < ApplicationController
      include ActionController::HttpAuthentication::Token

      before_action :authenticate_user

      def create
        rent = Rent.new(rent_params.merge(bike_id: params[:bike_id], client_id: params[:client_id]))

        if rent.save
          render json: RentRepresenter.new(rent).as_json, status: :created
        else
          render status: :unprocessable_entity
        end
      end

      def index
        rents = Rent.all
        render json: RentsRepresenter.new(rents).as_json
      end

      def show
        rent = find_rent
        render json: RentRepresenter.new(rent).as_json
      end

      def update
        rent = find_rent
        if rent.update(rent_params)
          render json: RentRepresenter.new(rent).as_json, status: :no_content
        else
          render status: :unprocessable_entity
        end
      end

      def destroy
        rent = find_rent
        rent.destroy
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

      def find_rent
        Rent.find(params[:id])
      end

      def rent_params
        params.require(:rent).permit(:start_date, :end_date, :value, :local, :bike_id, :client_id)
      end
    end
  end
end
