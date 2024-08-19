# frozen_string_literal: true

require 'pry'
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :admin, parent: :user do
    after(:create) { |user| user.update(role: 'admin') }
  end

  factory :owner, parent: :user do
    after(:create) { |user| user.update(role: 'owner') }
  end
end
