module Product
    class Create < Core::Service
        def call (params:, user:)
            @params = params
            @user = user
            create_product
        end

        private
        attr_reader :params, :user

        def create_product
            product.user_id = user.id
            product.save ? Success(product) : Failure(product.errors)
        end
        
        def product
            @product ||= Product.new(params)
        end
    end
end