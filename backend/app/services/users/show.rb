# frozen_string_literal: true

module Users
  class Show < Core::Service
    def call(id)
      user = User.find(id)
      UsersSerializer.new(user).serializable_hash[:data][:attributes]
    rescue ActiveRecord::RecordNotFound then false
    end
  end
end
