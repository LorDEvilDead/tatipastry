# frozen_string_literal: true

RSpec.describe Api::V1::UsersController do
  describe 'GET /users' do
    before do
      create_list(:user, 5)
      get('/api/v1/users')
    end

    it 'returns ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns 5 instances' do
      expect(response.parsed_body.length).to eq(5)
    end
  end

  describe 'GET /users/:id' do
    let(:user) { create(:user) }
    let(:id) { user.id }

    before { get("/api/v1/users/#{id}") }

    it 'returns ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the user' do
      expect(response.parsed_body['email']).to eq(user.email)
    end

    context 'when user not found' do
      let(:id) { user.id + 1 }

      it 'returns an error' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'PUT /users/:id' do
    let(:user) { create(:user) }
    let(:email) { "Updated#{user.email}" }
    let(:params) { { user: { email: } } }

    before { put("/api/v1/users/#{user.id}", params:) }

    it 'returns no content status' do
      expect(response).to have_http_status(:no_content)
    end

    it 'updates user first name' do
      expect(User.find(user.id).email).to eq(email.downcase)
    end

    context 'when email address is invalid' do
      let(:email) { 'randomsetofchars!!!1' }

      it 'returns an error' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /users/:id' do
    let(:user) { create(:user) }
    let(:id) { user.id }

    before { delete("/api/v1/users/#{id}") }

    it 'returns ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'delete the user' do
      expect(User.find_by(id:)).to be_nil
    end

    context 'when the user has not been destroyed' do
      let(:id) { user.id + 1 }

      it 'returns an error' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
