class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :normal_user, foreign_key: { to_table: :users }, index: true
      t.references :location, foreign_key: true
      t.decimal :total_price, precision: 10, scale: 2
      t.string :status

      t.timestamps
    end
  end
end
