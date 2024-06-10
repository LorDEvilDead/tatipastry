module Products
    class Show < Core::Service
        def call(id, params)
            product = product.find(id)
            @params = params
            rescue ActiveRecord::RecordNotFound then false
            update_product.save ? ProductsSerializer.new(product, { params:{ detailed_view: true } }).serializable_hash[:data][:attributes]
        end

        private

        def update_product
            product.update(params)
        end
    end
end