class ProductsController < ApplicationController
    include Dry::Monads::Result::Mixin

    #replace to monades
    def call(params:, owner:)
        @params = params
        @user = user
        cteate_product
    end

    #POST /products
    def create
        case product_creation
        in Success(product)
          render json: prepare_json(product), status: :created
        in Failure(error)
          render json: { errors: error.messages }, status: :unprocessable_entity
        end
    end

    #PUT/PATCH /products/edit/1
    def update
        case set_product
        in Success(product)
            render json: prepare_json(product), status :updated
        in Failure
            render json: { error: error.messages }, status :unprocessable_entity
        end
    end

    #GET /products/1
    def show
        id = params.extract_value(:id)
        @product = product.find(id)
    end

    #GET /products
    def index
        @products = Product.all
        
        render json @products
    end
    
    #DELETE /products/1
    def destroy
    @product.destroy
    end
    
    private
    #not sure about that
    attr_reader :params, :owner

    # Use callbacks to share common setup or constraints between actions.
    def set_product
        @product = Product.find(product_params[:id])
    end
    
    #need realise monades
    def create_product
        product.owner_id = owner.id
        product.save ? Success(product) : Failure(product.errors)
    end

    #replace to service in next iteration
    def product
        @product ||= Product.new(params)
    end
    # need realise monads
    def product_creation
    Products::Create.new.call(params: product_params)
    end

     # Only allow a list of trusted parameters through.
    def product_params
        params.require(name: product_name).permit(id: product_id,
        price: product_price, 
        portion_weight_grams: product_weight, 
        ingredients: product_ingredients,
        desription: product_desription,
        image: product_image)
    end
end
