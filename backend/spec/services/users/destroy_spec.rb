# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Destroy do
  describe 'call' do
    let(:user) { create(:user) }
    let(:id) { user.id }

    it 'destroy user' do
      described_class.new.call(id)
      expect(User.find_by(id:)).to be_nil
    end

    context 'when user does not exist' do
      let(:id) { user.id + 1 }

      it 'returns false' do
        expect(described_class.new.call(id)).to be(false)
      end
    end
  end
end
