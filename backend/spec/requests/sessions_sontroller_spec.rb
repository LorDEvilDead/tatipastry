# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SessionsController' do
  describe 'POST /signin' do
    let(:user) { create(:user) }
    let(:email) { Faker::Internet.email }
    let(:password) { 'Sawq4405' }
    let(:params) { { user: { email:, password: } } }

    before { post('/signin', params:) }

    it 'returns authorized status'
    expect(response).to have_http_status(:ok)
  end
end
