# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Products::Create do
  describe 'call' do
    let(:params) { { name:, price:, portion_weight_grams:, ingredients:, description:, image: } }
    let(:name) { Faker::Coffee.blend_name }
    let(:price) { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    let(:portion_weight_grams) { Faker::Types.rb_integer }
    let(:ingredients) { Faker::Coffee.notes }
    let(:description) { Faker::Food.description }
    let(:image) { Faker::Types.rb_string }

    it 'create product in database' do
      described_class.new.call(params)
      expect(Product.last.name).to eq(name)
    end

    context 'when params are incorrect' do
      let(:name) { ' ' }

      it 'does not create product in db' do
        expect(described_class.new.call(params)).to be(false)
      end
    end
  end
end
