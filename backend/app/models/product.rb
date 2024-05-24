# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
end
