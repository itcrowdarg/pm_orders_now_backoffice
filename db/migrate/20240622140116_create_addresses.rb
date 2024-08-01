class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.references :normal_user, foreign_key: { to_table: :users }, index: true
      t.string :name
      t.string :address_line
      t.string :city
      t.string :state
      t.string :postal_code
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
