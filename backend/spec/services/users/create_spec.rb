# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Create do
  describe 'call' do
    let(:params) { { first_name:, last_name:, email:, password: } }
    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password }

    it 'create user in database' do
      described_class.new.call(params)
      expect(User.last.email).to eq(email)
    end

    context 'when params are incorrect' do
      let(:email) { 'ifjiejp12eipip' }

      it 'does not create user in database' do
        expect(described_class.new.call(params)).to be(false)
      end
    end
  end
end
