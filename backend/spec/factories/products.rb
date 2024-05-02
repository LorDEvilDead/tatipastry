FactoryBot.define do
  factory :product do
    price { "9.99" }
    weight { 1 }
    consist { "MyString" }
    disription { "MyText" }
    photo { "MyString" }
    name { "MyString" }
  end
end
