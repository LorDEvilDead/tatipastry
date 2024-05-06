# frozen_string_literal: true

FactoryBot.define do
  factory :admin, class: 'User' do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    encrypted_password { Faker::Internet.password }
    role { 'admin' }
  end

  factory :owner, class: 'User' do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    encrypted_password { Faker::Internet.password }
    role { 'owner' }
  end

  factory :customer, class: 'User' do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    encrypted_password { Faker::Internet.password }
    role { 'customer' }
  end
end
