# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :portion_weight_grams, presence: true, numericality: { only_integer: true }
  validates :ingredients, presence: true
  validates :price, numericality: true, presence: true
end
