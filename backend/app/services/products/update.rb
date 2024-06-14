# frozen_string_literal: true

module Products
  class Update < Core::Service
    def call(id, params)
      product = product.find(id)
      @params = params
    rescue ActiveRecord::RecordNotFound then
      if update_product.save
        ProductsSerializer.new(product,
                               { params: { detailed_view: true } }).serializable_hash[:data][:attributes]
      else
        false
      end
    end

    private

    def update_product
      product.update(params)
    end
  end
end
