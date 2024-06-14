# frozen_string_literal: true

module Products
  class Destroy < Core::Service
    def call(id)
      @product = product.find(id)
      delete_product
    rescue ActiveRecord::RecordNotFound then false
    end

    private

    def delete_product
      @product.destroy
      @product.destroyed?
    end
  end
end
