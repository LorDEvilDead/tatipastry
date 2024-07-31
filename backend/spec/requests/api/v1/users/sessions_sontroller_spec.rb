# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Users::SessionsController do
  describe 'POST /login' do
    let(:user) { create(:user) }
    let(:email) { user.email }
    let(:password) { user.password }
    let(:params) { { user: { email:, password: } } }

    before { post('/login', params:) }

    it 'returns authorized status' do
      expect(response).to have_http_status(:ok)
    end
  end
end
