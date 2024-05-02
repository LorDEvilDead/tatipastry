# frozen_string_literal: true

# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  def index
    render json: { message: 'Hello, World from Rails!' }
  end
end
