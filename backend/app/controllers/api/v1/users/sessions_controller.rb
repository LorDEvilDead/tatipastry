# frozen_string_literal: true

module Api
  module V1
    module Users
      class SessionsController < Devise::SessionsController
        include RackSessionsFix
        # binding.pry
        respond_to :json

        private

        def respond_with(current_user, _opts = {})
          render json: {
            status: {
              code: 200, message: 'Logged in successfully.',
              data: { user: UsersSerializer.new(current_user).serializable_hash[:data][:attributes] }
            }
          }, status: :ok
        end

        def jwt_payload
          JWT.decode(request.headers['Authorization'].split.last,
                     Rails.application.credentials.devise_jwt_secret_key!).first
        end

        def current_user
          User.find(jwt_payload['sub'])
        end

        def respond_to_on_destroy
          jwt_payload && current_user if request.headers['Authorization'].present?
          if current_user
            (render json: { status: 200, message: 'Logged out successfully.' },
                    status: :ok)
          else
            (render json: {
              status: 401,
              message: "Couldn't find an active session."
            }, status: :unauthorized)
          end
        end
      end
    end
  end
end
