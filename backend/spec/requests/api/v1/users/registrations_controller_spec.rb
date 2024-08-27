# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Users::RegistrationsController do
  describe 'POST api/v1/signup' do
    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password }
    let(:params) { { user: { first_name:, last_name:, email:, password: } } }

    before { post('/signup', params:) }

    it 'return 201 status created' do
      expect(response).to have_http_status(:created)
    end

    it 'creates user in database' do
      expect(User.last.email).to eq(email)
    end

    context 'when email address is invalid' do
      let(:email) { 'randomsetofchars!!!1' }

      it 'returns an error' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
