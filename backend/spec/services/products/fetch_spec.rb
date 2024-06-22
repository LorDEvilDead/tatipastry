# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Products::Fetch do
  describe 'call' do
    before { create_list(:product, 4) }

    it 'returns list of product' do
      expect(described_class.new.call.last[:name]).to eq(Product.last.name)
    end

    it 'returns list of 4 products' do
      expect(described_class.new.call.count).to eq(4)
    end

    it 'returns an array' do
      expect(described_class.new.call).to be_an_instance_of(Array)
    end
  end
end
