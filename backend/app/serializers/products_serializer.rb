# frozen_string_literal: true

class ProductsSerializer
  include JSONAPI::Serializer
  set_type :product

  attributes :id, :name, price, portion_weight_grams, :desription, image
  attribute :ingredients, if: proc { |_product, detailed_view| detailed_view == true }
end
