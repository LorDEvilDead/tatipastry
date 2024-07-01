# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product do
  subject(:product) { described_class.create(params) }

  let(:params) { { name:, price:, portion_weight_grams:, ingredients: } }
  let(:name) { 'name' }
  let(:price) { 10.00 }
  let(:portion_weight_grams) { 1000 }
  let(:ingredients) { 'ingredients' }

  it 'creates a product' do
    expect(product.name).to eq 'name'
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to allow_value('name').for(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(100) }

    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to allow_value(10.05).for(:price) }
    it { is_expected.not_to allow_value('a string').for(:price) }

    it { is_expected.to validate_presence_of(:portion_weight_grams) }
    it { is_expected.to allow_value(100).for(:portion_weight_grams) }
    it { is_expected.not_to allow_value('string').for(:portion_weight_grams) }
    it { is_expected.not_to allow_value(5.2).for(:portion_weight_grams) }

    it { is_expected.to validate_presence_of(:ingredients) }
    it { is_expected.to allow_value('igredients').for(:ingredients) }
  end
end
