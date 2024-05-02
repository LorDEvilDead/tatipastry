class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.decimal :price
      t.integer :weight
      t.string :consist
      t.text :disription
      t.string :photo
      t.string :name

      t.timestamps
    end
    add_index :products, :name
  end
end
