# frozen_string_literal: true

class UsersSerializer
  include JSONAPI::Serializer
  attributes :id, :first_name, :last_name, :email, :role
end
