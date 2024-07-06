# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.decimal :price
      t.integer :portion_weight_grams
      t.string :ingredients
      t.text :description
      t.string :image
      t.string :name

      t.timestamps
    end
    add_index :products, :name
  end
end
