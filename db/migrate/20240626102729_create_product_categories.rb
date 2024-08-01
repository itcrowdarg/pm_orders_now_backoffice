class CreateProductCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :product_categories do |t|
      t.references :location, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
