# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Products::Destroy do
  describe 'call' do
    let(:product) { create(:product) }
    let(:id) { product.id }

    it 'destroy product' do
      described_class.new.call(id)
      expect(Product.find_by(id:)).to be_nil
    end

    context 'when product does not exist' do
      let(:id) { product.id + 1 }

      it 'return false' do
        expect(described_class.new.call(id)).to be(false)
      end
    end
  end
end
