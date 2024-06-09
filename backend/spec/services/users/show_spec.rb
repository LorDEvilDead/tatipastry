# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Show do
  describe 'call' do
    let(:user) { create(:user) }
    let(:id) { user.id }

    it 'returns the requested user' do
      expect(described_class.new.call(id)[:id]).to eq(id)
    end

    context 'when user does not exist' do
      let(:id) { user.id + 1 }

      it 'returns false' do
        expect(described_class.new.call(id)).to be(false)
      end
    end
  end
end
