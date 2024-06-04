class ProductsController < ApplicationController
    before_action :set_product, only: %i[show update destroy]

    #GET /products
    def index
        products = Product.all
        
        render json: products.to_json(only: [:image, :price, :name, :portion_weight_grams, :ingredients])
    end

    #GET /products/1
    def show 
         render json: @product.to_json(only: [:price, :portion_weight_grams, :ingredients, :desription, :image, :name])
    end

    #POST /products
    def create 
        product = Product.new(product_params)
        if product.save
            render json: product, status: :created, location: product
        else 
            render json: product.errors, status: :unprocessable_entity
        end
    end

    #PUT/PATCH /products/1
    def update
        if @product.update(product_params)
            render json: @product
        else 
            render json: @product.errors, status: :unprocessable_entity
        end
    end

    #DELETE /products/1
    def destroy
        @product.destroy
    end

    private
    #Use callbacks to share common setup or constrains between actions.
    def set_product
        @product = product.find(params[:id])
    end

    #only allow a list of trusted parameters though.
    def product_params
        params.require(:product).permit(:price, :portion_weight_grams, :ingredients, :desription, :image, :name)
    end
end