# frozen_string_literal: true

module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        include RackSessionsFix
        respond_to :json
        def create
          create_user(user_params)
          @created_user ? (render json: @created_user, status: :created) : (head :bad_request)
        end

        private

        def create_user(user_params)
          @created_user = Users::Create.new.call(user_params)
        end

        def respond_with(current_user, _opts = [])
          if resource.persisted?
            render json: {
              status: { code: 200, message: 'Signed up successfully.' },
              data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
            }
          else
            render json: {
              status: { message: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}" }
            }, status: :unprocessable_entity
          end
        end
      end
    end
  end
end
