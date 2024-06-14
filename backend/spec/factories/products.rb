# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    weight { Faker::Types.rb_integer }
    consist { Faker::Coffee.notes }
    desription { Faker::Food.description }
    image { Faker::Types.rb_string }
    name { Faker::Coffee.blend_name }
  end
end
