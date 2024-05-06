# frozen_string_literal: true

class User < ApplicationRecord
  before_create :set_default_role_customer

  enum :role, %i[admin owner customer]
  validates :last_name, :first_name, :email, :role, presence: true
  validates :last_name, :first_name, length: { maximum: 30 }
  validates :email, uniqueness: { case_sensitive: false }, length: { in: 5..50 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  private

  def set_default_role_customer
    self.role = 'customer'
  end
end
