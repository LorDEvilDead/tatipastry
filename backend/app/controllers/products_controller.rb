class ProductsController < ApplicationController
    include Dry::Monads::Result::Mixin

    def call(params:, owner:)
        @params = params
        @user = user
        cteate_product
    end

    def create
        case product_creation
        in Success(product)
          render json: prepare_json(product), status: :created
        in Failure(error)
          render json: { errors: error.messages }, status: :unprocessable_entity
        end
    end

 
    
    def show
        id = params.extract_value(:id)
        @product = product.find(id)
    end
    
    private
    attr_reader :params, :owner
    
    def create_product
        product.owner_id = owner.id
        product.save ? Success(product) : Failure(product.errors)
    end

    def product
        @product ||= Product.new(params)
    end

    def product_creation
    Products::Create.new.call(params: product_params)
    end

    def product_params
        params.rquire(name: product_name).permit(price: product_price, 
        weight: product_weight, 
        consist: product_consist,
        disription: product_disription,
        photo: product_photo)
    end
end
