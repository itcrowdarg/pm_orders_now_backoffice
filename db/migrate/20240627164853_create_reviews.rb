class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :normal_user, foreign_key: { to_table: :users }, index: true
      t.references :location, null: false, foreign_key: true
      t.integer :score, null: false
      t.text :comment

      t.timestamps
    end
  end
end
