# frozen_string_literal: true

require 'pry'
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self
  before_validation :set_default_role_customer, on: :create

  enum :role, %i[admin owner customer]
  validates :first_name, :email, :role, presence: true
  validates :last_name, :first_name, length: { maximum: 30 }
  validates :email, uniqueness: { case_sensitive: false }, length: { in: 5..50 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  private

  def set_default_role_customer
    self.role = 'customer'
  end
end
