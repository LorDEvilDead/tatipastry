# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true, lenght: { maximum: 100 }
end
