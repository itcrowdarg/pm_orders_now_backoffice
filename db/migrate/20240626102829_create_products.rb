class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :location, foreign_key: true
      t.references :product_category, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.boolean :available

      t.timestamps
    end
  end
end
