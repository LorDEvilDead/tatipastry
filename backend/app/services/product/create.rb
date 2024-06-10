module Products
    class Create < Core::Service
        def call(params)
            @params = params
            product.save ? ProductsSerializer.new(product, { params:{ detailed_view: true } }).serializable_hash[:data][:attributes]
        end

        private

        def product
            @product ||= Product.save(params)
        end
    end
end
