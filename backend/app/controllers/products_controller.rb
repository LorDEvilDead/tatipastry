class ProductsController < ApplicationController
    def new
    end

    def create
    end
    
    def show
        id = params.extract_value(:id)
        @product = product.find(id)
    end
    
    private
end
