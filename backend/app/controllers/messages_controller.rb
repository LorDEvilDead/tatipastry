# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
    def index
        render plain: "Hell, World from Rails!"
    end
  end
  