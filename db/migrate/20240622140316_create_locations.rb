class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.boolean :is_active, default: true
      t.boolean :is_featured, default: false
      t.decimal :average_rating, precision: 3, scale: 1, default: 0.0
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
