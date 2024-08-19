# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Users::SessionsController do
  describe 'POST /login' do
    let(:user) { create(:user) }
    let(:email) { user.email }
    let(:password) { user.password }
    let(:params) { { user: { email:, password: } } }
    let(:secret_key) { Rails.application.secret_key_base }
    let(:token) { response.headers['Authorization'].slice(7..) }

    before { post('/login', params:, as: :json) }

    it 'returns authorized status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns a valid token' do
      expect((JWT.decode(token, Rails.application.credentials.devise_jwt_secret_key!)[0])['jti']).to eq(user.jti)
    end

    context 'failed authorization' do
      let(:password) { Faker::Internet.password }

      it 'return unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'delete /logout' do
    let(:user) { create(:user) }
    let(:email) { user.email }
    let(:password) { user.password }
    let(:params) { { user: { email:, password: } } }
    let(:secret_key) { Rails.application.secret_key_base }
    let(:token) { response.headers['Authorization'] }

    before { post('/login', params:, as: :json) }

    it 'deletes the JWT' do
      delete('/logout', headers: { Authorization: token })
      expect(response).to have_http_status(:ok)
    end
  end
end
