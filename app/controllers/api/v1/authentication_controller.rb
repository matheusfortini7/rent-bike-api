module Api
  module V1
    class AuthenticationController < ApplicationController
      def create
        user = User.find_by(username: params[:username])

        token = AuthenticationTokenService.encode(user.id)
        render json: { token: token }
      end
    end
  end
end
