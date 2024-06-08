# frozen_string_literal: true

module Users
  class Fetch < Core::Service
    def call
      User.all.map { |user| UsersSerializer.new(user).serializable_hash[:data][:attributes] }
    end
  end
end
