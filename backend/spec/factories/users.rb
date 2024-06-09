# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    encrypted_password { Faker::Internet.password }
  end

  factory :admin, parent: :user do
    after(:create) { |user| user.update(role: 'admin') }
  end

  factory :owner, parent: :user do
    after(:create) { |user| user.update(role: 'owner') }
  end
end
