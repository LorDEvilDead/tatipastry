# frozen_string_literal: true

module Products
  class Create < Core::Service
    def call(params)
      @params = params
      if product.save
        ProductsSerializer.new(product,
                               { params: { detailed_view: true } }).serializable_hash[:data][:attributes]
      else
        false
      end
    end

    private

    def product
      @product ||= Product.save(params)
    end
  end
end
