class ClientsController < ApplicationController
  module Api
    module V1
      class ClientsController < ApplicationController
        def create
          client = Client.new(client_params)

          if client.save
            render json: ClientRepresenter.new(client).as_json, status: :created
          else
            render status: :unprocessable_entity
          end
        end

        def index
          clientes = Client.all
          render json: ClientsRepresenter.new(clients).as_json
        end

        def show
          client = find_client
          render json: ClientRepresenter.new(client).as_json
        end

        def update
          client = find_client
          if client.update(client_params)
            render json: ClientRepresenter.new(client).as_json, status: :no_content
          else
            render status: :unprocessable_entity
          end
        end

        def destroy
          client = find_client
          client.destroy
          head :no_content
        end

        private

        def find_client
          Client.find(params[:id])
        end

        def client_params
          params.require(:client).permit(:name, :phone, :address)
        end
      end
    end
  end
end
