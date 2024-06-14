# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Products::Update do
  describe 'call' do
    let(:product) { create(:product) }
    let(:id) { product.id }
    let(:params) { { name:, price:, weight:, consist:, description:, image: } }
    let(:name) { "updated#{product.name}" }
    let(:price) { "updated#{product.price}" }
    let(:weight) { "updated#{product.weight}" }
    let(:consist) { "updated#{product.consist}" }
    let(:desription) { "updated#{product.description}" }
    let(:image) { "updated#{product.image}" }

    it 'updates product' do
      described_class.new.call(id, params)
      expect(Product.find(id).name).to eq(name)
    end

    context 'when params are incorrect' do
      let(:name) { ' ' }

      it 'return false' do
        expect(described_class.new.call(id, params)).to be(false)
      end

      it 'does not update product' do
        described_class.new.call(id, params)
        expect(product.find(id).name).not_to eq(name)
      end
    end
  end
end
