# frozen_string_literal: true

module Products
  class Update < Core::Service
    def call(id, params)
      @product = Product.find(id)
      @params = params
      update_product
    rescue ActiveRecord::RecordNotFound then false
    end

    private

    def update_product
      @product.update(@params)
    end
  end
end
