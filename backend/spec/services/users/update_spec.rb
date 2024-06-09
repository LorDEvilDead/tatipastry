# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Update do
  describe 'call' do
    let(:user) { create(:user) }
    let(:id) { user.id }
    let(:params) { { email: } }
    let(:email) { "updated#{user.email}" }

    it 'updates the user' do
      described_class.new.call(id, params)
      expect(User.find(id).email).to eq(email)
    end

    context 'when params are incorrect' do
      let(:email) { 'ifjiejp12eipip' }

      it 'returns false' do
        expect(described_class.new.call(id, params)).to be(false)
      end

      it 'does not updates the user' do
        described_class.new.call(id, params)
        expect(User.find(id).email).not_to eq(email)
      end
    end
  end
end
