# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      # TODO: authorize admin and owner only to see list of all users
      def index
        render json: fetch_users_list, status: :ok
      end

      def show
        find_user
        @user ? (render json: @user, status: :ok) : (head :not_found)
      end

      def update
        update_user(user_params) ? (head :no_content) : (head :unprocessable_entity)
      end

      def destroy
        destroy_user ? (head :ok) : (head :unprocessable_entity)
      end

      private

      def fetch_users_list
        Users::Fetch.new.call
      end

      def find_user
        @user = Users::Show.new.call(params[:id])
      end

      def update_user(user_params)
        Users::Update.new.call(params[:id], user_params)
      end

      def destroy_user
        Users::Destroy.new.call(params[:id])
      end

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password)
      end
    end
  end
end
