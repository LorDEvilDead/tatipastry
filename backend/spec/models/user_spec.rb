# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject(:user) { described_class.create(params) }

  let(:params) { { first_name:, last_name:, email:, encrypted_password:, role: } }
  let(:first_name) { 'Firstname' }
  let(:last_name) { 'Lastname' }
  let(:email) { 'email@example.com' }
  let(:encrypted_password) { 'EncryptedPassword' }
  let(:role) { 'customer' }

  it 'creates a customer' do
    expect(user.role).to eq 'customer'
  end

  context "when role 'owner'" do
    let(:role) { 'owner' }

    it 'creates a customer' do
      expect(user.role).to eq 'customer'
    end
  end

  context 'when role empty' do
    let(:params) { { first_name:, last_name:, encrypted_password: } }

    it 'creates a customer' do
      expect(user.role).to eq 'customer'
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(30) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(30) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_least(5).is_at_most(50) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to allow_value('user@example.com').for(:email) }
    it { is_expected.not_to allow_value('invalid_email').for(:email) }
  end
end
