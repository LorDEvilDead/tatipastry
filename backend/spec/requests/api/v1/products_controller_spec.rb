# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ProductsController do
  describe 'GET /products' do
    before do
      create_list(:product, 10)
      get('/api/v1/products')
    end

    it 'return ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns 10 instances' do
      expect(response.parsed_body.length).to eq(10)
    end
  end

  describe 'GET /products/:id' do
    let(:product) { create(:product) }
    let(:id) { product.id }

    before { get("/api/v1/products/#{id}") }

    it 'return ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'return the product' do
      expect(response.parsed_body['name']).to eq(product.name)
    end

    context 'when product not found' do
      let(:id) { product.id + 1 }

      it 'returns error' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST /product' do
    let(:name) { Faker::Coffee.blend_name }
    let(:price) { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    let(:portion_weight_grams) { Faker::Types.rb_integer }
    let(:ingredients) { Faker::Coffee.notes }
    let(:description) { Faker::Food.description }
    let(:image) { Faker::Types.rb_string }
    let(:params) { { product: { name:, price:, portion_weight_grams:, ingredients:, description:, image: } } }

    before { post('/api/v1/products', params:) }

    it 'returns created status' do
      expect(response).to have_http_status(:created)
    end

    it 'creates product in db' do
      expect(Product.last.name).to eq(name)
    end

    context 'when name is invalid' do
      let(:name) { ' ' }

      it 'returns an error' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'PUT /products/:id' do
    let(:product) { create(:product) }
    let(:name) { "Updated#{product.name}" }
    let(:params) { { product: { name: } } }

    before { put("/api/v1/products/#{product.id}", params:) }

    it 'returns no content status' do
      expect(response).to have_http_status(:no_content)
    end

    it 'updates product name' do
      expect(Product.find(product.id).name).to eq(name)
    end

    context 'when name is invalid' do
      let(:name) { ' ' }

      it 'returns an error' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /products/:id' do
    let(:product) { create(:product) }
    let(:id) { product.id }

    before { delete("/api/v1/products/#{id}") }

    it 'returns ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'delete the product' do
      expect(Product.find_by(id:)).to be_nil
    end

    context 'when the product not found' do
      let(:id) { product.id + 1 }

      it 'returns an error' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
