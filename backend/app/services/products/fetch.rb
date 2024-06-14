# frozen_string_literal: true

module Products
  class Fetch < Core::Service
    def call
      Product.all.map do |product|
        ProductsSerializer.new(product, { params: { detailed_view: false } }).serializable_hash[:data][:attributes]
      end
    end
  end
end
