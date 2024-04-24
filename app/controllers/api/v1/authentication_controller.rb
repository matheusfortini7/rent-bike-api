module Api
  module V1
    class AuthenticationController < ApplicationController
      class AuthenticationError < StandardError; end
      def create
        user = User.find_by(username: params[:username])
        raise AuthenticationError unless user.authenticate(params.require(:password))

        token = AuthenticationTokenService.encode(user.id)
        render json: { token: token }
      end
    end
  end
end
