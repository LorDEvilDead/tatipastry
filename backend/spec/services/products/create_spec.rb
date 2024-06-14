# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Products::Create do
  describe 'call' do
    let(:params) { { name:, price:, weight:, consist:, description:, image: } }
    let(:name) { Faker::Coffee.blend_name }
    let(:price) { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    let(:weight) { Faker::Types.rb_integer }
    let(:consist) { Faker::Coffee.notes }
    let(:desription) { Faker::Food.description }
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
