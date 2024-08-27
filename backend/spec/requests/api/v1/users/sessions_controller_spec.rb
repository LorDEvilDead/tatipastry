# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe Api::V1::Users::SessionsController do
  describe 'POST /login' do
    let(:user) { create(:user) }
    let(:email) { user.email }
    let(:password) { user.password }
    let(:params) { { user: { email:, password: } } }
    let(:token) { response.headers['Authorization'].slice(7..) }

    before { post('/login', params:, as: :json) }

    it 'returns authorized status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns a valid token' do
      expect(JWT.decode(token, Rails.application.credentials.devise_jwt_secret_key!).first['jti']).to eq(user.jti)
    end

    context 'when auth with incorrect password' do
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
    let(:token) { response.headers['Authorization'] }

    before { post('/login', params:, as: :json) }

    it 'deletes the JWT' do
      delete('/logout', headers: { Authorization: token })
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'when token expired' do
    let(:user) { create(:user) }
    let(:email) { user.email }
    let(:password) { user.password }
    let(:params) { { user: { email:, password: } } }
    let(:token) { response.headers['Authorization'].slice(7..) }

    before { post('/login', params:, as: :json) }

    it 'return the jti' do
      decoding = JWT.decode(token, Rails.application.credentials.devise_jwt_secret_key!).first
      decoding['exp'] = 1.second.ago.to_i
      header = JWT.encode(decoding, Rails.application.credentials.devise_jwt_secret_key!)
      expect { delete('/logout', headers: { Authorization: header }) }.to raise_error(JWT::ExpiredSignature)
    end
  end
end
