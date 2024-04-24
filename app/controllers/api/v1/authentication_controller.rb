module Api
  module V1
    class AuthenticationController < ApplicationController
      class AuthenticationError < StandardError; end

      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      rescue_from AuthenticationError, with: :handle_unauthenticated

      def create
        if user && user.authenticate(params.require(:password))
          token = AuthenticationTokenService.encode(user.id)
          render json: { token: token }
        else
          raise AuthenticationError
        end
      end

      private

      def user
        @User ||= User.find_by(username: params[:username])
      end

      def parameter_missing(e)
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def handle_unauthenticated
        head :unauthorized
      end
    end
  end
end
