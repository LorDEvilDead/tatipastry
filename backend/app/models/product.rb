# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  # validates :price
  # validates :portion_weight_grams
  # validates :ingredients
  # validates :description
  # validates :image
end
