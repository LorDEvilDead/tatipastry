# frozen_string_literal: true

module Products
  class Show < Core::Service
    def call(id)
      product = product.find(id)
      ProductsSerializer.new(product, { params: { detailed_view: true } }).serializable_hash[:data][:attributes]
    rescue ActiveRecord::RecordNotFound then false
    end
  end
end
