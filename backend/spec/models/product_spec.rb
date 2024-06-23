# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product do
  subject(:product) do
    described_class.new(name: 'cupcake')
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      product.name = nil
      expect(product).not_to be_valid
    end

    # 106 symbols in string
    it 'is not valid with > maximum symbols' do
      product.name = 'so many symbols with whitespace and now 40 symbols oops now 59? no 66... 75 it seems like true and now 106'
      expect(product).not_to be_valid
    end

    # 100 symbols
    it 'is valid with = maximum symbols' do
      product.name = 'so many symbols with whitespace and now 40 symbols oops now 59? no 66... 75 it seems like true a 100'
      expect(product).to be_valid
    end

    # 101 symbols
    it 'is valid with = maximum symbols' do
      product.name = 'so many symbols with whitespace and now 40 symbols oops now 59? no 66... 75 it seems like true as 101'
      expect(product).not_to be_valid
    end
  end
end
