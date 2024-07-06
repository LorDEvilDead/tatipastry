# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Products::Show do
  describe 'call' do
    let(:product) { create(:product) }
    let(:id) { product.id }

    it 'return requested product' do
      expect(described_class.new.call(id)[:id]).to eq(id)
    end

    context 'when product does not exist' do
      let(:id) { product.id + 1 }

      it 'return false' do
        expect(described_class.new.call(id)).to be(false)
      end
    end
  end
end
